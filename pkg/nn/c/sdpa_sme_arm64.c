/*
 * Copyright 2025 go-highway Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// SME Flash Attention for ARM64 — Multi-Tile (4 ZA tiles)
//
// Uses all 4 ZA tiles in a 2x2 arrangement for 32x32 score blocks (f32)
// or 16x16 score blocks (f64). FlashAttention-2 with online softmax.
//
// Memory: O(seqLen * headDim) — never materializes full scores matrix.
//
// Layout (f32, 32x32 score block):
//                kv cols 0-15    kv cols 16-31
//   q rows 0-15:    ZA0              ZA2
//   q rows 16-31:   ZA1              ZA3
//
// Inputs:
//   qt: [headDim, seqLen] (pre-transposed Q for contiguous column loads)
//   kt: [headDim, kvLen]  (pre-transposed K for contiguous column loads)
//   v:  [kvLen, headDim]  (row-major)
//   mask: [seqLen, kvLen] or NULL
//   output: [seqLen, headDim] (row-major)
//
// NEON intrinsics cannot be used inside __arm_streaming functions.
// All non-FMOPA operations use SVE intrinsics or scalar C.

// GOAT's C parser uses GOAT_PARSER=1, clang doesn't
#ifndef GOAT_PARSER
#include <arm_sme.h>
#endif

// =============================================================================
// sdpa_fmopa_f32: Multi-tile SME Flash Attention for float32
// =============================================================================
//
// qt is [headDim, seqLen] (pre-transposed Q)
// kt is [headDim, kvLen]  (pre-transposed K)
// v is [kvLen, headDim], mask is [seqLen, kvLen] or NULL
// output is [seqLen, headDim]
//
// Requires seqLen, kvLen, headDim all multiples of 16, all >= 32.
//
// func sdpa_fmopa_f32(qt, kt, v, mask, output, pdims, pscale unsafe.Pointer)
// pdims: [0]=seqLen, [1]=kvLen, [2]=headDim
void sdpa_fmopa_f32(float *qt, float *kt, float *v, float *mask,
                      float *output,
                      long *pdims, float *pscale)
    __arm_streaming __arm_out("za") {
    long seqLen = pdims[0];
    long kvLen = pdims[1];
    long headDim = pdims[2];
    float scale = *pscale;

    if (seqLen <= 0) return;
    if (kvLen <= 0) return;
    if (headDim <= 0) return;

    svbool_t pg = svptrue_b32();

    // SVE exp f32 constants
    svfloat32_t sv_inv_ln2 = svdup_f32(1.44269504088896341f);
    svfloat32_t sv_ln2_hi  = svdup_f32(0.693359375f);
    svfloat32_t sv_ln2_lo  = svdup_f32(-2.12194440e-4f);
    svfloat32_t sv_c1 = svdup_f32(1.0f);
    svfloat32_t sv_c2 = svdup_f32(0.5f);
    svfloat32_t sv_c3 = svdup_f32(0.16666666666666666f);
    svfloat32_t sv_c4 = svdup_f32(0.041666666666666664f);
    svfloat32_t sv_c5 = svdup_f32(0.008333333333333333f);
    svfloat32_t sv_c6 = svdup_f32(0.001388888888888889f);
    svint32_t sv_bias = svdup_s32(127);
    svfloat32_t sv_exp_min = svdup_f32(-87.3365f);
    svfloat32_t sv_zero = svdup_f32(0.0f);
    svfloat32_t sv_scale = svdup_f32(scale);

    float negInfVal = -1.0f / 0.0f;
    svfloat32_t sv_neginf = svdup_f32(negInfVal);

    // Process Q in blocks of 32 rows (4-tile), 16-row remainder with 2-tile
    for (long qi = 0; qi < seqLen; qi += 32) {
        long qBlock = 32;
        if (qi + qBlock > seqLen) {
            qBlock = seqLen - qi;
        }

        // Per-row running max (m) and sum (l) for online softmax
        // Use 32 slots; for qBlock=16 remainder, only first 16 used
        float m_arr[32];
        float l_arr[32];
        for (int r = 0; r < 32; r++) {
            m_arr[r] = negInfVal;
            l_arr[r] = 0.0f;
        }

        // Zero output accumulator for this Q block
        for (long r = 0; r < qBlock; r++) {
            for (long d = 0; d < headDim; d++) {
                output[(qi + r) * headDim + d] = 0.0f;
            }
        }

        // Iterate over K/V in blocks of 32 columns (4-tile)
        for (long kj = 0; kj < kvLen; kj += 32) {
            long kBlock = 32;
            if (kj + kBlock > kvLen) {
                kBlock = kvLen - kj;
            }

            // =====================================================================
            // Phase 1: Q@K^T → score tiles using FMOPA
            // =====================================================================
            svzero_za();

            if (qBlock == 32) {
                if (kBlock == 32) {
                    // Full 4-tile: 32 Q rows × 32 KV cols
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat32_t a0 = svld1_f32(pg, qt + dd * seqLen + qi);
                        svfloat32_t a1 = svld1_f32(pg, qt + dd * seqLen + qi + 16);
                        svfloat32_t b0 = svld1_f32(pg, kt + dd * kvLen + kj);
                        svfloat32_t b1 = svld1_f32(pg, kt + dd * kvLen + kj + 16);
                        svmopa_za32_f32_m(0, pg, pg, a0, b0);
                        svmopa_za32_f32_m(1, pg, pg, a1, b0);
                        svmopa_za32_f32_m(2, pg, pg, a0, b1);
                        svmopa_za32_f32_m(3, pg, pg, a1, b1);
                    }
                }
                if (kBlock == 16) {
                    // 2-tile: 32 Q rows × 16 KV cols (ZA0 + ZA1)
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat32_t a0 = svld1_f32(pg, qt + dd * seqLen + qi);
                        svfloat32_t a1 = svld1_f32(pg, qt + dd * seqLen + qi + 16);
                        svfloat32_t b0 = svld1_f32(pg, kt + dd * kvLen + kj);
                        svmopa_za32_f32_m(0, pg, pg, a0, b0);
                        svmopa_za32_f32_m(1, pg, pg, a1, b0);
                    }
                }
            }
            if (qBlock == 16) {
                if (kBlock == 32) {
                    // 2-tile: 16 Q rows × 32 KV cols (ZA0 + ZA2)
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat32_t a0 = svld1_f32(pg, qt + dd * seqLen + qi);
                        svfloat32_t b0 = svld1_f32(pg, kt + dd * kvLen + kj);
                        svfloat32_t b1 = svld1_f32(pg, kt + dd * kvLen + kj + 16);
                        svmopa_za32_f32_m(0, pg, pg, a0, b0);
                        svmopa_za32_f32_m(2, pg, pg, a0, b1);
                    }
                }
                if (kBlock == 16) {
                    // 1-tile: 16 Q rows × 16 KV cols (ZA0 only)
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat32_t a0 = svld1_f32(pg, qt + dd * seqLen + qi);
                        svfloat32_t b0 = svld1_f32(pg, kt + dd * kvLen + kj);
                        svmopa_za32_f32_m(0, pg, pg, a0, b0);
                    }
                }
            }

            // =====================================================================
            // Phase 2: Read scores from ZA, online softmax, build P_tile
            // =====================================================================
            // First: read all scores from ZA into row-major buffer scores[32][32]
            // using constant tile indices (required by SVE intrinsics)
            float scores_buf[32 * 32];

            // ZA0: rows 0-15, cols 0-15
            for (int row = 0; row < 16; row++) {
                svfloat32_t zr = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                svst1_f32(pg, scores_buf + row * 32, zr);
            }
            if (kBlock > 16) {
                // ZA2: rows 0-15, cols 16-31
                for (int row = 0; row < 16; row++) {
                    svfloat32_t zr = svread_hor_za32_f32_m(svundef_f32(), pg, 2, row);
                    svst1_f32(pg, scores_buf + row * 32 + 16, zr);
                }
            }
            if (qBlock > 16) {
                // ZA1: rows 16-31, cols 0-15
                for (int row = 0; row < 16; row++) {
                    svfloat32_t zr = svread_hor_za32_f32_m(svundef_f32(), pg, 1, row);
                    svst1_f32(pg, scores_buf + (row + 16) * 32, zr);
                }
                if (kBlock > 16) {
                    // ZA3: rows 16-31, cols 16-31
                    for (int row = 0; row < 16; row++) {
                        svfloat32_t zr = svread_hor_za32_f32_m(svundef_f32(), pg, 3, row);
                        svst1_f32(pg, scores_buf + (row + 16) * 32 + 16, zr);
                    }
                }
            }

            // P_tile stored column-major: pt[kv_col * 32 + q_row] for FMOPA P@V
            float pt[32 * 32];

            // Process each score row: scale, mask, online softmax, build P_tile
            for (int row = 0; row < 32; row++) {
                if (row >= qBlock) break;

                float *s_row = scores_buf + row * 32;

                // Scale + mask using SVE
                svfloat32_t sv_s0 = svld1_f32(pg, s_row);
                sv_s0 = svmul_f32_z(pg, sv_s0, sv_scale);
                if (mask) {
                    svfloat32_t sv_m0 = svld1_f32(pg, mask + (qi + row) * kvLen + kj);
                    sv_s0 = svadd_f32_z(pg, sv_s0, sv_m0);
                }
                svst1_f32(pg, s_row, sv_s0);

                svfloat32_t sv_max = sv_s0;

                if (kBlock > 16) {
                    svfloat32_t sv_s1 = svld1_f32(pg, s_row + 16);
                    sv_s1 = svmul_f32_z(pg, sv_s1, sv_scale);
                    if (mask) {
                        svfloat32_t sv_m1 = svld1_f32(pg, mask + (qi + row) * kvLen + kj + 16);
                        sv_s1 = svadd_f32_z(pg, sv_s1, sv_m1);
                    }
                    svst1_f32(pg, s_row + 16, sv_s1);
                    sv_max = svmax_f32_z(pg, sv_max, sv_s1);
                }

                float row_max = svmaxv_f32(pg, sv_max);

                // Online softmax correction
                float m_prev = m_arr[row];
                float m_new = row_max;
                if (m_prev > m_new) {
                    m_new = m_prev;
                }
                m_arr[row] = m_new;

                // alpha = exp(m_prev - m_new)
                float alpha_scalar = 1.0f;
                if (m_prev != negInfVal) {
                    if (m_prev != m_new) {
                        // Compute scalar exp(m_prev - m_new)
                        float ax = m_prev - m_new;
                        if (ax < -87.3365f) ax = -87.3365f;
                        float akf = ax * 1.44269504088896341f;
                        int aki = (int)(akf + (akf >= 0 ? 0.5f : -0.5f));
                        float akff = (float)aki;
                        float ar = ax - akff * 0.693359375f;
                        ar = ar - akff * -2.12194440e-4f;
                        float ap = 0.001388888888888889f;
                        ap = 0.008333333333333333f + ap * ar;
                        ap = 0.041666666666666664f + ap * ar;
                        ap = 0.16666666666666666f + ap * ar;
                        ap = 0.5f + ap * ar;
                        ap = 1.0f + ap * ar;
                        ap = 1.0f + ap * ar;
                        int a_bits = (aki + 127) << 23;
                        float a_scale_val = *(float *)&a_bits;
                        alpha_scalar = ap * a_scale_val;
                    }
                }

                // Rescale previous l and O
                l_arr[row] = alpha_scalar * l_arr[row];
                if (alpha_scalar != 1.0f) {
                    svfloat32_t sv_alpha = svdup_f32(alpha_scalar);
                    long oOff = (qi + row) * headDim;
                    for (long d = 0; d < headDim; d += 16) {
                        svfloat32_t ov = svld1_f32(pg, output + oOff + d);
                        ov = svmul_f32_z(pg, ov, sv_alpha);
                        svst1_f32(pg, output + oOff + d, ov);
                    }
                }

                // SVE exp(s_row - m_new) for first 16 elements
                svfloat32_t sv_mnew = svdup_f32(m_new);
                svfloat32_t sv_x0 = svld1_f32(pg, s_row);
                sv_x0 = svsub_f32_z(pg, sv_x0, sv_mnew);
                sv_x0 = svmax_f32_z(pg, sv_x0, sv_exp_min);

                // Range reduction
                svfloat32_t sv_kf0 = svmul_f32_z(pg, sv_x0, sv_inv_ln2);
                svint32_t sv_ki0 = svcvt_s32_f32_z(pg, sv_kf0);
                svfloat32_t sv_kff0 = svcvt_f32_s32_z(pg, sv_ki0);
                svfloat32_t sv_r0 = svmsb_f32_z(pg, sv_kff0, sv_ln2_hi, sv_x0);
                sv_r0 = svmsb_f32_z(pg, sv_kff0, sv_ln2_lo, sv_r0);

                // Horner polynomial
                svfloat32_t sv_p0 = sv_c6;
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c5);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c4);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c3);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c2);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c1);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c1);

                // 2^k scaling
                svint32_t sv_bits0 = svlsl_n_s32_z(pg, svadd_s32_z(pg, sv_ki0, sv_bias), 23);
                svfloat32_t sv_pow0 = svreinterpret_f32_s32(sv_bits0);
                svfloat32_t sv_exp0 = svmul_f32_z(pg, sv_p0, sv_pow0);

                float row_sum = svaddv_f32(pg, sv_exp0);

                // Store column-major into P_tile for FMOPA P@V
                // pt[col * 32 + row] = exp_val[col]
                float exp_buf0[16];
                svst1_f32(pg, exp_buf0, sv_exp0);
                for (int col = 0; col < 16; col++) {
                    pt[col * 32 + row] = exp_buf0[col];
                }

                if (kBlock > 16) {
                    // SVE exp for elements 16-31
                    svfloat32_t sv_x1 = svld1_f32(pg, s_row + 16);
                    sv_x1 = svsub_f32_z(pg, sv_x1, sv_mnew);
                    sv_x1 = svmax_f32_z(pg, sv_x1, sv_exp_min);

                    svfloat32_t sv_kf1 = svmul_f32_z(pg, sv_x1, sv_inv_ln2);
                    svint32_t sv_ki1 = svcvt_s32_f32_z(pg, sv_kf1);
                    svfloat32_t sv_kff1 = svcvt_f32_s32_z(pg, sv_ki1);
                    svfloat32_t sv_r1 = svmsb_f32_z(pg, sv_kff1, sv_ln2_hi, sv_x1);
                    sv_r1 = svmsb_f32_z(pg, sv_kff1, sv_ln2_lo, sv_r1);

                    svfloat32_t sv_p1 = sv_c6;
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c5);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c4);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c3);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c2);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c1);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c1);

                    svint32_t sv_bits1 = svlsl_n_s32_z(pg, svadd_s32_z(pg, sv_ki1, sv_bias), 23);
                    svfloat32_t sv_pow1 = svreinterpret_f32_s32(sv_bits1);
                    svfloat32_t sv_exp1 = svmul_f32_z(pg, sv_p1, sv_pow1);

                    row_sum += svaddv_f32(pg, sv_exp1);

                    float exp_buf1[16];
                    svst1_f32(pg, exp_buf1, sv_exp1);
                    for (int col = 0; col < 16; col++) {
                        pt[(col + 16) * 32 + row] = exp_buf1[col];
                    }
                }

                l_arr[row] += row_sum;
            }

            // Zero unused P_tile rows (for qBlock < 32)
            for (int row = qBlock; row < 32; row++) {
                for (int col = 0; col < 32; col++) {
                    pt[col * 32 + row] = 0.0f;
                }
            }
            // Zero unused P_tile cols (for kBlock < 32)
            for (int col = kBlock; col < 32; col++) {
                for (int row = 0; row < 32; row++) {
                    pt[col * 32 + row] = 0.0f;
                }
            }

            // =====================================================================
            // Phase 3: P@V → output accumulation using 4-tile FMOPA
            // =====================================================================
            // P_tile is [32 q_rows × 32 kv_cols] stored column-major in pt
            // V block is v[kj:kj+kBlock, :] row-major [kBlock, headDim]
            // Process headDim in 32-col chunks (4-tile), 16-col remainder
            long d = 0;
            for (; d + 32 <= headDim; d += 32) {
                svzero_za();

                // P columns × V rows
                for (int kk = 0; kk < kBlock; kk++) {
                    svfloat32_t p0 = svld1_f32(pg, pt + kk * 32);
                    svfloat32_t p1 = svld1_f32(pg, pt + kk * 32 + 16);
                    svfloat32_t v0 = svld1_f32(pg, v + (kj + kk) * headDim + d);
                    svfloat32_t v1 = svld1_f32(pg, v + (kj + kk) * headDim + d + 16);
                    svmopa_za32_f32_m(0, pg, pg, p0, v0);
                    svmopa_za32_f32_m(1, pg, pg, p1, v0);
                    svmopa_za32_f32_m(2, pg, pg, p0, v1);
                    svmopa_za32_f32_m(3, pg, pg, p1, v1);
                }

                // Accumulate into output: read ZA and add
                for (int row = 0; row < 16; row++) {
                    if (qi + row >= seqLen) break;
                    svfloat32_t r0 = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                    svfloat32_t o0 = svld1_f32(pg, output + (qi + row) * headDim + d);
                    svst1_f32(pg, output + (qi + row) * headDim + d, svadd_f32_z(pg, o0, r0));

                    svfloat32_t r2 = svread_hor_za32_f32_m(svundef_f32(), pg, 2, row);
                    svfloat32_t o2 = svld1_f32(pg, output + (qi + row) * headDim + d + 16);
                    svst1_f32(pg, output + (qi + row) * headDim + d + 16, svadd_f32_z(pg, o2, r2));
                }
                for (int row = 0; row < 16; row++) {
                    if (qi + 16 + row >= seqLen) break;
                    svfloat32_t r1 = svread_hor_za32_f32_m(svundef_f32(), pg, 1, row);
                    svfloat32_t o1 = svld1_f32(pg, output + (qi + 16 + row) * headDim + d);
                    svst1_f32(pg, output + (qi + 16 + row) * headDim + d, svadd_f32_z(pg, o1, r1));

                    svfloat32_t r3 = svread_hor_za32_f32_m(svundef_f32(), pg, 3, row);
                    svfloat32_t o3 = svld1_f32(pg, output + (qi + 16 + row) * headDim + d + 16);
                    svst1_f32(pg, output + (qi + 16 + row) * headDim + d + 16, svadd_f32_z(pg, o3, r3));
                }
            }

            // Remainder: 16-col strip with 2-tile (ZA0 + ZA1)
            if (d < headDim) {
                svzero_za();

                for (int kk = 0; kk < kBlock; kk++) {
                    svfloat32_t p0 = svld1_f32(pg, pt + kk * 32);
                    svfloat32_t p1 = svld1_f32(pg, pt + kk * 32 + 16);
                    svfloat32_t v0 = svld1_f32(pg, v + (kj + kk) * headDim + d);
                    svmopa_za32_f32_m(0, pg, pg, p0, v0);
                    svmopa_za32_f32_m(1, pg, pg, p1, v0);
                }

                for (int row = 0; row < 16; row++) {
                    if (qi + row >= seqLen) break;
                    svfloat32_t r0 = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                    svfloat32_t o0 = svld1_f32(pg, output + (qi + row) * headDim + d);
                    svst1_f32(pg, output + (qi + row) * headDim + d, svadd_f32_z(pg, o0, r0));
                }
                for (int row = 0; row < 16; row++) {
                    if (qi + 16 + row >= seqLen) break;
                    svfloat32_t r1 = svread_hor_za32_f32_m(svundef_f32(), pg, 1, row);
                    svfloat32_t o1 = svld1_f32(pg, output + (qi + 16 + row) * headDim + d);
                    svst1_f32(pg, output + (qi + 16 + row) * headDim + d, svadd_f32_z(pg, o1, r1));
                }
            }
        }

        // Final normalize: O /= l
        for (long r = 0; r < qBlock; r++) {
            if (l_arr[r] == 0.0f) continue;
            float invL = 1.0f / l_arr[r];
            svfloat32_t sv_invL = svdup_f32(invL);
            long oOff = (qi + r) * headDim;
            for (long d = 0; d < headDim; d += 16) {
                svfloat32_t ov = svld1_f32(pg, output + oOff + d);
                ov = svmul_f32_z(pg, ov, sv_invL);
                svst1_f32(pg, output + oOff + d, ov);
            }
        }
    }
}

// =============================================================================
// sdpa_fmopa_f64: Multi-tile SME Flash Attention for float64
// =============================================================================
//
// Same algorithm with 8x8 tiles per ZA, 4-tile = 16x16 output blocks.
//
// Layout (f64, 16x16 score block):
//                kv cols 0-7    kv cols 8-15
//   q rows 0-7:     ZA0            ZA2
//   q rows 8-15:    ZA1            ZA3
//
// Requires seqLen, kvLen, headDim all multiples of 8, all >= 16.
//
// func sdpa_fmopa_f64(qt, kt, v, mask, output, pdims, pscale unsafe.Pointer)
// pdims: [0]=seqLen, [1]=kvLen, [2]=headDim
void sdpa_fmopa_f64(double *qt, double *kt, double *v, double *mask,
                      double *output,
                      long *pdims, double *pscale)
    __arm_streaming __arm_out("za") {
    long seqLen = pdims[0];
    long kvLen = pdims[1];
    long headDim = pdims[2];
    double scale = *pscale;

    if (seqLen <= 0) return;
    if (kvLen <= 0) return;
    if (headDim <= 0) return;

    svbool_t pg = svptrue_b64();

    // SVE exp f64 constants
    svfloat64_t sv_inv_ln2 = svdup_f64(1.4426950408889634);
    svfloat64_t sv_ln2_hi  = svdup_f64(0.6931471803691238);
    svfloat64_t sv_ln2_lo  = svdup_f64(1.9082149292705877e-10);
    svfloat64_t sv_c1 = svdup_f64(1.0);
    svfloat64_t sv_c2 = svdup_f64(0.5);
    svfloat64_t sv_c3 = svdup_f64(0.16666666666666666);
    svfloat64_t sv_c4 = svdup_f64(0.041666666666666664);
    svfloat64_t sv_c5 = svdup_f64(0.008333333333333333);
    svfloat64_t sv_c6 = svdup_f64(0.001388888888888889);
    svfloat64_t sv_c7 = svdup_f64(1.98412698412698412698e-4);
    svfloat64_t sv_c8 = svdup_f64(2.48015873015873015873e-5);
    svint64_t sv_bias = svdup_s64(1023);
    svfloat64_t sv_exp_min = svdup_f64(-708.396);
    svfloat64_t sv_zero = svdup_f64(0.0);
    svfloat64_t sv_scale = svdup_f64(scale);

    double negInfVal = -1.0 / 0.0;

    // Process Q in blocks of 16 rows (4-tile), 8-row remainder
    for (long qi = 0; qi < seqLen; qi += 16) {
        long qBlock = 16;
        if (qi + qBlock > seqLen) {
            qBlock = seqLen - qi;
        }

        double m_arr[16];
        double l_arr[16];
        for (int r = 0; r < 16; r++) {
            m_arr[r] = negInfVal;
            l_arr[r] = 0.0;
        }

        for (long r = 0; r < qBlock; r++) {
            for (long d = 0; d < headDim; d++) {
                output[(qi + r) * headDim + d] = 0.0;
            }
        }

        // Iterate over K/V in blocks of 16 columns (4-tile)
        for (long kj = 0; kj < kvLen; kj += 16) {
            long kBlock = 16;
            if (kj + kBlock > kvLen) {
                kBlock = kvLen - kj;
            }

            // Phase 1: Q@K^T using FMOPA
            svzero_za();

            if (qBlock == 16) {
                if (kBlock == 16) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat64_t a0 = svld1_f64(pg, qt + dd * seqLen + qi);
                        svfloat64_t a1 = svld1_f64(pg, qt + dd * seqLen + qi + 8);
                        svfloat64_t b0 = svld1_f64(pg, kt + dd * kvLen + kj);
                        svfloat64_t b1 = svld1_f64(pg, kt + dd * kvLen + kj + 8);
                        svmopa_za64_f64_m(0, pg, pg, a0, b0);
                        svmopa_za64_f64_m(1, pg, pg, a1, b0);
                        svmopa_za64_f64_m(2, pg, pg, a0, b1);
                        svmopa_za64_f64_m(3, pg, pg, a1, b1);
                    }
                }
                if (kBlock == 8) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat64_t a0 = svld1_f64(pg, qt + dd * seqLen + qi);
                        svfloat64_t a1 = svld1_f64(pg, qt + dd * seqLen + qi + 8);
                        svfloat64_t b0 = svld1_f64(pg, kt + dd * kvLen + kj);
                        svmopa_za64_f64_m(0, pg, pg, a0, b0);
                        svmopa_za64_f64_m(1, pg, pg, a1, b0);
                    }
                }
            }
            if (qBlock == 8) {
                if (kBlock == 16) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat64_t a0 = svld1_f64(pg, qt + dd * seqLen + qi);
                        svfloat64_t b0 = svld1_f64(pg, kt + dd * kvLen + kj);
                        svfloat64_t b1 = svld1_f64(pg, kt + dd * kvLen + kj + 8);
                        svmopa_za64_f64_m(0, pg, pg, a0, b0);
                        svmopa_za64_f64_m(2, pg, pg, a0, b1);
                    }
                }
                if (kBlock == 8) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat64_t a0 = svld1_f64(pg, qt + dd * seqLen + qi);
                        svfloat64_t b0 = svld1_f64(pg, kt + dd * kvLen + kj);
                        svmopa_za64_f64_m(0, pg, pg, a0, b0);
                    }
                }
            }

            // Phase 2: Online softmax
            // First: read all scores from ZA into row-major buffer
            double scores_buf[16 * 16];

            // ZA0: rows 0-7, cols 0-7
            for (int row = 0; row < 8; row++) {
                svfloat64_t zr = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                svst1_f64(pg, scores_buf + row * 16, zr);
            }
            if (kBlock > 8) {
                // ZA2: rows 0-7, cols 8-15
                for (int row = 0; row < 8; row++) {
                    svfloat64_t zr = svread_hor_za64_f64_m(svundef_f64(), pg, 2, row);
                    svst1_f64(pg, scores_buf + row * 16 + 8, zr);
                }
            }
            if (qBlock > 8) {
                // ZA1: rows 8-15, cols 0-7
                for (int row = 0; row < 8; row++) {
                    svfloat64_t zr = svread_hor_za64_f64_m(svundef_f64(), pg, 1, row);
                    svst1_f64(pg, scores_buf + (row + 8) * 16, zr);
                }
                if (kBlock > 8) {
                    // ZA3: rows 8-15, cols 8-15
                    for (int row = 0; row < 8; row++) {
                        svfloat64_t zr = svread_hor_za64_f64_m(svundef_f64(), pg, 3, row);
                        svst1_f64(pg, scores_buf + (row + 8) * 16 + 8, zr);
                    }
                }
            }

            // P_tile column-major: pt[kv_col * 16 + q_row]
            double pt[16 * 16];

            for (int row = 0; row < 16; row++) {
                if (row >= qBlock) break;

                double *s_row = scores_buf + row * 16;

                // Scale + mask
                svfloat64_t sv_s0 = svld1_f64(pg, s_row);
                sv_s0 = svmul_f64_z(pg, sv_s0, sv_scale);
                if (mask) {
                    svfloat64_t sv_m0 = svld1_f64(pg, mask + (qi + row) * kvLen + kj);
                    sv_s0 = svadd_f64_z(pg, sv_s0, sv_m0);
                }
                svst1_f64(pg, s_row, sv_s0);
                svfloat64_t sv_max = sv_s0;

                if (kBlock > 8) {
                    svfloat64_t sv_s1 = svld1_f64(pg, s_row + 8);
                    sv_s1 = svmul_f64_z(pg, sv_s1, sv_scale);
                    if (mask) {
                        svfloat64_t sv_m1 = svld1_f64(pg, mask + (qi + row) * kvLen + kj + 8);
                        sv_s1 = svadd_f64_z(pg, sv_s1, sv_m1);
                    }
                    svst1_f64(pg, s_row + 8, sv_s1);
                    sv_max = svmax_f64_z(pg, sv_max, sv_s1);
                }

                double row_max = svmaxv_f64(pg, sv_max);

                double m_prev = m_arr[row];
                double m_new = row_max;
                if (m_prev > m_new) {
                    m_new = m_prev;
                }
                m_arr[row] = m_new;

                double alpha_scalar = 1.0;
                if (m_prev != negInfVal) {
                    if (m_prev != m_new) {
                        double ax = m_prev - m_new;
                        if (ax < -708.396) ax = -708.396;
                        double akf = ax * 1.4426950408889634;
                        long aki = (long)(akf + (akf >= 0 ? 0.5 : -0.5));
                        double akff = (double)aki;
                        double ar = ax - akff * 0.6931471803691238;
                        ar = ar - akff * 1.9082149292705877e-10;
                        double ap = 2.48015873015873015873e-5;
                        ap = 1.98412698412698412698e-4 + ap * ar;
                        ap = 1.38888888888888888889e-3 + ap * ar;
                        ap = 8.33333333333333333333e-3 + ap * ar;
                        ap = 4.16666666666666666667e-2 + ap * ar;
                        ap = 1.66666666666666666667e-1 + ap * ar;
                        ap = 0.5 + ap * ar;
                        ap = 1.0 + ap * ar;
                        ap = 1.0 + ap * ar;
                        long a_bits = (aki + 1023) << 52;
                        double a_scale_val = *(double *)&a_bits;
                        alpha_scalar = ap * a_scale_val;
                    }
                }

                l_arr[row] = alpha_scalar * l_arr[row];
                if (alpha_scalar != 1.0) {
                    svfloat64_t sv_alpha = svdup_f64(alpha_scalar);
                    long oOff = (qi + row) * headDim;
                    for (long d = 0; d < headDim; d += 8) {
                        svfloat64_t ov = svld1_f64(pg, output + oOff + d);
                        ov = svmul_f64_z(pg, ov, sv_alpha);
                        svst1_f64(pg, output + oOff + d, ov);
                    }
                }

                // SVE exp for first 8 elements
                svfloat64_t sv_mnew = svdup_f64(m_new);
                svfloat64_t sv_x0 = svld1_f64(pg, s_row);
                sv_x0 = svsub_f64_z(pg, sv_x0, sv_mnew);
                sv_x0 = svmax_f64_z(pg, sv_x0, sv_exp_min);

                svfloat64_t sv_kf0 = svmul_f64_z(pg, sv_x0, sv_inv_ln2);
                svint64_t sv_ki0 = svcvt_s64_f64_z(pg, sv_kf0);
                svfloat64_t sv_kff0 = svcvt_f64_s64_z(pg, sv_ki0);
                svfloat64_t sv_r0 = svmsb_f64_z(pg, sv_kff0, sv_ln2_hi, sv_x0);
                sv_r0 = svmsb_f64_z(pg, sv_kff0, sv_ln2_lo, sv_r0);

                svfloat64_t sv_p0 = sv_c8;
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c7);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c6);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c5);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c4);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c3);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c2);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c1);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c1);

                svint64_t sv_bits0 = svlsl_n_s64_z(pg, svadd_s64_z(pg, sv_ki0, sv_bias), 52);
                svfloat64_t sv_pow0 = svreinterpret_f64_s64(sv_bits0);
                svfloat64_t sv_exp0 = svmul_f64_z(pg, sv_p0, sv_pow0);

                double row_sum = svaddv_f64(pg, sv_exp0);

                double exp_buf0[8];
                svst1_f64(pg, exp_buf0, sv_exp0);
                for (int col = 0; col < 8; col++) {
                    pt[col * 16 + row] = exp_buf0[col];
                }

                if (kBlock > 8) {
                    svfloat64_t sv_x1 = svld1_f64(pg, s_row + 8);
                    sv_x1 = svsub_f64_z(pg, sv_x1, sv_mnew);
                    sv_x1 = svmax_f64_z(pg, sv_x1, sv_exp_min);

                    svfloat64_t sv_kf1 = svmul_f64_z(pg, sv_x1, sv_inv_ln2);
                    svint64_t sv_ki1 = svcvt_s64_f64_z(pg, sv_kf1);
                    svfloat64_t sv_kff1 = svcvt_f64_s64_z(pg, sv_ki1);
                    svfloat64_t sv_r1 = svmsb_f64_z(pg, sv_kff1, sv_ln2_hi, sv_x1);
                    sv_r1 = svmsb_f64_z(pg, sv_kff1, sv_ln2_lo, sv_r1);

                    svfloat64_t sv_p1 = sv_c8;
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c7);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c6);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c5);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c4);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c3);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c2);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c1);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c1);

                    svint64_t sv_bits1 = svlsl_n_s64_z(pg, svadd_s64_z(pg, sv_ki1, sv_bias), 52);
                    svfloat64_t sv_pow1 = svreinterpret_f64_s64(sv_bits1);
                    svfloat64_t sv_exp1 = svmul_f64_z(pg, sv_p1, sv_pow1);

                    row_sum += svaddv_f64(pg, sv_exp1);

                    double exp_buf1[8];
                    svst1_f64(pg, exp_buf1, sv_exp1);
                    for (int col = 0; col < 8; col++) {
                        pt[(col + 8) * 16 + row] = exp_buf1[col];
                    }
                }

                l_arr[row] += row_sum;
            }

            // Zero unused P_tile
            for (int row = qBlock; row < 16; row++) {
                for (int col = 0; col < 16; col++) {
                    pt[col * 16 + row] = 0.0;
                }
            }
            for (int col = kBlock; col < 16; col++) {
                for (int row = 0; row < 16; row++) {
                    pt[col * 16 + row] = 0.0;
                }
            }

            // Phase 3: P@V using 4-tile FMOPA
            long d = 0;
            for (; d + 16 <= headDim; d += 16) {
                svzero_za();

                for (int kk = 0; kk < kBlock; kk++) {
                    svfloat64_t p0 = svld1_f64(pg, pt + kk * 16);
                    svfloat64_t p1 = svld1_f64(pg, pt + kk * 16 + 8);
                    svfloat64_t v0 = svld1_f64(pg, v + (kj + kk) * headDim + d);
                    svfloat64_t v1 = svld1_f64(pg, v + (kj + kk) * headDim + d + 8);
                    svmopa_za64_f64_m(0, pg, pg, p0, v0);
                    svmopa_za64_f64_m(1, pg, pg, p1, v0);
                    svmopa_za64_f64_m(2, pg, pg, p0, v1);
                    svmopa_za64_f64_m(3, pg, pg, p1, v1);
                }

                for (int row = 0; row < 8; row++) {
                    if (qi + row >= seqLen) break;
                    svfloat64_t r0 = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                    svfloat64_t o0 = svld1_f64(pg, output + (qi + row) * headDim + d);
                    svst1_f64(pg, output + (qi + row) * headDim + d, svadd_f64_z(pg, o0, r0));

                    svfloat64_t r2 = svread_hor_za64_f64_m(svundef_f64(), pg, 2, row);
                    svfloat64_t o2 = svld1_f64(pg, output + (qi + row) * headDim + d + 8);
                    svst1_f64(pg, output + (qi + row) * headDim + d + 8, svadd_f64_z(pg, o2, r2));
                }
                for (int row = 0; row < 8; row++) {
                    if (qi + 8 + row >= seqLen) break;
                    svfloat64_t r1 = svread_hor_za64_f64_m(svundef_f64(), pg, 1, row);
                    svfloat64_t o1 = svld1_f64(pg, output + (qi + 8 + row) * headDim + d);
                    svst1_f64(pg, output + (qi + 8 + row) * headDim + d, svadd_f64_z(pg, o1, r1));

                    svfloat64_t r3 = svread_hor_za64_f64_m(svundef_f64(), pg, 3, row);
                    svfloat64_t o3 = svld1_f64(pg, output + (qi + 8 + row) * headDim + d + 8);
                    svst1_f64(pg, output + (qi + 8 + row) * headDim + d + 8, svadd_f64_z(pg, o3, r3));
                }
            }

            // Remainder: 8-col strip with 2-tile (ZA0 + ZA1)
            if (d < headDim) {
                svzero_za();

                for (int kk = 0; kk < kBlock; kk++) {
                    svfloat64_t p0 = svld1_f64(pg, pt + kk * 16);
                    svfloat64_t p1 = svld1_f64(pg, pt + kk * 16 + 8);
                    svfloat64_t v0 = svld1_f64(pg, v + (kj + kk) * headDim + d);
                    svmopa_za64_f64_m(0, pg, pg, p0, v0);
                    svmopa_za64_f64_m(1, pg, pg, p1, v0);
                }

                for (int row = 0; row < 8; row++) {
                    if (qi + row >= seqLen) break;
                    svfloat64_t r0 = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                    svfloat64_t o0 = svld1_f64(pg, output + (qi + row) * headDim + d);
                    svst1_f64(pg, output + (qi + row) * headDim + d, svadd_f64_z(pg, o0, r0));
                }
                for (int row = 0; row < 8; row++) {
                    if (qi + 8 + row >= seqLen) break;
                    svfloat64_t r1 = svread_hor_za64_f64_m(svundef_f64(), pg, 1, row);
                    svfloat64_t o1 = svld1_f64(pg, output + (qi + 8 + row) * headDim + d);
                    svst1_f64(pg, output + (qi + 8 + row) * headDim + d, svadd_f64_z(pg, o1, r1));
                }
            }
        }

        // Final normalize
        for (long r = 0; r < qBlock; r++) {
            if (l_arr[r] == 0.0) continue;
            double invL = 1.0 / l_arr[r];
            svfloat64_t sv_invL = svdup_f64(invL);
            long oOff = (qi + r) * headDim;
            for (long d = 0; d < headDim; d += 8) {
                svfloat64_t ov = svld1_f64(pg, output + oOff + d);
                ov = svmul_f64_z(pg, ov, sv_invL);
                svst1_f64(pg, output + oOff + d, ov);
            }
        }
    }
}

// =============================================================================
// Causal variants
// =============================================================================

// sdpa_causal_fmopa_f32: Causal Multi-tile SME Flash Attention for float32
//
// Same as sdpa_fmopa_f32 but with implicit causal mask:
// q row i can attend to kv col j iff j <= i + offset, where offset = kvLen - seqLen.
//
// func sdpa_causal_fmopa_f32(qt, kt, v, output, pdims, pscale unsafe.Pointer)
// pdims: [0]=seqLen, [1]=kvLen, [2]=headDim
void sdpa_causal_fmopa_f32(float *qt, float *kt, float *v,
                             float *output,
                             long *pdims, float *pscale)
    __arm_streaming __arm_out("za") {
    long seqLen = pdims[0];
    long kvLen = pdims[1];
    long headDim = pdims[2];
    float scale = *pscale;

    if (seqLen <= 0) return;
    if (kvLen <= 0) return;
    if (headDim <= 0) return;

    long causal_offset = kvLen - seqLen;

    svbool_t pg = svptrue_b32();

    svfloat32_t sv_inv_ln2 = svdup_f32(1.44269504088896341f);
    svfloat32_t sv_ln2_hi  = svdup_f32(0.693359375f);
    svfloat32_t sv_ln2_lo  = svdup_f32(-2.12194440e-4f);
    svfloat32_t sv_c1 = svdup_f32(1.0f);
    svfloat32_t sv_c2 = svdup_f32(0.5f);
    svfloat32_t sv_c3 = svdup_f32(0.16666666666666666f);
    svfloat32_t sv_c4 = svdup_f32(0.041666666666666664f);
    svfloat32_t sv_c5 = svdup_f32(0.008333333333333333f);
    svfloat32_t sv_c6 = svdup_f32(0.001388888888888889f);
    svint32_t sv_bias = svdup_s32(127);
    svfloat32_t sv_exp_min = svdup_f32(-87.3365f);
    svfloat32_t sv_zero = svdup_f32(0.0f);
    svfloat32_t sv_scale = svdup_f32(scale);

    float negInfVal = -1.0f / 0.0f;
    svfloat32_t sv_neginf = svdup_f32(negInfVal);

    for (long qi = 0; qi < seqLen; qi += 32) {
        long qBlock = 32;
        if (qi + qBlock > seqLen) qBlock = seqLen - qi;

        float m_arr[32];
        float l_arr[32];
        for (int r = 0; r < 32; r++) {
            m_arr[r] = negInfVal;
            l_arr[r] = 0.0f;
        }

        for (long r = 0; r < qBlock; r++) {
            for (long d = 0; d < headDim; d++) {
                output[(qi + r) * headDim + d] = 0.0f;
            }
        }

        for (long kj = 0; kj < kvLen; kj += 32) {
            long kBlock = 32;
            if (kj + kBlock > kvLen) kBlock = kvLen - kj;

            // Skip tile if fully past causal boundary
            if (kj > qi + qBlock - 1 + causal_offset) break;

            // Phase 1: Q@K^T (same as non-causal)
            svzero_za();

            if (qBlock == 32) {
                if (kBlock == 32) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat32_t a0 = svld1_f32(pg, qt + dd * seqLen + qi);
                        svfloat32_t a1 = svld1_f32(pg, qt + dd * seqLen + qi + 16);
                        svfloat32_t b0 = svld1_f32(pg, kt + dd * kvLen + kj);
                        svfloat32_t b1 = svld1_f32(pg, kt + dd * kvLen + kj + 16);
                        svmopa_za32_f32_m(0, pg, pg, a0, b0);
                        svmopa_za32_f32_m(1, pg, pg, a1, b0);
                        svmopa_za32_f32_m(2, pg, pg, a0, b1);
                        svmopa_za32_f32_m(3, pg, pg, a1, b1);
                    }
                }
                if (kBlock == 16) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat32_t a0 = svld1_f32(pg, qt + dd * seqLen + qi);
                        svfloat32_t a1 = svld1_f32(pg, qt + dd * seqLen + qi + 16);
                        svfloat32_t b0 = svld1_f32(pg, kt + dd * kvLen + kj);
                        svmopa_za32_f32_m(0, pg, pg, a0, b0);
                        svmopa_za32_f32_m(1, pg, pg, a1, b0);
                    }
                }
            }
            if (qBlock == 16) {
                if (kBlock == 32) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat32_t a0 = svld1_f32(pg, qt + dd * seqLen + qi);
                        svfloat32_t b0 = svld1_f32(pg, kt + dd * kvLen + kj);
                        svfloat32_t b1 = svld1_f32(pg, kt + dd * kvLen + kj + 16);
                        svmopa_za32_f32_m(0, pg, pg, a0, b0);
                        svmopa_za32_f32_m(2, pg, pg, a0, b1);
                    }
                }
                if (kBlock == 16) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat32_t a0 = svld1_f32(pg, qt + dd * seqLen + qi);
                        svfloat32_t b0 = svld1_f32(pg, kt + dd * kvLen + kj);
                        svmopa_za32_f32_m(0, pg, pg, a0, b0);
                    }
                }
            }

            // Phase 2: Read scores, apply causal mask, online softmax
            float scores_buf[32 * 32];

            for (int row = 0; row < 16; row++) {
                svfloat32_t zr = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                svst1_f32(pg, scores_buf + row * 32, zr);
            }
            if (kBlock > 16) {
                for (int row = 0; row < 16; row++) {
                    svfloat32_t zr = svread_hor_za32_f32_m(svundef_f32(), pg, 2, row);
                    svst1_f32(pg, scores_buf + row * 32 + 16, zr);
                }
            }
            if (qBlock > 16) {
                for (int row = 0; row < 16; row++) {
                    svfloat32_t zr = svread_hor_za32_f32_m(svundef_f32(), pg, 1, row);
                    svst1_f32(pg, scores_buf + (row + 16) * 32, zr);
                }
                if (kBlock > 16) {
                    for (int row = 0; row < 16; row++) {
                        svfloat32_t zr = svread_hor_za32_f32_m(svundef_f32(), pg, 3, row);
                        svst1_f32(pg, scores_buf + (row + 16) * 32 + 16, zr);
                    }
                }
            }

            float pt[32 * 32];

            for (int row = 0; row < 32; row++) {
                if (row >= qBlock) break;

                float *s_row = scores_buf + row * 32;
                long causal_bound = qi + row + causal_offset;

                // Apply causal mask then scale
                for (int col = 0; col < 32; col++) {
                    if (col >= kBlock) break;
                    if (kj + col > causal_bound) {
                        s_row[col] = negInfVal;
                    }
                }

                svfloat32_t sv_s0 = svld1_f32(pg, s_row);
                sv_s0 = svmul_f32_z(pg, sv_s0, sv_scale);
                svst1_f32(pg, s_row, sv_s0);
                svfloat32_t sv_max = sv_s0;

                if (kBlock > 16) {
                    svfloat32_t sv_s1 = svld1_f32(pg, s_row + 16);
                    sv_s1 = svmul_f32_z(pg, sv_s1, sv_scale);
                    svst1_f32(pg, s_row + 16, sv_s1);
                    sv_max = svmax_f32_z(pg, sv_max, sv_s1);
                }

                float row_max = svmaxv_f32(pg, sv_max);

                if (row_max == negInfVal) {
                    for (int col = 0; col < 32; col++) {
                        pt[col * 32 + row] = 0.0f;
                    }
                    continue;
                }

                float m_prev = m_arr[row];
                float m_new = row_max;
                if (m_prev > m_new) m_new = m_prev;
                m_arr[row] = m_new;

                float alpha_scalar = 1.0f;
                if (m_prev != negInfVal) {
                    if (m_prev != m_new) {
                        float ax = m_prev - m_new;
                        if (ax < -87.3365f) ax = -87.3365f;
                        float akf = ax * 1.44269504088896341f;
                        int aki = (int)(akf + (akf >= 0 ? 0.5f : -0.5f));
                        float akff = (float)aki;
                        float ar = ax - akff * 0.693359375f;
                        ar = ar - akff * -2.12194440e-4f;
                        float ap = 0.001388888888888889f;
                        ap = 0.008333333333333333f + ap * ar;
                        ap = 0.041666666666666664f + ap * ar;
                        ap = 0.16666666666666666f + ap * ar;
                        ap = 0.5f + ap * ar;
                        ap = 1.0f + ap * ar;
                        ap = 1.0f + ap * ar;
                        int a_bits = (aki + 127) << 23;
                        float a_scale_val = *(float *)&a_bits;
                        alpha_scalar = ap * a_scale_val;
                    }
                }

                l_arr[row] = alpha_scalar * l_arr[row];
                if (alpha_scalar != 1.0f) {
                    svfloat32_t sv_alpha = svdup_f32(alpha_scalar);
                    long oOff = (qi + row) * headDim;
                    for (long d = 0; d < headDim; d += 16) {
                        svfloat32_t ov = svld1_f32(pg, output + oOff + d);
                        ov = svmul_f32_z(pg, ov, sv_alpha);
                        svst1_f32(pg, output + oOff + d, ov);
                    }
                }

                svfloat32_t sv_mnew = svdup_f32(m_new);
                svfloat32_t sv_x0 = svld1_f32(pg, s_row);
                sv_x0 = svsub_f32_z(pg, sv_x0, sv_mnew);
                sv_x0 = svmax_f32_z(pg, sv_x0, sv_exp_min);

                svfloat32_t sv_kf0 = svmul_f32_z(pg, sv_x0, sv_inv_ln2);
                svint32_t sv_ki0 = svcvt_s32_f32_z(pg, sv_kf0);
                svfloat32_t sv_kff0 = svcvt_f32_s32_z(pg, sv_ki0);
                svfloat32_t sv_r0 = svmsb_f32_z(pg, sv_kff0, sv_ln2_hi, sv_x0);
                sv_r0 = svmsb_f32_z(pg, sv_kff0, sv_ln2_lo, sv_r0);

                svfloat32_t sv_p0 = sv_c6;
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c5);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c4);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c3);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c2);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c1);
                sv_p0 = svmad_f32_z(pg, sv_p0, sv_r0, sv_c1);

                svint32_t sv_bits0 = svlsl_n_s32_z(pg, svadd_s32_z(pg, sv_ki0, sv_bias), 23);
                svfloat32_t sv_pow0 = svreinterpret_f32_s32(sv_bits0);
                svfloat32_t sv_exp0 = svmul_f32_z(pg, sv_p0, sv_pow0);

                float row_sum = svaddv_f32(pg, sv_exp0);

                float exp_buf0[16];
                svst1_f32(pg, exp_buf0, sv_exp0);
                for (int col = 0; col < 16; col++) {
                    pt[col * 32 + row] = exp_buf0[col];
                }

                if (kBlock > 16) {
                    svfloat32_t sv_x1 = svld1_f32(pg, s_row + 16);
                    sv_x1 = svsub_f32_z(pg, sv_x1, sv_mnew);
                    sv_x1 = svmax_f32_z(pg, sv_x1, sv_exp_min);

                    svfloat32_t sv_kf1 = svmul_f32_z(pg, sv_x1, sv_inv_ln2);
                    svint32_t sv_ki1 = svcvt_s32_f32_z(pg, sv_kf1);
                    svfloat32_t sv_kff1 = svcvt_f32_s32_z(pg, sv_ki1);
                    svfloat32_t sv_r1 = svmsb_f32_z(pg, sv_kff1, sv_ln2_hi, sv_x1);
                    sv_r1 = svmsb_f32_z(pg, sv_kff1, sv_ln2_lo, sv_r1);

                    svfloat32_t sv_p1 = sv_c6;
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c5);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c4);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c3);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c2);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c1);
                    sv_p1 = svmad_f32_z(pg, sv_p1, sv_r1, sv_c1);

                    svint32_t sv_bits1 = svlsl_n_s32_z(pg, svadd_s32_z(pg, sv_ki1, sv_bias), 23);
                    svfloat32_t sv_pow1 = svreinterpret_f32_s32(sv_bits1);
                    svfloat32_t sv_exp1 = svmul_f32_z(pg, sv_p1, sv_pow1);

                    row_sum += svaddv_f32(pg, sv_exp1);

                    float exp_buf1[16];
                    svst1_f32(pg, exp_buf1, sv_exp1);
                    for (int col = 0; col < 16; col++) {
                        pt[(col + 16) * 32 + row] = exp_buf1[col];
                    }
                }

                l_arr[row] += row_sum;
            }

            for (int row = qBlock; row < 32; row++) {
                for (int col = 0; col < 32; col++) {
                    pt[col * 32 + row] = 0.0f;
                }
            }
            for (int col = kBlock; col < 32; col++) {
                for (int row = 0; row < 32; row++) {
                    pt[col * 32 + row] = 0.0f;
                }
            }

            // Phase 3: P@V (same as non-causal)
            long d = 0;
            for (; d + 32 <= headDim; d += 32) {
                svzero_za();
                for (int kk = 0; kk < kBlock; kk++) {
                    svfloat32_t p0 = svld1_f32(pg, pt + kk * 32);
                    svfloat32_t p1 = svld1_f32(pg, pt + kk * 32 + 16);
                    svfloat32_t v0 = svld1_f32(pg, v + (kj + kk) * headDim + d);
                    svfloat32_t v1 = svld1_f32(pg, v + (kj + kk) * headDim + d + 16);
                    svmopa_za32_f32_m(0, pg, pg, p0, v0);
                    svmopa_za32_f32_m(1, pg, pg, p1, v0);
                    svmopa_za32_f32_m(2, pg, pg, p0, v1);
                    svmopa_za32_f32_m(3, pg, pg, p1, v1);
                }
                for (int row = 0; row < 16; row++) {
                    if (qi + row >= seqLen) break;
                    svfloat32_t r0 = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                    svfloat32_t o0 = svld1_f32(pg, output + (qi + row) * headDim + d);
                    svst1_f32(pg, output + (qi + row) * headDim + d, svadd_f32_z(pg, o0, r0));
                    svfloat32_t r2 = svread_hor_za32_f32_m(svundef_f32(), pg, 2, row);
                    svfloat32_t o2 = svld1_f32(pg, output + (qi + row) * headDim + d + 16);
                    svst1_f32(pg, output + (qi + row) * headDim + d + 16, svadd_f32_z(pg, o2, r2));
                }
                for (int row = 0; row < 16; row++) {
                    if (qi + 16 + row >= seqLen) break;
                    svfloat32_t r1 = svread_hor_za32_f32_m(svundef_f32(), pg, 1, row);
                    svfloat32_t o1 = svld1_f32(pg, output + (qi + 16 + row) * headDim + d);
                    svst1_f32(pg, output + (qi + 16 + row) * headDim + d, svadd_f32_z(pg, o1, r1));
                    svfloat32_t r3 = svread_hor_za32_f32_m(svundef_f32(), pg, 3, row);
                    svfloat32_t o3 = svld1_f32(pg, output + (qi + 16 + row) * headDim + d + 16);
                    svst1_f32(pg, output + (qi + 16 + row) * headDim + d + 16, svadd_f32_z(pg, o3, r3));
                }
            }
            if (d < headDim) {
                svzero_za();
                for (int kk = 0; kk < kBlock; kk++) {
                    svfloat32_t p0 = svld1_f32(pg, pt + kk * 32);
                    svfloat32_t p1 = svld1_f32(pg, pt + kk * 32 + 16);
                    svfloat32_t v0 = svld1_f32(pg, v + (kj + kk) * headDim + d);
                    svmopa_za32_f32_m(0, pg, pg, p0, v0);
                    svmopa_za32_f32_m(1, pg, pg, p1, v0);
                }
                for (int row = 0; row < 16; row++) {
                    if (qi + row >= seqLen) break;
                    svfloat32_t r0 = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                    svfloat32_t o0 = svld1_f32(pg, output + (qi + row) * headDim + d);
                    svst1_f32(pg, output + (qi + row) * headDim + d, svadd_f32_z(pg, o0, r0));
                }
                for (int row = 0; row < 16; row++) {
                    if (qi + 16 + row >= seqLen) break;
                    svfloat32_t r1 = svread_hor_za32_f32_m(svundef_f32(), pg, 1, row);
                    svfloat32_t o1 = svld1_f32(pg, output + (qi + 16 + row) * headDim + d);
                    svst1_f32(pg, output + (qi + 16 + row) * headDim + d, svadd_f32_z(pg, o1, r1));
                }
            }
        }

        for (long r = 0; r < qBlock; r++) {
            if (l_arr[r] == 0.0f) continue;
            float invL = 1.0f / l_arr[r];
            svfloat32_t sv_invL = svdup_f32(invL);
            long oOff = (qi + r) * headDim;
            for (long d = 0; d < headDim; d += 16) {
                svfloat32_t ov = svld1_f32(pg, output + oOff + d);
                ov = svmul_f32_z(pg, ov, sv_invL);
                svst1_f32(pg, output + oOff + d, ov);
            }
        }
    }
}

// sdpa_causal_fmopa_f64: Causal Multi-tile SME Flash Attention for float64
//
// func sdpa_causal_fmopa_f64(qt, kt, v, output, pdims, pscale unsafe.Pointer)
void sdpa_causal_fmopa_f64(double *qt, double *kt, double *v,
                             double *output,
                             long *pdims, double *pscale)
    __arm_streaming __arm_out("za") {
    long seqLen = pdims[0];
    long kvLen = pdims[1];
    long headDim = pdims[2];
    double scale = *pscale;

    if (seqLen <= 0) return;
    if (kvLen <= 0) return;
    if (headDim <= 0) return;

    long causal_offset = kvLen - seqLen;

    svbool_t pg = svptrue_b64();

    svfloat64_t sv_inv_ln2 = svdup_f64(1.4426950408889634);
    svfloat64_t sv_ln2_hi  = svdup_f64(0.6931471803691238);
    svfloat64_t sv_ln2_lo  = svdup_f64(1.9082149292705877e-10);
    svfloat64_t sv_c1 = svdup_f64(1.0);
    svfloat64_t sv_c2 = svdup_f64(0.5);
    svfloat64_t sv_c3 = svdup_f64(0.16666666666666666);
    svfloat64_t sv_c4 = svdup_f64(0.041666666666666664);
    svfloat64_t sv_c5 = svdup_f64(0.008333333333333333);
    svfloat64_t sv_c6 = svdup_f64(0.001388888888888889);
    svfloat64_t sv_c7 = svdup_f64(1.98412698412698412698e-4);
    svfloat64_t sv_c8 = svdup_f64(2.48015873015873015873e-5);
    svint64_t sv_bias = svdup_s64(1023);
    svfloat64_t sv_exp_min = svdup_f64(-708.396);
    svfloat64_t sv_zero = svdup_f64(0.0);
    svfloat64_t sv_scale = svdup_f64(scale);

    double negInfVal = -1.0 / 0.0;

    for (long qi = 0; qi < seqLen; qi += 16) {
        long qBlock = 16;
        if (qi + qBlock > seqLen) qBlock = seqLen - qi;

        double m_arr[16];
        double l_arr[16];
        for (int r = 0; r < 16; r++) {
            m_arr[r] = negInfVal;
            l_arr[r] = 0.0;
        }

        for (long r = 0; r < qBlock; r++) {
            for (long d = 0; d < headDim; d++) {
                output[(qi + r) * headDim + d] = 0.0;
            }
        }

        for (long kj = 0; kj < kvLen; kj += 16) {
            long kBlock = 16;
            if (kj + kBlock > kvLen) kBlock = kvLen - kj;

            if (kj > qi + qBlock - 1 + causal_offset) break;

            svzero_za();

            if (qBlock == 16) {
                if (kBlock == 16) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat64_t a0 = svld1_f64(pg, qt + dd * seqLen + qi);
                        svfloat64_t a1 = svld1_f64(pg, qt + dd * seqLen + qi + 8);
                        svfloat64_t b0 = svld1_f64(pg, kt + dd * kvLen + kj);
                        svfloat64_t b1 = svld1_f64(pg, kt + dd * kvLen + kj + 8);
                        svmopa_za64_f64_m(0, pg, pg, a0, b0);
                        svmopa_za64_f64_m(1, pg, pg, a1, b0);
                        svmopa_za64_f64_m(2, pg, pg, a0, b1);
                        svmopa_za64_f64_m(3, pg, pg, a1, b1);
                    }
                }
                if (kBlock == 8) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat64_t a0 = svld1_f64(pg, qt + dd * seqLen + qi);
                        svfloat64_t a1 = svld1_f64(pg, qt + dd * seqLen + qi + 8);
                        svfloat64_t b0 = svld1_f64(pg, kt + dd * kvLen + kj);
                        svmopa_za64_f64_m(0, pg, pg, a0, b0);
                        svmopa_za64_f64_m(1, pg, pg, a1, b0);
                    }
                }
            }
            if (qBlock == 8) {
                if (kBlock == 16) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat64_t a0 = svld1_f64(pg, qt + dd * seqLen + qi);
                        svfloat64_t b0 = svld1_f64(pg, kt + dd * kvLen + kj);
                        svfloat64_t b1 = svld1_f64(pg, kt + dd * kvLen + kj + 8);
                        svmopa_za64_f64_m(0, pg, pg, a0, b0);
                        svmopa_za64_f64_m(2, pg, pg, a0, b1);
                    }
                }
                if (kBlock == 8) {
                    for (long dd = 0; dd < headDim; dd++) {
                        svfloat64_t a0 = svld1_f64(pg, qt + dd * seqLen + qi);
                        svfloat64_t b0 = svld1_f64(pg, kt + dd * kvLen + kj);
                        svmopa_za64_f64_m(0, pg, pg, a0, b0);
                    }
                }
            }

            double scores_buf[16 * 16];

            for (int row = 0; row < 8; row++) {
                svfloat64_t zr = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                svst1_f64(pg, scores_buf + row * 16, zr);
            }
            if (kBlock > 8) {
                for (int row = 0; row < 8; row++) {
                    svfloat64_t zr = svread_hor_za64_f64_m(svundef_f64(), pg, 2, row);
                    svst1_f64(pg, scores_buf + row * 16 + 8, zr);
                }
            }
            if (qBlock > 8) {
                for (int row = 0; row < 8; row++) {
                    svfloat64_t zr = svread_hor_za64_f64_m(svundef_f64(), pg, 1, row);
                    svst1_f64(pg, scores_buf + (row + 8) * 16, zr);
                }
                if (kBlock > 8) {
                    for (int row = 0; row < 8; row++) {
                        svfloat64_t zr = svread_hor_za64_f64_m(svundef_f64(), pg, 3, row);
                        svst1_f64(pg, scores_buf + (row + 8) * 16 + 8, zr);
                    }
                }
            }

            double pt[16 * 16];

            for (int row = 0; row < 16; row++) {
                if (row >= qBlock) break;

                double *s_row = scores_buf + row * 16;
                long causal_bound = qi + row + causal_offset;

                for (int col = 0; col < 16; col++) {
                    if (col >= kBlock) break;
                    if (kj + col > causal_bound) {
                        s_row[col] = negInfVal;
                    }
                }

                svfloat64_t sv_s0 = svld1_f64(pg, s_row);
                sv_s0 = svmul_f64_z(pg, sv_s0, sv_scale);
                svst1_f64(pg, s_row, sv_s0);
                svfloat64_t sv_max = sv_s0;

                if (kBlock > 8) {
                    svfloat64_t sv_s1 = svld1_f64(pg, s_row + 8);
                    sv_s1 = svmul_f64_z(pg, sv_s1, sv_scale);
                    svst1_f64(pg, s_row + 8, sv_s1);
                    sv_max = svmax_f64_z(pg, sv_max, sv_s1);
                }

                double row_max = svmaxv_f64(pg, sv_max);

                if (row_max == negInfVal) {
                    for (int col = 0; col < 16; col++) {
                        pt[col * 16 + row] = 0.0;
                    }
                    continue;
                }

                double m_prev = m_arr[row];
                double m_new = row_max;
                if (m_prev > m_new) m_new = m_prev;
                m_arr[row] = m_new;

                double alpha_scalar = 1.0;
                if (m_prev != negInfVal) {
                    if (m_prev != m_new) {
                        double ax = m_prev - m_new;
                        if (ax < -708.396) ax = -708.396;
                        double akf = ax * 1.4426950408889634;
                        long aki = (long)(akf + (akf >= 0 ? 0.5 : -0.5));
                        double akff = (double)aki;
                        double ar = ax - akff * 0.6931471803691238;
                        ar = ar - akff * 1.9082149292705877e-10;
                        double ap = 2.48015873015873015873e-5;
                        ap = 1.98412698412698412698e-4 + ap * ar;
                        ap = 1.38888888888888888889e-3 + ap * ar;
                        ap = 8.33333333333333333333e-3 + ap * ar;
                        ap = 4.16666666666666666667e-2 + ap * ar;
                        ap = 1.66666666666666666667e-1 + ap * ar;
                        ap = 0.5 + ap * ar;
                        ap = 1.0 + ap * ar;
                        ap = 1.0 + ap * ar;
                        long a_bits = (aki + 1023) << 52;
                        double a_scale_val = *(double *)&a_bits;
                        alpha_scalar = ap * a_scale_val;
                    }
                }

                l_arr[row] = alpha_scalar * l_arr[row];
                if (alpha_scalar != 1.0) {
                    svfloat64_t sv_alpha = svdup_f64(alpha_scalar);
                    long oOff = (qi + row) * headDim;
                    for (long d = 0; d < headDim; d += 8) {
                        svfloat64_t ov = svld1_f64(pg, output + oOff + d);
                        ov = svmul_f64_z(pg, ov, sv_alpha);
                        svst1_f64(pg, output + oOff + d, ov);
                    }
                }

                svfloat64_t sv_mnew = svdup_f64(m_new);
                svfloat64_t sv_x0 = svld1_f64(pg, s_row);
                sv_x0 = svsub_f64_z(pg, sv_x0, sv_mnew);
                sv_x0 = svmax_f64_z(pg, sv_x0, sv_exp_min);

                svfloat64_t sv_kf0 = svmul_f64_z(pg, sv_x0, sv_inv_ln2);
                svint64_t sv_ki0 = svcvt_s64_f64_z(pg, sv_kf0);
                svfloat64_t sv_kff0 = svcvt_f64_s64_z(pg, sv_ki0);
                svfloat64_t sv_r0 = svmsb_f64_z(pg, sv_kff0, sv_ln2_hi, sv_x0);
                sv_r0 = svmsb_f64_z(pg, sv_kff0, sv_ln2_lo, sv_r0);

                svfloat64_t sv_p0 = sv_c8;
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c7);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c6);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c5);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c4);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c3);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c2);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c1);
                sv_p0 = svmad_f64_z(pg, sv_p0, sv_r0, sv_c1);

                svint64_t sv_bits0 = svlsl_n_s64_z(pg, svadd_s64_z(pg, sv_ki0, sv_bias), 52);
                svfloat64_t sv_pow0 = svreinterpret_f64_s64(sv_bits0);
                svfloat64_t sv_exp0 = svmul_f64_z(pg, sv_p0, sv_pow0);

                double row_sum = svaddv_f64(pg, sv_exp0);

                double exp_buf0[8];
                svst1_f64(pg, exp_buf0, sv_exp0);
                for (int col = 0; col < 8; col++) {
                    pt[col * 16 + row] = exp_buf0[col];
                }

                if (kBlock > 8) {
                    svfloat64_t sv_x1 = svld1_f64(pg, s_row + 8);
                    sv_x1 = svsub_f64_z(pg, sv_x1, sv_mnew);
                    sv_x1 = svmax_f64_z(pg, sv_x1, sv_exp_min);

                    svfloat64_t sv_kf1 = svmul_f64_z(pg, sv_x1, sv_inv_ln2);
                    svint64_t sv_ki1 = svcvt_s64_f64_z(pg, sv_kf1);
                    svfloat64_t sv_kff1 = svcvt_f64_s64_z(pg, sv_ki1);
                    svfloat64_t sv_r1 = svmsb_f64_z(pg, sv_kff1, sv_ln2_hi, sv_x1);
                    sv_r1 = svmsb_f64_z(pg, sv_kff1, sv_ln2_lo, sv_r1);

                    svfloat64_t sv_p1 = sv_c8;
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c7);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c6);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c5);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c4);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c3);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c2);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c1);
                    sv_p1 = svmad_f64_z(pg, sv_p1, sv_r1, sv_c1);

                    svint64_t sv_bits1 = svlsl_n_s64_z(pg, svadd_s64_z(pg, sv_ki1, sv_bias), 52);
                    svfloat64_t sv_pow1 = svreinterpret_f64_s64(sv_bits1);
                    svfloat64_t sv_exp1 = svmul_f64_z(pg, sv_p1, sv_pow1);

                    row_sum += svaddv_f64(pg, sv_exp1);

                    double exp_buf1[8];
                    svst1_f64(pg, exp_buf1, sv_exp1);
                    for (int col = 0; col < 8; col++) {
                        pt[(col + 8) * 16 + row] = exp_buf1[col];
                    }
                }

                l_arr[row] += row_sum;
            }

            for (int row = qBlock; row < 16; row++) {
                for (int col = 0; col < 16; col++) pt[col * 16 + row] = 0.0;
            }
            for (int col = kBlock; col < 16; col++) {
                for (int row = 0; row < 16; row++) pt[col * 16 + row] = 0.0;
            }

            long d = 0;
            for (; d + 16 <= headDim; d += 16) {
                svzero_za();
                for (int kk = 0; kk < kBlock; kk++) {
                    svfloat64_t p0 = svld1_f64(pg, pt + kk * 16);
                    svfloat64_t p1 = svld1_f64(pg, pt + kk * 16 + 8);
                    svfloat64_t v0 = svld1_f64(pg, v + (kj + kk) * headDim + d);
                    svfloat64_t v1 = svld1_f64(pg, v + (kj + kk) * headDim + d + 8);
                    svmopa_za64_f64_m(0, pg, pg, p0, v0);
                    svmopa_za64_f64_m(1, pg, pg, p1, v0);
                    svmopa_za64_f64_m(2, pg, pg, p0, v1);
                    svmopa_za64_f64_m(3, pg, pg, p1, v1);
                }
                for (int row = 0; row < 8; row++) {
                    if (qi + row >= seqLen) break;
                    svfloat64_t r0 = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                    svfloat64_t o0 = svld1_f64(pg, output + (qi + row) * headDim + d);
                    svst1_f64(pg, output + (qi + row) * headDim + d, svadd_f64_z(pg, o0, r0));
                    svfloat64_t r2 = svread_hor_za64_f64_m(svundef_f64(), pg, 2, row);
                    svfloat64_t o2 = svld1_f64(pg, output + (qi + row) * headDim + d + 8);
                    svst1_f64(pg, output + (qi + row) * headDim + d + 8, svadd_f64_z(pg, o2, r2));
                }
                for (int row = 0; row < 8; row++) {
                    if (qi + 8 + row >= seqLen) break;
                    svfloat64_t r1 = svread_hor_za64_f64_m(svundef_f64(), pg, 1, row);
                    svfloat64_t o1 = svld1_f64(pg, output + (qi + 8 + row) * headDim + d);
                    svst1_f64(pg, output + (qi + 8 + row) * headDim + d, svadd_f64_z(pg, o1, r1));
                    svfloat64_t r3 = svread_hor_za64_f64_m(svundef_f64(), pg, 3, row);
                    svfloat64_t o3 = svld1_f64(pg, output + (qi + 8 + row) * headDim + d + 8);
                    svst1_f64(pg, output + (qi + 8 + row) * headDim + d + 8, svadd_f64_z(pg, o3, r3));
                }
            }
            if (d < headDim) {
                svzero_za();
                for (int kk = 0; kk < kBlock; kk++) {
                    svfloat64_t p0 = svld1_f64(pg, pt + kk * 16);
                    svfloat64_t p1 = svld1_f64(pg, pt + kk * 16 + 8);
                    svfloat64_t v0 = svld1_f64(pg, v + (kj + kk) * headDim + d);
                    svmopa_za64_f64_m(0, pg, pg, p0, v0);
                    svmopa_za64_f64_m(1, pg, pg, p1, v0);
                }
                for (int row = 0; row < 8; row++) {
                    if (qi + row >= seqLen) break;
                    svfloat64_t r0 = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                    svfloat64_t o0 = svld1_f64(pg, output + (qi + row) * headDim + d);
                    svst1_f64(pg, output + (qi + row) * headDim + d, svadd_f64_z(pg, o0, r0));
                }
                for (int row = 0; row < 8; row++) {
                    if (qi + 8 + row >= seqLen) break;
                    svfloat64_t r1 = svread_hor_za64_f64_m(svundef_f64(), pg, 1, row);
                    svfloat64_t o1 = svld1_f64(pg, output + (qi + 8 + row) * headDim + d);
                    svst1_f64(pg, output + (qi + 8 + row) * headDim + d, svadd_f64_z(pg, o1, r1));
                }
            }
        }

        for (long r = 0; r < qBlock; r++) {
            if (l_arr[r] == 0.0) continue;
            double invL = 1.0 / l_arr[r];
            svfloat64_t sv_invL = svdup_f64(invL);
            long oOff = (qi + r) * headDim;
            for (long d = 0; d < headDim; d += 8) {
                svfloat64_t ov = svld1_f64(pg, output + oOff + d);
                ov = svmul_f64_z(pg, ov, sv_invL);
                svst1_f64(pg, output + oOff + d, ov);
            }
        }
    }
}
