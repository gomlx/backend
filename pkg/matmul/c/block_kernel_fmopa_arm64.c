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

// SME FMOPA Block Kernel for go-highway (Multi-Tile)
// Compile with: -march=armv9-a+sme+sme-f64f64
//
// Computes C += A^T * B for square blocks using SME FMOPA outer product.
// aT is pre-transposed A (rows are original A columns).
// b is normal row-major B.
//
// Uses all 4 ZA tiles (ZA0-ZA3) in a 2x2 arrangement:
//   - f32: 32×32 chunks with 16×16 tiles, single-tile fallback for 16×16 remainder
//   - f64: 16×16 chunks with 8×8 tiles, single-tile fallback for 8×8 remainder
//
// Results are ADDED to existing C values (C += ...).

// GOAT's C parser uses GOAT_PARSER=1, clang doesn't
#ifndef GOAT_PARSER
#include <arm_sme.h>
#endif

// =============================================================================
// block_muladd_fmopa_f32: C += A^T * B using multi-tile SME FMOPA for float32
// =============================================================================
// Processes 32×32 chunks with 4 ZA tiles, single-tile fallback for 16×16 remainder.
// Requires blockDim to be a multiple of 16.
//
// func block_muladd_fmopa_f32(aT, b, c unsafe.Pointer, blockDim int64)
void block_muladd_fmopa_f32(float * restrict aT, float * restrict b, float * restrict c,
                             long blockDim) __arm_streaming __arm_out("za") {
    long n = blockDim;

    svbool_t pg = svptrue_b32();

    // Process 32×32 chunks with 4-tile FMOPA
    long ti = 0;
    for (; ti + 32 <= n; ti += 32) {
        long tj = 0;
        for (; tj + 32 <= n; tj += 32) {
            svzero_za();

            for (long k = 0; k < n; k++) {
                svfloat32_t a0 = svld1_f32(pg, aT + k * n + ti);
                svfloat32_t a1 = svld1_f32(pg, aT + k * n + ti + 16);
                svfloat32_t b0 = svld1_f32(pg, b + k * n + tj);
                svfloat32_t b1 = svld1_f32(pg, b + k * n + tj + 16);

                svmopa_za32_f32_m(0, pg, pg, a0, b0);
                svmopa_za32_f32_m(1, pg, pg, a1, b0);
                svmopa_za32_f32_m(2, pg, pg, a0, b1);
                svmopa_za32_f32_m(3, pg, pg, a1, b1);
            }

            // Store ZA0: C[ti:ti+16, tj:tj+16] += ZA0
            float *c_ptr = c + ti * n + tj;
            for (int row = 0; row < 16; row++) {
                svfloat32_t za_row = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                svfloat32_t c_row = svld1_f32(pg, c_ptr);
                c_row = svadd_f32_x(pg, c_row, za_row);
                svst1_f32(pg, c_ptr, c_row);
                c_ptr += n;
            }
            // Store ZA2: C[ti:ti+16, tj+16:tj+32] += ZA2
            c_ptr = c + ti * n + tj + 16;
            for (int row = 0; row < 16; row++) {
                svfloat32_t za_row = svread_hor_za32_f32_m(svundef_f32(), pg, 2, row);
                svfloat32_t c_row = svld1_f32(pg, c_ptr);
                c_row = svadd_f32_x(pg, c_row, za_row);
                svst1_f32(pg, c_ptr, c_row);
                c_ptr += n;
            }
            // Store ZA1: C[ti+16:ti+32, tj:tj+16] += ZA1
            c_ptr = c + (ti + 16) * n + tj;
            for (int row = 0; row < 16; row++) {
                svfloat32_t za_row = svread_hor_za32_f32_m(svundef_f32(), pg, 1, row);
                svfloat32_t c_row = svld1_f32(pg, c_ptr);
                c_row = svadd_f32_x(pg, c_row, za_row);
                svst1_f32(pg, c_ptr, c_row);
                c_ptr += n;
            }
            // Store ZA3: C[ti+16:ti+32, tj+16:tj+32] += ZA3
            c_ptr = c + (ti + 16) * n + tj + 16;
            for (int row = 0; row < 16; row++) {
                svfloat32_t za_row = svread_hor_za32_f32_m(svundef_f32(), pg, 3, row);
                svfloat32_t c_row = svld1_f32(pg, c_ptr);
                c_row = svadd_f32_x(pg, c_row, za_row);
                svst1_f32(pg, c_ptr, c_row);
                c_ptr += n;
            }
        }

        // N remainder: 16-col strip with single tile
        if (tj < n) {
            svzero_za();
            for (long k = 0; k < n; k++) {
                svfloat32_t a0 = svld1_f32(pg, aT + k * n + ti);
                svfloat32_t b0 = svld1_f32(pg, b + k * n + tj);
                svmopa_za32_f32_m(0, pg, pg, a0, b0);
            }
            float *c_ptr = c + ti * n + tj;
            for (int row = 0; row < 16; row++) {
                svfloat32_t za_row = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                svfloat32_t c_row = svld1_f32(pg, c_ptr);
                c_row = svadd_f32_x(pg, c_row, za_row);
                svst1_f32(pg, c_ptr, c_row);
                c_ptr += n;
            }

            // Second row block of N remainder
            svzero_za();
            for (long k = 0; k < n; k++) {
                svfloat32_t a1 = svld1_f32(pg, aT + k * n + ti + 16);
                svfloat32_t b0 = svld1_f32(pg, b + k * n + tj);
                svmopa_za32_f32_m(0, pg, pg, a1, b0);
            }
            c_ptr = c + (ti + 16) * n + tj;
            for (int row = 0; row < 16; row++) {
                svfloat32_t za_row = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                svfloat32_t c_row = svld1_f32(pg, c_ptr);
                c_row = svadd_f32_x(pg, c_row, za_row);
                svst1_f32(pg, c_ptr, c_row);
                c_ptr += n;
            }
        }
    }

    // M remainder: 16-row strip with single tile
    if (ti < n) {
        for (long tj = 0; tj < n; tj += 16) {
            svzero_za();
            for (long k = 0; k < n; k++) {
                svfloat32_t a0 = svld1_f32(pg, aT + k * n + ti);
                svfloat32_t b0 = svld1_f32(pg, b + k * n + tj);
                svmopa_za32_f32_m(0, pg, pg, a0, b0);
            }
            float *c_ptr = c + ti * n + tj;
            for (int row = 0; row < 16; row++) {
                svfloat32_t za_row = svread_hor_za32_f32_m(svundef_f32(), pg, 0, row);
                svfloat32_t c_row = svld1_f32(pg, c_ptr);
                c_row = svadd_f32_x(pg, c_row, za_row);
                svst1_f32(pg, c_ptr, c_row);
                c_ptr += n;
            }
        }
    }
}

// =============================================================================
// block_muladd_fmopa_f64: C += A^T * B using multi-tile SME FMOPA for float64
// =============================================================================
// Processes 16×16 chunks with 4 ZA tiles (8×8 per tile), single-tile fallback
// for 8×8 remainder. Requires blockDim to be a multiple of 8.
//
// func block_muladd_fmopa_f64(aT, b, c unsafe.Pointer, blockDim int64)
void block_muladd_fmopa_f64(double * restrict aT, double * restrict b, double * restrict c,
                             long blockDim) __arm_streaming __arm_out("za") {
    long n = blockDim;

    svbool_t pg = svptrue_b64();

    // Process 16×16 chunks with 4-tile FMOPA (8×8 per tile)
    long ti = 0;
    for (; ti + 16 <= n; ti += 16) {
        long tj = 0;
        for (; tj + 16 <= n; tj += 16) {
            svzero_za();

            for (long k = 0; k < n; k++) {
                svfloat64_t a0 = svld1_f64(pg, aT + k * n + ti);
                svfloat64_t a1 = svld1_f64(pg, aT + k * n + ti + 8);
                svfloat64_t b0 = svld1_f64(pg, b + k * n + tj);
                svfloat64_t b1 = svld1_f64(pg, b + k * n + tj + 8);

                svmopa_za64_f64_m(0, pg, pg, a0, b0);
                svmopa_za64_f64_m(1, pg, pg, a1, b0);
                svmopa_za64_f64_m(2, pg, pg, a0, b1);
                svmopa_za64_f64_m(3, pg, pg, a1, b1);
            }

            // Store ZA0: C[ti:ti+8, tj:tj+8] += ZA0
            double *c_ptr = c + ti * n + tj;
            for (int row = 0; row < 8; row++) {
                svfloat64_t za_row = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                svfloat64_t c_row = svld1_f64(pg, c_ptr);
                c_row = svadd_f64_x(pg, c_row, za_row);
                svst1_f64(pg, c_ptr, c_row);
                c_ptr += n;
            }
            // Store ZA2: C[ti:ti+8, tj+8:tj+16] += ZA2
            c_ptr = c + ti * n + tj + 8;
            for (int row = 0; row < 8; row++) {
                svfloat64_t za_row = svread_hor_za64_f64_m(svundef_f64(), pg, 2, row);
                svfloat64_t c_row = svld1_f64(pg, c_ptr);
                c_row = svadd_f64_x(pg, c_row, za_row);
                svst1_f64(pg, c_ptr, c_row);
                c_ptr += n;
            }
            // Store ZA1: C[ti+8:ti+16, tj:tj+8] += ZA1
            c_ptr = c + (ti + 8) * n + tj;
            for (int row = 0; row < 8; row++) {
                svfloat64_t za_row = svread_hor_za64_f64_m(svundef_f64(), pg, 1, row);
                svfloat64_t c_row = svld1_f64(pg, c_ptr);
                c_row = svadd_f64_x(pg, c_row, za_row);
                svst1_f64(pg, c_ptr, c_row);
                c_ptr += n;
            }
            // Store ZA3: C[ti+8:ti+16, tj+8:tj+16] += ZA3
            c_ptr = c + (ti + 8) * n + tj + 8;
            for (int row = 0; row < 8; row++) {
                svfloat64_t za_row = svread_hor_za64_f64_m(svundef_f64(), pg, 3, row);
                svfloat64_t c_row = svld1_f64(pg, c_ptr);
                c_row = svadd_f64_x(pg, c_row, za_row);
                svst1_f64(pg, c_ptr, c_row);
                c_ptr += n;
            }
        }

        // N remainder: 8-col strip with single tile
        if (tj < n) {
            svzero_za();
            for (long k = 0; k < n; k++) {
                svfloat64_t a0 = svld1_f64(pg, aT + k * n + ti);
                svfloat64_t b0 = svld1_f64(pg, b + k * n + tj);
                svmopa_za64_f64_m(0, pg, pg, a0, b0);
            }
            double *c_ptr = c + ti * n + tj;
            for (int row = 0; row < 8; row++) {
                svfloat64_t za_row = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                svfloat64_t c_row = svld1_f64(pg, c_ptr);
                c_row = svadd_f64_x(pg, c_row, za_row);
                svst1_f64(pg, c_ptr, c_row);
                c_ptr += n;
            }

            // Second row block of N remainder
            svzero_za();
            for (long k = 0; k < n; k++) {
                svfloat64_t a1 = svld1_f64(pg, aT + k * n + ti + 8);
                svfloat64_t b0 = svld1_f64(pg, b + k * n + tj);
                svmopa_za64_f64_m(0, pg, pg, a1, b0);
            }
            c_ptr = c + (ti + 8) * n + tj;
            for (int row = 0; row < 8; row++) {
                svfloat64_t za_row = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                svfloat64_t c_row = svld1_f64(pg, c_ptr);
                c_row = svadd_f64_x(pg, c_row, za_row);
                svst1_f64(pg, c_ptr, c_row);
                c_ptr += n;
            }
        }
    }

    // M remainder: 8-row strip with single tile
    if (ti < n) {
        for (long tj = 0; tj < n; tj += 8) {
            svzero_za();
            for (long k = 0; k < n; k++) {
                svfloat64_t a0 = svld1_f64(pg, aT + k * n + ti);
                svfloat64_t b0 = svld1_f64(pg, b + k * n + tj);
                svmopa_za64_f64_m(0, pg, pg, a0, b0);
            }
            double *c_ptr = c + ti * n + tj;
            for (int row = 0; row < 8; row++) {
                svfloat64_t za_row = svread_hor_za64_f64_m(svundef_f64(), pg, 0, row);
                svfloat64_t c_row = svld1_f64(pg, c_ptr);
                c_row = svadd_f64_x(pg, c_row, za_row);
                svst1_f64(pg, c_ptr, c_row);
                c_ptr += n;
            }
        }
    }
}
