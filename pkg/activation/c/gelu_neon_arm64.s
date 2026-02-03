	.build_version macos, 15, 0	sdk_version 15, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_gelu_approx_neon_f32           ; -- Begin function gelu_approx_neon_f32
	.p2align	2
_gelu_approx_neon_f32:                  ; @gelu_approx_neon_f32
; %bb.0:
	ldr	x8, [x2]
	cmp	x8, #1
	b.lt	LBB0_8
; %bb.1:
	fmov.4s	v0, #1.00000000
	cmp	x8, #4
	b.hs	LBB0_3
; %bb.2:
	mov	x12, #0                         ; =0x0
	b	LBB0_5
LBB0_3:
	mov	x9, #0                          ; =0x0
	mov	w10, #56099                     ; =0xdb23
	movk	w10, #49113, lsl #16
	dup.4s	v1, w10
	mov	w10, #29208                     ; =0x7218
	movk	w10, #17073, lsl #16
	dup.4s	v2, w10
	mov	w10, #43579                     ; =0xaa3b
	movk	w10, #16312, lsl #16
	dup.4s	v3, w10
	mov	w10, #32768                     ; =0x8000
	movk	w10, #48945, lsl #16
	dup.4s	v4, w10
	mov	w10, #32899                     ; =0x8083
	movk	w10, #14686, lsl #16
	dup.4s	v5, w10
	mov	w10, #2913                      ; =0xb61
	movk	w10, #15030, lsl #16
	dup.4s	v6, w10
	mov	w10, #34953                     ; =0x8889
	movk	w10, #15368, lsl #16
	dup.4s	v7, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15658, lsl #16
	dup.4s	v16, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15914, lsl #16
	dup.4s	v17, w10
	mov	w10, #44112                     ; =0xac50
	movk	w10, #49838, lsl #16
	dup.4s	v18, w10
	mov	x10, x1
	mov	x11, x0
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q19, [x11], #16
	fmul.4s	v20, v19, v1
	fmul.4s	v21, v20, v3
	frintn.4s	v21, v21
	fmul.4s	v22, v21, v4
	fadd.4s	v22, v20, v22
	fmul.4s	v23, v21, v5
	fadd.4s	v22, v22, v23
	mov.16b	v23, v7
	fmla.4s	v23, v6, v22
	mov.16b	v24, v16
	fmla.4s	v24, v22, v23
	mov.16b	v23, v17
	fmla.4s	v23, v22, v24
	movi.4s	v24, #63, lsl #24
	fmla.4s	v24, v22, v23
	mov.16b	v23, v0
	fmla.4s	v23, v22, v24
	mov.16b	v24, v0
	fmla.4s	v24, v22, v23
	fcvtns.4s	v21, v21
	shl.4s	v21, v21, #23
	add.4s	v21, v21, v0
	fmul.4s	v21, v24, v21
	fcmgt.4s	v22, v20, v2
	fcmgt.4s	v20, v18, v20
	fadd.4s	v21, v21, v0
	fdiv.4s	v21, v0, v21
	bic.16b	v21, v21, v22
	bsl.16b	v20, v0, v21
	fmul.4s	v19, v19, v20
	str	q19, [x10], #16
	add	x12, x9, #4
	add	x13, x9, #8
	mov	x9, x12
	cmp	x13, x8
	b.le	LBB0_4
LBB0_5:
	subs	x8, x8, x12
	b.ls	LBB0_8
; %bb.6:
	lsl	x10, x12, #2
	add	x9, x1, x10
	add	x10, x0, x10
	mov	w11, #56099                     ; =0xdb23
	movk	w11, #49113, lsl #16
	fmov	s1, w11
	mov	w11, #29208                     ; =0x7218
	movk	w11, #17073, lsl #16
	dup.4s	v2, w11
	mov	w11, #43579                     ; =0xaa3b
	movk	w11, #16312, lsl #16
	dup.4s	v3, w11
	mov	w11, #32768                     ; =0x8000
	movk	w11, #48945, lsl #16
	dup.4s	v4, w11
	mov	w11, #32899                     ; =0x8083
	movk	w11, #14686, lsl #16
	dup.4s	v5, w11
	mov	w11, #2913                      ; =0xb61
	movk	w11, #15030, lsl #16
	dup.4s	v6, w11
	mov	w11, #34953                     ; =0x8889
	movk	w11, #15368, lsl #16
	dup.4s	v7, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15658, lsl #16
	dup.4s	v16, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15914, lsl #16
	dup.4s	v17, w11
	mov	w11, #44112                     ; =0xac50
	movk	w11, #49838, lsl #16
	dup.4s	v18, w11
	mvni.4s	v19, #127, msl #16
	fneg.4s	v19, v19
	fmov	s20, #1.00000000
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s21, [x10], #4
	fmul	s22, s21, s1
	dup.4s	v23, v22[0]
	fmul.4s	v22, v3, v22[0]
	frintn.4s	v22, v22
	fmul.4s	v24, v22, v4
	fadd.4s	v24, v23, v24
	fmul.4s	v25, v22, v5
	fadd.4s	v24, v24, v25
	mov.16b	v25, v7
	fmla.4s	v25, v6, v24
	mov.16b	v26, v16
	fmla.4s	v26, v24, v25
	mov.16b	v25, v17
	fmla.4s	v25, v24, v26
	movi.4s	v26, #63, lsl #24
	fmla.4s	v26, v24, v25
	mov.16b	v25, v0
	fmla.4s	v25, v24, v26
	mov.16b	v26, v0
	fmla.4s	v26, v24, v25
	fcvtns.4s	v22, v22
	fcmgt.4s	v24, v23, v2
	shl.4s	v22, v22, #23
	add.4s	v22, v22, v0
	fmul.4s	v22, v26, v22
	fcmgt.4s	v23, v18, v23
	bit.16b	v22, v19, v24
	bic.16b	v22, v22, v23
	fadd	s22, s22, s20
	fdiv	s22, s20, s22
	fmul	s21, s21, s22
	str	s21, [x9], #4
	subs	x8, x8, #1
	b.ne	LBB0_7
LBB0_8:
	ret
                                        ; -- End function
	.globl	_gelu_neon_f32                  ; -- Begin function gelu_neon_f32
	.p2align	2
_gelu_neon_f32:                         ; @gelu_neon_f32
; %bb.0:
	ldr	x8, [x2]
	cmp	x8, #1
	b.lt	LBB1_9
; %bb.1:
	stp	d11, d10, [sp, #-32]!           ; 16-byte Folded Spill
	stp	d9, d8, [sp, #16]               ; 16-byte Folded Spill
	fmov.4s	v0, #1.00000000
	cmp	x8, #4
	b.hs	LBB1_3
; %bb.2:
	mov	x12, #0                         ; =0x0
	b	LBB1_5
LBB1_3:
	mov	x9, #0                          ; =0x0
	mov	w10, #1267                      ; =0x4f3
	movk	w10, #16181, lsl #16
	dup.4s	v1, w10
	mov	w10, #47621                     ; =0xba05
	movk	w10, #16039, lsl #16
	dup.4s	v2, w10
	mov	w10, #-1028653056               ; =0xc2b00000
	dup.4s	v3, w10
	mov	w10, #1118830592                ; =0x42b00000
	dup.4s	v4, w10
	mov	w10, #43579                     ; =0xaa3b
	movk	w10, #16312, lsl #16
	dup.4s	v5, w10
	mov	w10, #32768                     ; =0x8000
	movk	w10, #48945, lsl #16
	dup.4s	v6, w10
	mov	w10, #32899                     ; =0x8083
	movk	w10, #14686, lsl #16
	dup.4s	v7, w10
	mov	w10, #2913                      ; =0xb61
	movk	w10, #15030, lsl #16
	dup.4s	v16, w10
	mov	w10, #34953                     ; =0x8889
	movk	w10, #15368, lsl #16
	dup.4s	v17, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15658, lsl #16
	dup.4s	v18, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15914, lsl #16
	dup.4s	v19, w10
	mov	w10, #56354                     ; =0xdc22
	movk	w10, #16263, lsl #16
	dup.4s	v20, w10
	mov	w10, #227                       ; =0xe3
	movk	w10, #49082, lsl #16
	dup.4s	v21, w10
	mov	w10, #61667                     ; =0xf0e3
	movk	w10, #16309, lsl #16
	dup.4s	v22, w10
	mov	w10, #43406                     ; =0xa98e
	movk	w10, #48785, lsl #16
	dup.4s	v23, w10
	movi.4s	v24, #63, lsl #24
	mov	w10, #30982                     ; =0x7906
	movk	w10, #16002, lsl #16
	dup.4s	v25, w10
	mov	x10, x1
	mov	x11, x0
LBB1_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q26, [x11], #16
	fmul.4s	v27, v26, v1
	mov.16b	v28, v0
	fneg.4s	v29, v27
	fmul.4s	v29, v27, v29
	fmax.4s	v29, v29, v3
	fabs.4s	v30, v27
	fmin.4s	v29, v29, v4
	fmul.4s	v31, v29, v5
	frintn.4s	v31, v31
	fmul.4s	v8, v31, v6
	fadd.4s	v29, v29, v8
	fmla.4s	v28, v2, v30
	fmul.4s	v30, v31, v7
	fadd.4s	v29, v29, v30
	mov.16b	v30, v17
	fmla.4s	v30, v16, v29
	mov.16b	v8, v18
	fdiv.4s	v28, v0, v28
	fmla.4s	v8, v29, v30
	mov.16b	v30, v19
	fmla.4s	v30, v29, v8
	movi.4s	v8, #63, lsl #24
	mov.16b	v9, v0
	fmla.4s	v8, v29, v30
	fmla.4s	v9, v29, v8
	mov.16b	v30, v0
	fcvtns.4s	v31, v31
	shl.4s	v31, v31, #23
	add.4s	v31, v31, v0
	fmla.4s	v30, v29, v9
	mov.16b	v29, v21
	fmla.4s	v29, v20, v28
	mov.16b	v8, v22
	fmla.4s	v8, v28, v29
	mov.16b	v29, v23
	fmul.4s	v30, v30, v31
	fmla.4s	v29, v28, v8
	mov.16b	v31, v25
	fmla.4s	v31, v28, v29
	fmul.4s	v28, v28, v31
	fmul.4s	v28, v28, v30
	fcmlt.4s	v27, v27, #0.0
	fsub.4s	v28, v0, v28
	fneg.4s	v29, v28
	bsl.16b	v27, v29, v28
	fadd.4s	v27, v27, v0
	fmul.4s	v27, v27, v24
	fmul.4s	v26, v26, v27
	str	q26, [x10], #16
	add	x12, x9, #4
	add	x13, x9, #8
	mov	x9, x12
	cmp	x13, x8
	b.le	LBB1_4
LBB1_5:
	subs	x8, x8, x12
	b.ls	LBB1_8
; %bb.6:
	lsl	x10, x12, #2
	add	x9, x1, x10
	add	x10, x0, x10
	mov	w11, #47621                     ; =0xba05
	movk	w11, #16039, lsl #16
	dup.4s	v1, w11
	mov	w11, #-1028653056               ; =0xc2b00000
	dup.4s	v2, w11
	mov	w11, #1118830592                ; =0x42b00000
	dup.4s	v3, w11
	mov	w11, #43579                     ; =0xaa3b
	movk	w11, #16312, lsl #16
	dup.4s	v4, w11
	mov	w11, #32768                     ; =0x8000
	movk	w11, #48945, lsl #16
	dup.4s	v5, w11
	mov	w11, #32899                     ; =0x8083
	movk	w11, #14686, lsl #16
	dup.4s	v6, w11
	mov	w11, #2913                      ; =0xb61
	movk	w11, #15030, lsl #16
	dup.4s	v7, w11
	mov	w11, #34953                     ; =0x8889
	movk	w11, #15368, lsl #16
	dup.4s	v16, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15658, lsl #16
	dup.4s	v17, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15914, lsl #16
	dup.4s	v18, w11
	mov	w11, #56354                     ; =0xdc22
	movk	w11, #16263, lsl #16
	dup.4s	v19, w11
	mov	w11, #227                       ; =0xe3
	movk	w11, #49082, lsl #16
	dup.4s	v20, w11
	mov	w11, #61667                     ; =0xf0e3
	movk	w11, #16309, lsl #16
	dup.4s	v21, w11
	mov	w11, #43406                     ; =0xa98e
	movk	w11, #48785, lsl #16
	dup.4s	v22, w11
	mov	w11, #1267                      ; =0x4f3
	movk	w11, #16181, lsl #16
	fmov	s23, w11
	mov	w11, #30982                     ; =0x7906
	movk	w11, #16002, lsl #16
	dup.4s	v24, w11
	fmov	s25, #0.50000000
	fmov	s26, #1.00000000
LBB1_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s27, [x10], #4
	fmul	s28, s27, s23
	dup.4s	v29, v28[0]
	mov.16b	v30, v0
	fnmul	s28, s28, s28
	fabs.4s	v31, v29
	dup.4s	v28, v28[0]
	fmax.4s	v28, v28, v2
	fmin.4s	v28, v28, v3
	fmul.4s	v8, v28, v4
	fmla.4s	v30, v1, v31
	frintn.4s	v31, v8
	fmul.4s	v8, v31, v5
	fadd.4s	v28, v28, v8
	fmul.4s	v8, v31, v6
	fadd.4s	v28, v28, v8
	fdiv.4s	v30, v0, v30
	mov.16b	v8, v16
	fmla.4s	v8, v7, v28
	mov.16b	v9, v17
	fmla.4s	v9, v28, v8
	mov.16b	v8, v18
	fcmlt.4s	v29, v29, #0.0
	fmla.4s	v8, v28, v9
	movi.4s	v9, #63, lsl #24
	fmla.4s	v9, v28, v8
	mov.16b	v8, v0
	mov.16b	v10, v0
	fmla.4s	v8, v28, v9
	fcvtns.4s	v31, v31
	shl.4s	v31, v31, #23
	add.4s	v31, v31, v0
	mov.16b	v9, v20
	fmla.4s	v9, v19, v30
	fmla.4s	v10, v28, v8
	mov.16b	v28, v21
	fmla.4s	v28, v30, v9
	mov.16b	v8, v22
	fmla.4s	v8, v30, v28
	mov.16b	v28, v24
	fmul.4s	v31, v10, v31
	fmla.4s	v28, v30, v8
	fmul.4s	v28, v30, v28
	fmul.4s	v28, v28, v31
	fsub.4s	v28, v0, v28
	fneg.4s	v30, v28
	bit.16b	v28, v30, v29
	fmul	s27, s27, s25
	fadd	s28, s28, s26
	fmul	s27, s27, s28
	str	s27, [x9], #4
	subs	x8, x8, #1
	b.ne	LBB1_7
LBB1_8:
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp], #32             ; 16-byte Folded Reload
LBB1_9:
	ret
                                        ; -- End function
	.globl	_gelu_approx_neon_f64           ; -- Begin function gelu_approx_neon_f64
	.p2align	2
_gelu_approx_neon_f64:                  ; @gelu_approx_neon_f64
; %bb.0:
	ldr	x14, [x2]
	cmp	x14, #1
	b.lt	LBB2_8
; %bb.1:
	mov	x10, #33534                     ; =0x82fe
	movk	x10, #25899, lsl #16
	movk	x10, #5447, lsl #32
	movk	x10, #16375, lsl #48
	mov	x11, #4276092928                ; =0xfee00000
	movk	x11, #11842, lsl #32
	movk	x11, #49126, lsl #48
	mov	x8, #15478                      ; =0x3c76
	movk	x8, #13689, lsl #16
	movk	x8, #14831, lsl #32
	movk	x8, #48618, lsl #48
	mov	x9, #40986                      ; =0xa01a
	movk	x9, #6657, lsl #16
	movk	x9, #416, lsl #32
	movk	x9, #16122, lsl #48
	fmov.2d	v0, #0.50000000
	mov	x12, #40986                     ; =0xa01a
	movk	x12, #6657, lsl #16
	movk	x12, #416, lsl #32
	movk	x12, #16170, lsl #48
	fmov.2d	v1, #1.00000000
	mov	x13, #27671                     ; =0x6c17
	movk	x13, #5825, lsl #16
	movk	x13, #49516, lsl #32
	movk	x13, #16214, lsl #48
	b.ne	LBB2_3
; %bb.2:
	mov	x2, #0                          ; =0x0
	b	LBB2_5
LBB2_3:
	mov	x15, #0                         ; =0x0
	mov	x16, #44040                     ; =0xac08
	movk	x16, #23068, lsl #16
	movk	x16, #15204, lsl #32
	movk	x16, #49147, lsl #48
	dup.2d	v2, x16
	mov	x16, #43980465111040            ; =0x280000000000
	movk	x16, #49286, lsl #48
	dup.2d	v3, x16
	mov	x16, #43980465111040            ; =0x280000000000
	movk	x16, #16518, lsl #48
	dup.2d	v4, x16
	dup.2d	v5, x10
	dup.2d	v6, x11
	dup.2d	v7, x8
	dup.2d	v16, x9
	dup.2d	v17, x12
	mov	x16, #1229782938247303441       ; =0x1111111111111111
	movk	x16, #16257, lsl #48
	dup.2d	v18, x16
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16293, lsl #48
	dup.2d	v19, x16
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16325, lsl #48
	dup.2d	v20, x16
	mov	x16, x1
	mov	x17, x0
	dup.2d	v21, x13
LBB2_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q22, [x17], #16
	fmul.2d	v23, v22, v2
	fmax.2d	v23, v23, v3
	fmin.2d	v23, v23, v4
	fmul.2d	v24, v23, v5
	frintn.2d	v24, v24
	fmul.2d	v25, v24, v6
	fmul.2d	v26, v24, v7
	fadd.2d	v23, v23, v25
	fadd.2d	v23, v23, v26
	mov.16b	v25, v17
	fmla.2d	v25, v16, v23
	mov.16b	v26, v21
	fmla.2d	v26, v23, v25
	mov.16b	v25, v18
	fmla.2d	v25, v23, v26
	mov.16b	v26, v19
	fmla.2d	v26, v23, v25
	mov.16b	v25, v20
	fmla.2d	v25, v23, v26
	mov.16b	v26, v0
	fmla.2d	v26, v23, v25
	mov.16b	v25, v1
	fmla.2d	v25, v23, v26
	mov.16b	v26, v1
	fmla.2d	v26, v23, v25
	fcvtzs.2d	v23, v24
	shl.2d	v23, v23, #52
	add.2d	v23, v23, v1
	fmul.2d	v23, v26, v23
	fadd.2d	v23, v23, v1
	fdiv.2d	v23, v1, v23
	fmul.2d	v22, v22, v23
	str	q22, [x16], #16
	add	x2, x15, #2
	add	x3, x15, #4
	mov	x15, x2
	cmp	x3, x14
	b.le	LBB2_4
LBB2_5:
	subs	x14, x14, x2
	b.ls	LBB2_8
; %bb.6:
	lsl	x16, x2, #3
	add	x15, x1, x16
	add	x16, x0, x16
	mov	x17, #44040                     ; =0xac08
	movk	x17, #23068, lsl #16
	movk	x17, #15204, lsl #32
	movk	x17, #49147, lsl #48
	fmov	d2, x17
	mov	x17, #43980465111040            ; =0x280000000000
	movk	x17, #49286, lsl #48
	fmov	d3, x17
	mov	x17, #43980465111040            ; =0x280000000000
	movk	x17, #16518, lsl #48
	dup.2d	v4, x10
	dup.2d	v5, x11
	fmov	d6, x17
	dup.2d	v7, x8
	dup.2d	v16, x9
	dup.2d	v17, x12
	dup.2d	v18, x13
	mov	x8, #1229782938247303441        ; =0x1111111111111111
	movk	x8, #16257, lsl #48
	dup.2d	v19, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16293, lsl #48
	dup.2d	v20, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16325, lsl #48
	dup.2d	v21, x8
	fmov	d22, #1.00000000
LBB2_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d23, [x16], #8
	fmul	d24, d23, d2
	fcmp	d24, d3
	fcsel	d24, d3, d24, mi
	fcmp	d24, d6
	fcsel	d24, d6, d24, gt
	dup.2d	v25, v24[0]
	fmul.2d	v24, v4, v24[0]
	frintn.2d	v24, v24
	fmul.2d	v26, v24, v5
	fadd.2d	v25, v25, v26
	fmul.2d	v26, v24, v7
	fadd.2d	v25, v25, v26
	mov.16b	v26, v17
	fmla.2d	v26, v16, v25
	mov.16b	v27, v18
	fmla.2d	v27, v25, v26
	mov.16b	v26, v19
	fmla.2d	v26, v25, v27
	mov.16b	v27, v20
	fmla.2d	v27, v25, v26
	mov.16b	v26, v21
	fmla.2d	v26, v25, v27
	mov.16b	v27, v0
	fmla.2d	v27, v25, v26
	mov.16b	v26, v1
	fmla.2d	v26, v25, v27
	mov.16b	v27, v1
	fmla.2d	v27, v25, v26
	fcvtzs.2d	v24, v24
	shl.2d	v24, v24, #52
	add.2d	v24, v24, v1
	fmul.2d	v24, v27, v24
	fadd	d24, d24, d22
	fdiv	d24, d22, d24
	fmul	d23, d23, d24
	str	d23, [x15], #8
	subs	x14, x14, #1
	b.ne	LBB2_7
LBB2_8:
	ret
                                        ; -- End function
	.globl	_gelu_neon_f64                  ; -- Begin function gelu_neon_f64
	.p2align	2
_gelu_neon_f64:                         ; @gelu_neon_f64
; %bb.0:
	ldr	x4, [x2]
	cmp	x4, #1
	b.lt	LBB3_9
; %bb.1:
	stp	d13, d12, [sp, #-64]!           ; 16-byte Folded Spill
	stp	d11, d10, [sp, #16]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	mov	x15, #31628                     ; =0x7b8c
	movk	x15, #43325, lsl #16
	movk	x15, #63296, lsl #32
	movk	x15, #16340, lsl #48
	mov	x13, #33534                     ; =0x82fe
	movk	x13, #25899, lsl #16
	movk	x13, #5447, lsl #32
	movk	x13, #16375, lsl #48
	fmov.2d	v0, #1.00000000
	mov	x16, #4276092928                ; =0xfee00000
	movk	x16, #11842, lsl #32
	movk	x16, #49126, lsl #48
	mov	x17, #15478                     ; =0x3c76
	movk	x17, #13689, lsl #16
	movk	x17, #14831, lsl #32
	movk	x17, #48618, lsl #48
	mov	x2, #40986                      ; =0xa01a
	movk	x2, #6657, lsl #16
	movk	x2, #416, lsl #32
	movk	x2, #16122, lsl #48
	mov	x3, #40986                      ; =0xa01a
	movk	x3, #6657, lsl #16
	movk	x3, #416, lsl #32
	movk	x3, #16170, lsl #48
	mov	x14, #27671                     ; =0x6c17
	movk	x14, #5825, lsl #16
	movk	x14, #49516, lsl #32
	movk	x14, #16214, lsl #48
	fmov.2d	v1, #0.50000000
	mov	x10, #41261                     ; =0xa12d
	movk	x10, #16981, lsl #16
	movk	x10, #64388, lsl #32
	movk	x10, #16368, lsl #48
	mov	x11, #19513                     ; =0x4c39
	movk	x11, #22273, lsl #16
	movk	x11, #16412, lsl #32
	movk	x11, #49143, lsl #48
	mov	x12, #57687                     ; =0xe157
	movk	x12, #21946, lsl #16
	movk	x12, #48668, lsl #32
	movk	x12, #16374, lsl #48
	mov	x9, #5225                       ; =0x1469
	movk	x9, #52284, lsl #16
	movk	x9, #13617, lsl #32
	movk	x9, #49106, lsl #48
	mov	x8, #23166                      ; =0x5a7e
	movk	x8, #50924, lsl #16
	movk	x8, #20256, lsl #32
	movk	x8, #16336, lsl #48
	b.ne	LBB3_3
; %bb.2:
	mov	x19, #0                         ; =0x0
	b	LBB3_5
LBB3_3:
	mov	x5, #0                          ; =0x0
	mov	x6, #15309                      ; =0x3bcd
	movk	x6, #26239, lsl #16
	movk	x6, #41118, lsl #32
	movk	x6, #16358, lsl #48
	dup.2d	v2, x6
	dup.2d	v3, x15
	mov	x6, #43980465111040             ; =0x280000000000
	movk	x6, #49286, lsl #48
	dup.2d	v4, x6
	dup.2d	v5, x13
	dup.2d	v6, x16
	dup.2d	v7, x17
	dup.2d	v16, x2
	dup.2d	v17, x3
	dup.2d	v18, x14
	mov	x6, #1229782938247303441        ; =0x1111111111111111
	movk	x6, #16257, lsl #48
	dup.2d	v19, x6
	mov	x6, #6148914691236517205        ; =0x5555555555555555
	movk	x6, #16293, lsl #48
	dup.2d	v20, x6
	mov	x6, #6148914691236517205        ; =0x5555555555555555
	movk	x6, #16325, lsl #48
	dup.2d	v21, x6
	dup.2d	v22, x10
	dup.2d	v23, x11
	dup.2d	v24, x12
	dup.2d	v25, x9
	mov	x6, x1
	mov	x7, x0
	dup.2d	v26, x8
LBB3_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q27, [x7], #16
	fmul.2d	v28, v27, v2
	fneg.2d	v29, v28
	mov.16b	v30, v0
	fmul.2d	v29, v28, v29
	fmax.2d	v29, v29, v4
	fmul.2d	v31, v29, v5
	frintn.2d	v31, v31
	fmul.2d	v8, v31, v6
	fabs.2d	v9, v28
	fadd.2d	v29, v29, v8
	fmul.2d	v8, v31, v7
	fadd.2d	v29, v29, v8
	mov.16b	v8, v17
	fmla.2d	v8, v16, v29
	fmla.2d	v30, v3, v9
	mov.16b	v9, v18
	fmla.2d	v9, v29, v8
	mov.16b	v8, v19
	fmla.2d	v8, v29, v9
	mov.16b	v9, v20
	fdiv.2d	v30, v0, v30
	fmla.2d	v9, v29, v8
	mov.16b	v8, v21
	fmla.2d	v8, v29, v9
	mov.16b	v9, v1
	mov.16b	v10, v0
	fmla.2d	v9, v29, v8
	fmla.2d	v10, v29, v9
	mov.16b	v8, v0
	fcvtzs.2d	v31, v31
	shl.2d	v31, v31, #52
	add.2d	v31, v31, v0
	fmla.2d	v8, v29, v10
	mov.16b	v29, v23
	fmla.2d	v29, v22, v30
	mov.16b	v9, v24
	fmla.2d	v9, v30, v29
	mov.16b	v29, v25
	fmul.2d	v31, v8, v31
	fmla.2d	v29, v30, v9
	mov.16b	v8, v26
	fmla.2d	v8, v30, v29
	fmul.2d	v29, v30, v8
	fmul.2d	v29, v29, v31
	fcmlt.2d	v28, v28, #0.0
	fsub.2d	v29, v0, v29
	fneg.2d	v30, v29
	bsl.16b	v28, v30, v29
	fadd.2d	v28, v28, v0
	fmul.2d	v28, v28, v1
	fmul.2d	v27, v27, v28
	str	q27, [x6], #16
	add	x19, x5, #2
	add	x20, x5, #4
	mov	x5, x19
	cmp	x20, x4
	b.le	LBB3_4
LBB3_5:
	subs	x4, x4, x19
	b.ls	LBB3_8
; %bb.6:
	lsl	x5, x19, #3
	add	x1, x1, x5
	add	x0, x0, x5
	mov	x5, #15309                      ; =0x3bcd
	movk	x5, #26239, lsl #16
	movk	x5, #41118, lsl #32
	movk	x5, #16358, lsl #48
	dup.2d	v2, x15
	mov	x15, #43980465111040            ; =0x280000000000
	movk	x15, #49286, lsl #48
	dup.2d	v3, x15
	dup.2d	v4, x13
	dup.2d	v5, x16
	dup.2d	v6, x17
	dup.2d	v7, x2
	dup.2d	v16, x3
	fmov	d17, x5
	dup.2d	v18, x14
	mov	x13, #1229782938247303441       ; =0x1111111111111111
	movk	x13, #16257, lsl #48
	dup.2d	v19, x13
	mov	x13, #6148914691236517205       ; =0x5555555555555555
	movk	x13, #16293, lsl #48
	dup.2d	v20, x13
	mov	x13, #6148914691236517205       ; =0x5555555555555555
	movk	x13, #16325, lsl #48
	dup.2d	v21, x13
	dup.2d	v22, x10
	dup.2d	v23, x11
	dup.2d	v24, x12
	fmov	d25, #0.50000000
	dup.2d	v26, x9
	fmov	d27, #1.00000000
	dup.2d	v28, x8
LBB3_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d29, [x0], #8
	fmul	d30, d29, d17
	dup.2d	v31, v30[0]
	mov.16b	v8, v0
	fnmul	d30, d30, d30
	dup.2d	v30, v30[0]
	fmax.2d	v30, v30, v3
	fabs.2d	v9, v31
	fmul.2d	v10, v30, v4
	frintn.2d	v10, v10
	fmul.2d	v11, v10, v5
	fadd.2d	v30, v30, v11
	fmul.2d	v11, v10, v6
	fmla.2d	v8, v2, v9
	fadd.2d	v30, v30, v11
	mov.16b	v9, v16
	fmla.2d	v9, v7, v30
	mov.16b	v11, v18
	fmla.2d	v11, v30, v9
	fdiv.2d	v8, v0, v8
	mov.16b	v9, v19
	fmla.2d	v9, v30, v11
	mov.16b	v11, v20
	fmla.2d	v11, v30, v9
	mov.16b	v9, v21
	fcmlt.2d	v31, v31, #0.0
	fmla.2d	v9, v30, v11
	mov.16b	v11, v1
	fmla.2d	v11, v30, v9
	mov.16b	v9, v0
	mov.16b	v12, v0
	fmla.2d	v9, v30, v11
	fcvtzs.2d	v10, v10
	shl.2d	v10, v10, #52
	add.2d	v10, v10, v0
	mov.16b	v11, v23
	fmla.2d	v11, v22, v8
	fmla.2d	v12, v30, v9
	mov.16b	v30, v24
	fmla.2d	v30, v8, v11
	mov.16b	v9, v26
	fmla.2d	v9, v8, v30
	mov.16b	v30, v28
	fmul.2d	v10, v12, v10
	fmla.2d	v30, v8, v9
	fmul.2d	v30, v8, v30
	fmul.2d	v30, v30, v10
	fsub.2d	v30, v0, v30
	fneg.2d	v8, v30
	bit.16b	v30, v8, v31
	fmul	d29, d29, d25
	fadd	d30, d30, d27
	fmul	d29, d29, d30
	str	d29, [x1], #8
	subs	x4, x4, #1
	b.ne	LBB3_7
LBB3_8:
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp], #64             ; 16-byte Folded Reload
LBB3_9:
	ret
                                        ; -- End function
	.globl	_silu_neon_f32                  ; -- Begin function silu_neon_f32
	.p2align	2
_silu_neon_f32:                         ; @silu_neon_f32
; %bb.0:
	ldr	x8, [x2]
	cmp	x8, #1
	b.lt	LBB4_8
; %bb.1:
	fmov.4s	v0, #1.00000000
	cmp	x8, #4
	b.hs	LBB4_3
; %bb.2:
	mov	x12, #0                         ; =0x0
	b	LBB4_5
LBB4_3:
	mov	x9, #0                          ; =0x0
	mov	w10, #29208                     ; =0x7218
	movk	w10, #49841, lsl #16
	dup.4s	v1, w10
	mov	w10, #43579                     ; =0xaa3b
	movk	w10, #49080, lsl #16
	dup.4s	v2, w10
	mov	w10, #32768                     ; =0x8000
	movk	w10, #48945, lsl #16
	dup.4s	v3, w10
	mov	w10, #32899                     ; =0x8083
	movk	w10, #14686, lsl #16
	dup.4s	v4, w10
	mov	w10, #2913                      ; =0xb61
	movk	w10, #15030, lsl #16
	dup.4s	v5, w10
	mov	w10, #34953                     ; =0x8889
	movk	w10, #15368, lsl #16
	dup.4s	v6, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15658, lsl #16
	dup.4s	v7, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15914, lsl #16
	dup.4s	v16, w10
	mov	w10, #44112                     ; =0xac50
	movk	w10, #17070, lsl #16
	dup.4s	v17, w10
	mov	x10, x1
	mov	x11, x0
LBB4_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q18, [x11], #16
	fmul.4s	v19, v18, v2
	frintn.4s	v19, v19
	fmul.4s	v20, v19, v3
	fsub.4s	v20, v20, v18
	fmul.4s	v21, v19, v4
	fadd.4s	v20, v20, v21
	mov.16b	v21, v6
	fmla.4s	v21, v5, v20
	mov.16b	v22, v7
	fmla.4s	v22, v20, v21
	mov.16b	v21, v16
	fmla.4s	v21, v20, v22
	movi.4s	v22, #63, lsl #24
	fmla.4s	v22, v20, v21
	mov.16b	v21, v0
	fmla.4s	v21, v20, v22
	mov.16b	v22, v0
	fmla.4s	v22, v20, v21
	fcvtns.4s	v19, v19
	shl.4s	v19, v19, #23
	add.4s	v19, v19, v0
	fmul.4s	v19, v22, v19
	fcmgt.4s	v20, v1, v18
	fcmgt.4s	v21, v18, v17
	fadd.4s	v19, v19, v0
	fdiv.4s	v19, v0, v19
	bic.16b	v19, v19, v20
	bit.16b	v19, v0, v21
	fmul.4s	v18, v18, v19
	str	q18, [x10], #16
	add	x12, x9, #4
	add	x13, x9, #8
	mov	x9, x12
	cmp	x13, x8
	b.le	LBB4_4
LBB4_5:
	subs	x8, x8, x12
	b.ls	LBB4_8
; %bb.6:
	lsl	x10, x12, #2
	add	x9, x1, x10
	add	x10, x0, x10
	mov	w11, #29208                     ; =0x7218
	movk	w11, #17073, lsl #16
	dup.4s	v1, w11
	mov	w11, #43579                     ; =0xaa3b
	movk	w11, #16312, lsl #16
	dup.4s	v2, w11
	mov	w11, #32768                     ; =0x8000
	movk	w11, #48945, lsl #16
	dup.4s	v3, w11
	mov	w11, #32899                     ; =0x8083
	movk	w11, #14686, lsl #16
	dup.4s	v4, w11
	mov	w11, #2913                      ; =0xb61
	movk	w11, #15030, lsl #16
	dup.4s	v5, w11
	mov	w11, #34953                     ; =0x8889
	movk	w11, #15368, lsl #16
	dup.4s	v6, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15658, lsl #16
	dup.4s	v7, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15914, lsl #16
	dup.4s	v16, w11
	mov	w11, #44112                     ; =0xac50
	movk	w11, #49838, lsl #16
	dup.4s	v17, w11
	mvni.4s	v18, #127, msl #16
	fneg.4s	v18, v18
	fmov	s19, #1.00000000
LBB4_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s20, [x10], #4
	fneg	s21, s20
	dup.4s	v22, v21[0]
	fmul.4s	v21, v2, v21[0]
	frintn.4s	v21, v21
	fmul.4s	v23, v21, v3
	fadd.4s	v23, v22, v23
	fmul.4s	v24, v21, v4
	fadd.4s	v23, v23, v24
	mov.16b	v24, v6
	fmla.4s	v24, v5, v23
	mov.16b	v25, v7
	fmla.4s	v25, v23, v24
	mov.16b	v24, v16
	fmla.4s	v24, v23, v25
	movi.4s	v25, #63, lsl #24
	fmla.4s	v25, v23, v24
	mov.16b	v24, v0
	fmla.4s	v24, v23, v25
	mov.16b	v25, v0
	fmla.4s	v25, v23, v24
	fcvtns.4s	v21, v21
	fcmgt.4s	v23, v22, v1
	shl.4s	v21, v21, #23
	add.4s	v21, v21, v0
	fmul.4s	v21, v25, v21
	fcmgt.4s	v22, v17, v22
	bit.16b	v21, v18, v23
	bic.16b	v21, v21, v22
	fadd	s21, s21, s19
	fdiv	s21, s19, s21
	fmul	s20, s20, s21
	str	s20, [x9], #4
	subs	x8, x8, #1
	b.ne	LBB4_7
LBB4_8:
	ret
                                        ; -- End function
	.globl	_silu_neon_f64                  ; -- Begin function silu_neon_f64
	.p2align	2
_silu_neon_f64:                         ; @silu_neon_f64
; %bb.0:
	ldr	x14, [x2]
	cmp	x14, #1
	b.lt	LBB5_8
; %bb.1:
	mov	x8, #33534                      ; =0x82fe
	movk	x8, #25899, lsl #16
	movk	x8, #5447, lsl #32
	movk	x8, #16375, lsl #48
	mov	x9, #4276092928                 ; =0xfee00000
	movk	x9, #11842, lsl #32
	movk	x9, #49126, lsl #48
	mov	x10, #15478                     ; =0x3c76
	movk	x10, #13689, lsl #16
	movk	x10, #14831, lsl #32
	movk	x10, #48618, lsl #48
	mov	x11, #40986                     ; =0xa01a
	movk	x11, #6657, lsl #16
	movk	x11, #416, lsl #32
	movk	x11, #16122, lsl #48
	fmov.2d	v0, #0.50000000
	mov	x12, #40986                     ; =0xa01a
	movk	x12, #6657, lsl #16
	movk	x12, #416, lsl #32
	movk	x12, #16170, lsl #48
	fmov.2d	v1, #1.00000000
	mov	x13, #27671                     ; =0x6c17
	movk	x13, #5825, lsl #16
	movk	x13, #49516, lsl #32
	movk	x13, #16214, lsl #48
	b.ne	LBB5_3
; %bb.2:
	mov	x2, #0                          ; =0x0
	b	LBB5_5
LBB5_3:
	mov	x15, #0                         ; =0x0
	mov	x16, #43980465111040            ; =0x280000000000
	movk	x16, #49286, lsl #48
	dup.2d	v2, x16
	mov	x16, #43980465111040            ; =0x280000000000
	movk	x16, #16518, lsl #48
	dup.2d	v3, x16
	dup.2d	v4, x8
	dup.2d	v5, x9
	dup.2d	v6, x10
	dup.2d	v7, x11
	dup.2d	v16, x12
	mov	x16, #1229782938247303441       ; =0x1111111111111111
	movk	x16, #16257, lsl #48
	dup.2d	v17, x16
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16293, lsl #48
	dup.2d	v18, x16
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16325, lsl #48
	dup.2d	v19, x16
	mov	x16, x1
	mov	x17, x0
	dup.2d	v20, x13
LBB5_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q21, [x17], #16
	fneg.2d	v22, v21
	fmax.2d	v22, v22, v2
	fmin.2d	v22, v22, v3
	fmul.2d	v23, v22, v4
	frintn.2d	v23, v23
	fmul.2d	v24, v23, v5
	fmul.2d	v25, v23, v6
	fadd.2d	v22, v22, v24
	fadd.2d	v22, v22, v25
	mov.16b	v24, v16
	fmla.2d	v24, v7, v22
	mov.16b	v25, v20
	fmla.2d	v25, v22, v24
	mov.16b	v24, v17
	fmla.2d	v24, v22, v25
	mov.16b	v25, v18
	fmla.2d	v25, v22, v24
	mov.16b	v24, v19
	fmla.2d	v24, v22, v25
	mov.16b	v25, v0
	fmla.2d	v25, v22, v24
	mov.16b	v24, v1
	fmla.2d	v24, v22, v25
	mov.16b	v25, v1
	fmla.2d	v25, v22, v24
	fcvtzs.2d	v22, v23
	shl.2d	v22, v22, #52
	add.2d	v22, v22, v1
	fmul.2d	v22, v25, v22
	fadd.2d	v22, v22, v1
	fdiv.2d	v22, v1, v22
	fmul.2d	v21, v21, v22
	str	q21, [x16], #16
	add	x2, x15, #2
	add	x3, x15, #4
	mov	x15, x2
	cmp	x3, x14
	b.le	LBB5_4
LBB5_5:
	subs	x14, x14, x2
	b.ls	LBB5_8
; %bb.6:
	lsl	x16, x2, #3
	add	x15, x1, x16
	add	x16, x0, x16
	mov	x17, #43980465111040            ; =0x280000000000
	movk	x17, #16518, lsl #48
	fmov	d2, x17
	mov	x17, #43980465111040            ; =0x280000000000
	movk	x17, #49286, lsl #48
	fmov	d3, x17
	dup.2d	v4, x8
	dup.2d	v5, x9
	dup.2d	v6, x10
	dup.2d	v7, x11
	dup.2d	v16, x12
	dup.2d	v17, x13
	mov	x8, #1229782938247303441        ; =0x1111111111111111
	movk	x8, #16257, lsl #48
	dup.2d	v18, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16293, lsl #48
	dup.2d	v19, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16325, lsl #48
	dup.2d	v20, x8
	fmov	d21, #1.00000000
LBB5_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d22, [x16], #8
	fneg	d23, d22
	fcmp	d22, d2
	fcsel	d23, d3, d23, gt
	fcmp	d23, d2
	fcsel	d23, d2, d23, gt
	dup.2d	v24, v23[0]
	fmul.2d	v23, v4, v23[0]
	frintn.2d	v23, v23
	fmul.2d	v25, v23, v5
	fadd.2d	v24, v24, v25
	fmul.2d	v25, v23, v6
	fadd.2d	v24, v24, v25
	mov.16b	v25, v16
	fmla.2d	v25, v7, v24
	mov.16b	v26, v17
	fmla.2d	v26, v24, v25
	mov.16b	v25, v18
	fmla.2d	v25, v24, v26
	mov.16b	v26, v19
	fmla.2d	v26, v24, v25
	mov.16b	v25, v20
	fmla.2d	v25, v24, v26
	mov.16b	v26, v0
	fmla.2d	v26, v24, v25
	mov.16b	v25, v1
	fmla.2d	v25, v24, v26
	mov.16b	v26, v1
	fmla.2d	v26, v24, v25
	fcvtzs.2d	v23, v23
	shl.2d	v23, v23, #52
	add.2d	v23, v23, v1
	fmul.2d	v23, v26, v23
	fadd	d23, d23, d21
	fdiv	d23, d21, d23
	fmul	d22, d22, d23
	str	d22, [x15], #8
	subs	x14, x14, #1
	b.ne	LBB5_7
LBB5_8:
	ret
                                        ; -- End function
	.globl	_tanh_neon_f32                  ; -- Begin function tanh_neon_f32
	.p2align	2
_tanh_neon_f32:                         ; @tanh_neon_f32
; %bb.0:
	ldr	x8, [x2]
	cmp	x8, #1
	b.lt	LBB6_8
; %bb.1:
	fmov.4s	v0, #1.00000000
	cmp	x8, #4
	b.hs	LBB6_3
; %bb.2:
	mov	x12, #0                         ; =0x0
	b	LBB6_5
LBB6_3:
	mov	x9, #0                          ; =0x0
	movi.4s	v1, #192, lsl #24
	mov	w10, #29208                     ; =0x7218
	movk	w10, #17073, lsl #16
	dup.4s	v2, w10
	mov	w10, #43579                     ; =0xaa3b
	movk	w10, #16312, lsl #16
	dup.4s	v3, w10
	mov	w10, #32768                     ; =0x8000
	movk	w10, #48945, lsl #16
	dup.4s	v4, w10
	mov	w10, #32899                     ; =0x8083
	movk	w10, #14686, lsl #16
	dup.4s	v5, w10
	mov	w10, #2913                      ; =0xb61
	movk	w10, #15030, lsl #16
	dup.4s	v6, w10
	mov	w10, #34953                     ; =0x8889
	movk	w10, #15368, lsl #16
	dup.4s	v7, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15658, lsl #16
	dup.4s	v16, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15914, lsl #16
	dup.4s	v17, w10
	mov	w10, #44112                     ; =0xac50
	movk	w10, #49838, lsl #16
	dup.4s	v18, w10
	fmov.4s	v19, #-1.00000000
	mov	x10, x1
	mov	x11, x0
LBB6_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q20, [x11], #16
	fmul.4s	v20, v20, v1
	fmul.4s	v21, v20, v3
	frintn.4s	v21, v21
	fmul.4s	v22, v21, v4
	fadd.4s	v22, v20, v22
	fmul.4s	v23, v21, v5
	fadd.4s	v22, v22, v23
	mov.16b	v23, v7
	fmla.4s	v23, v6, v22
	mov.16b	v24, v16
	fmla.4s	v24, v22, v23
	mov.16b	v23, v17
	fmla.4s	v23, v22, v24
	movi.4s	v24, #63, lsl #24
	fmla.4s	v24, v22, v23
	mov.16b	v23, v0
	fmla.4s	v23, v22, v24
	mov.16b	v24, v0
	fmla.4s	v24, v22, v23
	fcvtns.4s	v21, v21
	fcmgt.4s	v22, v20, v2
	shl.4s	v21, v21, #23
	add.4s	v21, v21, v0
	fmul.4s	v21, v24, v21
	fadd.4s	v21, v21, v0
	fdiv.4s	v21, v0, v21
	fcmgt.4s	v20, v18, v20
	fadd.4s	v21, v21, v21
	fadd.4s	v21, v21, v19
	bit.16b	v21, v19, v22
	bsl.16b	v20, v0, v21
	fmax.4s	v20, v20, v19
	fmin.4s	v20, v20, v0
	str	q20, [x10], #16
	add	x12, x9, #4
	add	x13, x9, #8
	mov	x9, x12
	cmp	x13, x8
	b.le	LBB6_4
LBB6_5:
	subs	x8, x8, x12
	b.ls	LBB6_8
; %bb.6:
	lsl	x10, x12, #2
	add	x9, x1, x10
	add	x10, x0, x10
	mov	w11, #29208                     ; =0x7218
	movk	w11, #17073, lsl #16
	dup.4s	v1, w11
	mov	w11, #43579                     ; =0xaa3b
	movk	w11, #16312, lsl #16
	dup.4s	v2, w11
	mov	w11, #32768                     ; =0x8000
	movk	w11, #48945, lsl #16
	dup.4s	v3, w11
	mov	w11, #32899                     ; =0x8083
	movk	w11, #14686, lsl #16
	dup.4s	v4, w11
	mov	w11, #2913                      ; =0xb61
	movk	w11, #15030, lsl #16
	dup.4s	v5, w11
	mov	w11, #34953                     ; =0x8889
	movk	w11, #15368, lsl #16
	dup.4s	v6, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15658, lsl #16
	dup.4s	v7, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15914, lsl #16
	dup.4s	v16, w11
	mov	w11, #44112                     ; =0xac50
	movk	w11, #49838, lsl #16
	dup.4s	v17, w11
	fmov	s18, #-2.00000000
	mvni.4s	v19, #127, msl #16
	fneg.4s	v19, v19
	fmov	s20, #1.00000000
	fmov	s21, #-1.00000000
	fmov	s22, #2.00000000
LBB6_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s23, [x10], #4
	fmul	s23, s23, s18
	dup.4s	v24, v23[0]
	fmul.4s	v23, v2, v23[0]
	frintn.4s	v23, v23
	fmul.4s	v25, v23, v3
	fadd.4s	v25, v24, v25
	fmul.4s	v26, v23, v4
	fadd.4s	v25, v25, v26
	mov.16b	v26, v6
	fmla.4s	v26, v5, v25
	mov.16b	v27, v7
	fmla.4s	v27, v25, v26
	mov.16b	v26, v16
	fmla.4s	v26, v25, v27
	movi.4s	v27, #63, lsl #24
	fmla.4s	v27, v25, v26
	mov.16b	v26, v0
	fmla.4s	v26, v25, v27
	mov.16b	v27, v0
	fcmgt.4s	v28, v24, v1
	fmla.4s	v27, v25, v26
	fcvtns.4s	v23, v23
	shl.4s	v23, v23, #23
	add.4s	v23, v23, v0
	fmul.4s	v23, v27, v23
	fcmgt.4s	v24, v17, v24
	bit.16b	v23, v19, v28
	bic.16b	v23, v23, v24
	fadd	s23, s23, s20
	fdiv	s23, s20, s23
	fmadd	s23, s23, s22, s21
	fcmp	s23, s21
	fcsel	s23, s21, s23, mi
	fcmp	s23, s20
	fcsel	s23, s20, s23, gt
	str	s23, [x9], #4
	subs	x8, x8, #1
	b.ne	LBB6_7
LBB6_8:
	ret
                                        ; -- End function
	.globl	_tanh_neon_f64                  ; -- Begin function tanh_neon_f64
	.p2align	2
_tanh_neon_f64:                         ; @tanh_neon_f64
; %bb.0:
	ldr	x14, [x2]
	cmp	x14, #1
	b.lt	LBB7_8
; %bb.1:
	mov	x8, #33534                      ; =0x82fe
	movk	x8, #25899, lsl #16
	movk	x8, #5447, lsl #32
	movk	x8, #16375, lsl #48
	mov	x9, #4276092928                 ; =0xfee00000
	movk	x9, #11842, lsl #32
	movk	x9, #49126, lsl #48
	mov	x10, #15478                     ; =0x3c76
	movk	x10, #13689, lsl #16
	movk	x10, #14831, lsl #32
	movk	x10, #48618, lsl #48
	mov	x11, #40986                     ; =0xa01a
	movk	x11, #6657, lsl #16
	movk	x11, #416, lsl #32
	movk	x11, #16122, lsl #48
	fmov.2d	v0, #0.50000000
	mov	x12, #40986                     ; =0xa01a
	movk	x12, #6657, lsl #16
	movk	x12, #416, lsl #32
	movk	x12, #16170, lsl #48
	fmov.2d	v1, #1.00000000
	mov	x13, #27671                     ; =0x6c17
	movk	x13, #5825, lsl #16
	movk	x13, #49516, lsl #32
	movk	x13, #16214, lsl #48
	b.ne	LBB7_3
; %bb.2:
	mov	x2, #0                          ; =0x0
	b	LBB7_5
LBB7_3:
	mov	x15, #0                         ; =0x0
	mov	x16, #43980465111040            ; =0x280000000000
	movk	x16, #49286, lsl #48
	dup.2d	v2, x16
	mov	x16, #43980465111040            ; =0x280000000000
	movk	x16, #16518, lsl #48
	dup.2d	v3, x16
	dup.2d	v4, x8
	dup.2d	v5, x9
	dup.2d	v6, x10
	dup.2d	v7, x11
	mov	x16, #1229782938247303441       ; =0x1111111111111111
	movk	x16, #16257, lsl #48
	dup.2d	v16, x16
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16293, lsl #48
	mov	x17, #6148914691236517205       ; =0x5555555555555555
	movk	x17, #16325, lsl #48
	dup.2d	v17, x12
	dup.2d	v18, x16
	dup.2d	v19, x17
	fmov.2d	v20, #-2.00000000
	fmov.2d	v21, #-1.00000000
	mov	x16, x1
	mov	x17, x0
	dup.2d	v22, x13
LBB7_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q23, [x17], #16
	fmul.2d	v23, v23, v20
	fmax.2d	v23, v23, v2
	fmin.2d	v23, v23, v3
	fmul.2d	v24, v23, v4
	frintn.2d	v24, v24
	fmul.2d	v25, v24, v5
	fadd.2d	v23, v23, v25
	fmul.2d	v25, v24, v6
	fadd.2d	v23, v23, v25
	mov.16b	v25, v17
	fmla.2d	v25, v7, v23
	mov.16b	v26, v22
	fmla.2d	v26, v23, v25
	mov.16b	v25, v16
	fmla.2d	v25, v23, v26
	mov.16b	v26, v18
	fmla.2d	v26, v23, v25
	mov.16b	v25, v19
	fmla.2d	v25, v23, v26
	mov.16b	v26, v0
	fmla.2d	v26, v23, v25
	mov.16b	v25, v1
	fmla.2d	v25, v23, v26
	mov.16b	v26, v1
	fmla.2d	v26, v23, v25
	fcvtzs.2d	v23, v24
	shl.2d	v23, v23, #52
	add.2d	v23, v23, v1
	fmul.2d	v23, v26, v23
	fadd.2d	v23, v23, v1
	fdiv.2d	v23, v1, v23
	fadd.2d	v23, v23, v23
	fadd.2d	v23, v23, v21
	fmax.2d	v23, v23, v21
	fmin.2d	v23, v23, v1
	str	q23, [x16], #16
	add	x2, x15, #2
	add	x3, x15, #4
	mov	x15, x2
	cmp	x3, x14
	b.le	LBB7_4
LBB7_5:
	subs	x14, x14, x2
	b.ls	LBB7_8
; %bb.6:
	lsl	x16, x2, #3
	add	x15, x1, x16
	add	x16, x0, x16
	fmov	d2, #-2.00000000
	mov	x17, #43980465111040            ; =0x280000000000
	movk	x17, #49286, lsl #48
	fmov	d3, x17
	mov	x17, #43980465111040            ; =0x280000000000
	movk	x17, #16518, lsl #48
	fmov	d4, x17
	dup.2d	v5, x8
	dup.2d	v6, x9
	dup.2d	v7, x10
	dup.2d	v16, x11
	dup.2d	v17, x12
	dup.2d	v18, x13
	mov	x8, #1229782938247303441        ; =0x1111111111111111
	movk	x8, #16257, lsl #48
	dup.2d	v19, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16293, lsl #48
	dup.2d	v20, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16325, lsl #48
	dup.2d	v21, x8
	fmov	d22, #1.00000000
	fmov	d23, #-1.00000000
	fmov	d24, #2.00000000
LBB7_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d25, [x16], #8
	fmul	d25, d25, d2
	fcmp	d25, d3
	fcsel	d25, d3, d25, mi
	fcmp	d25, d4
	fcsel	d25, d4, d25, gt
	dup.2d	v26, v25[0]
	fmul.2d	v25, v5, v25[0]
	frintn.2d	v25, v25
	fmul.2d	v27, v25, v6
	fadd.2d	v26, v26, v27
	fmul.2d	v27, v25, v7
	fadd.2d	v26, v26, v27
	mov.16b	v27, v17
	fmla.2d	v27, v16, v26
	mov.16b	v28, v18
	fmla.2d	v28, v26, v27
	mov.16b	v27, v19
	fmla.2d	v27, v26, v28
	mov.16b	v28, v20
	fmla.2d	v28, v26, v27
	mov.16b	v27, v21
	fmla.2d	v27, v26, v28
	mov.16b	v28, v0
	fmla.2d	v28, v26, v27
	mov.16b	v27, v1
	fmla.2d	v27, v26, v28
	mov.16b	v28, v1
	fmla.2d	v28, v26, v27
	fcvtzs.2d	v25, v25
	shl.2d	v25, v25, #52
	add.2d	v25, v25, v1
	fmul.2d	v25, v28, v25
	fadd	d25, d25, d22
	fdiv	d25, d22, d25
	fmadd	d25, d25, d24, d23
	fcmp	d25, d23
	fcsel	d25, d23, d25, mi
	fcmp	d25, d22
	fcsel	d25, d22, d25, gt
	str	d25, [x15], #8
	subs	x14, x14, #1
	b.ne	LBB7_7
LBB7_8:
	ret
                                        ; -- End function
	.globl	_elu_neon_f32                   ; -- Begin function elu_neon_f32
	.p2align	2
_elu_neon_f32:                          ; @elu_neon_f32
; %bb.0:
	ldr	x8, [x2]
	cmp	x8, #1
	b.lt	LBB8_10
; %bb.1:
	ldr	s0, [x3]
	fmov.4s	v1, #1.00000000
	cmp	x8, #4
	b.hs	LBB8_3
; %bb.2:
	mov	x12, #0                         ; =0x0
	b	LBB8_5
LBB8_3:
	mov	x9, #0                          ; =0x0
	mov	w10, #29208                     ; =0x7218
	movk	w10, #17073, lsl #16
	dup.4s	v2, w10
	mov	w10, #43579                     ; =0xaa3b
	movk	w10, #16312, lsl #16
	dup.4s	v3, w10
	mov	w10, #32768                     ; =0x8000
	movk	w10, #48945, lsl #16
	dup.4s	v4, w10
	mov	w10, #32899                     ; =0x8083
	movk	w10, #14686, lsl #16
	dup.4s	v5, w10
	mov	w10, #2913                      ; =0xb61
	movk	w10, #15030, lsl #16
	dup.4s	v6, w10
	mov	w10, #34953                     ; =0x8889
	movk	w10, #15368, lsl #16
	dup.4s	v7, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15658, lsl #16
	dup.4s	v16, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15914, lsl #16
	dup.4s	v17, w10
	mov	w10, #44112                     ; =0xac50
	movk	w10, #49838, lsl #16
	dup.4s	v18, w10
	fmov.4s	v19, #-1.00000000
	mvni.4s	v20, #127, msl #16
	fneg.4s	v20, v20
	mov	x10, x1
	mov	x11, x0
LBB8_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q21, [x11], #16
	fmul.4s	v22, v21, v3
	frintn.4s	v22, v22
	fmul.4s	v23, v22, v4
	fadd.4s	v23, v21, v23
	fmul.4s	v24, v22, v5
	fadd.4s	v23, v23, v24
	mov.16b	v24, v7
	fmla.4s	v24, v6, v23
	mov.16b	v25, v16
	fmla.4s	v25, v23, v24
	mov.16b	v24, v17
	fmla.4s	v24, v23, v25
	movi.4s	v25, #63, lsl #24
	fmla.4s	v25, v23, v24
	mov.16b	v24, v1
	fmla.4s	v24, v23, v25
	mov.16b	v25, v1
	fcmgt.4s	v26, v21, #0.0
	fmla.4s	v25, v23, v24
	fcvtns.4s	v22, v22
	shl.4s	v22, v22, #23
	add.4s	v22, v22, v1
	fmul.4s	v22, v25, v22
	fcmgt.4s	v23, v21, v2
	fcmgt.4s	v24, v18, v21
	fadd.4s	v22, v22, v19
	bit.16b	v22, v20, v23
	bit.16b	v22, v19, v24
	fmul.4s	v22, v22, v0[0]
	bif.16b	v21, v22, v26
	str	q21, [x10], #16
	add	x12, x9, #4
	add	x13, x9, #8
	mov	x9, x12
	cmp	x13, x8
	b.le	LBB8_4
LBB8_5:
	subs	x8, x8, x12
	b.ls	LBB8_10
; %bb.6:
	lsl	x10, x12, #2
	add	x9, x1, x10
	add	x10, x0, x10
	mov	w11, #29208                     ; =0x7218
	movk	w11, #17073, lsl #16
	dup.4s	v2, w11
	mov	w11, #43579                     ; =0xaa3b
	movk	w11, #16312, lsl #16
	dup.4s	v3, w11
	mov	w11, #32768                     ; =0x8000
	movk	w11, #48945, lsl #16
	dup.4s	v4, w11
	mov	w11, #32899                     ; =0x8083
	movk	w11, #14686, lsl #16
	dup.4s	v5, w11
	mov	w11, #2913                      ; =0xb61
	movk	w11, #15030, lsl #16
	dup.4s	v6, w11
	mov	w11, #34953                     ; =0x8889
	movk	w11, #15368, lsl #16
	dup.4s	v7, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15658, lsl #16
	dup.4s	v16, w11
	mov	w11, #43691                     ; =0xaaab
	movk	w11, #15914, lsl #16
	dup.4s	v17, w11
	mov	w11, #44112                     ; =0xac50
	movk	w11, #49838, lsl #16
	dup.4s	v18, w11
	mvni.4s	v19, #127, msl #16
	fneg.4s	v19, v19
	fmov	s20, #-1.00000000
	b	LBB8_8
LBB8_7:                                 ;   in Loop: Header=BB8_8 Depth=1
	str	s21, [x9], #4
	subs	x8, x8, #1
	b.eq	LBB8_10
LBB8_8:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s21, [x10], #4
	fcmp	s21, #0.0
	b.gt	LBB8_7
; %bb.9:                                ;   in Loop: Header=BB8_8 Depth=1
	dup.4s	v22, v21[0]
	fcmgt.4s	v23, v22, v2
	fmul.4s	v21, v3, v21[0]
	frintn.4s	v21, v21
	fmul.4s	v24, v21, v4
	fadd.4s	v24, v22, v24
	fmul.4s	v25, v21, v5
	fadd.4s	v24, v24, v25
	mov.16b	v25, v7
	fmla.4s	v25, v6, v24
	mov.16b	v26, v16
	fmla.4s	v26, v24, v25
	mov.16b	v25, v17
	fmla.4s	v25, v24, v26
	movi.4s	v26, #63, lsl #24
	fmla.4s	v26, v24, v25
	mov.16b	v25, v1
	fmla.4s	v25, v24, v26
	mov.16b	v26, v1
	fmla.4s	v26, v24, v25
	fcvtns.4s	v21, v21
	shl.4s	v21, v21, #23
	add.4s	v21, v21, v1
	fmul.4s	v21, v26, v21
	fcmgt.4s	v22, v18, v22
	bit.16b	v21, v19, v23
	bic.16b	v21, v21, v22
	fadd	s21, s21, s20
	fmul	s21, s0, s21
	b	LBB8_7
LBB8_10:
	ret
                                        ; -- End function
	.globl	_elu_neon_f64                   ; -- Begin function elu_neon_f64
	.p2align	2
_elu_neon_f64:                          ; @elu_neon_f64
; %bb.0:
	ldr	x14, [x2]
	cmp	x14, #1
	b.lt	LBB9_10
; %bb.1:
	ldr	d0, [x3]
	mov	x8, #33534                      ; =0x82fe
	movk	x8, #25899, lsl #16
	movk	x8, #5447, lsl #32
	movk	x8, #16375, lsl #48
	mov	x9, #4276092928                 ; =0xfee00000
	movk	x9, #11842, lsl #32
	movk	x9, #49126, lsl #48
	mov	x10, #15478                     ; =0x3c76
	movk	x10, #13689, lsl #16
	movk	x10, #14831, lsl #32
	movk	x10, #48618, lsl #48
	mov	x11, #40986                     ; =0xa01a
	movk	x11, #6657, lsl #16
	movk	x11, #416, lsl #32
	movk	x11, #16122, lsl #48
	mov	x12, #40986                     ; =0xa01a
	movk	x12, #6657, lsl #16
	movk	x12, #416, lsl #32
	movk	x12, #16170, lsl #48
	fmov.2d	v1, #0.50000000
	mov	x13, #27671                     ; =0x6c17
	movk	x13, #5825, lsl #16
	movk	x13, #49516, lsl #32
	movk	x13, #16214, lsl #48
	fmov.2d	v2, #1.00000000
	cmp	x14, #1
	b.ne	LBB9_3
; %bb.2:
	mov	x2, #0                          ; =0x0
	b	LBB9_5
LBB9_3:
	mov	x15, #0                         ; =0x0
	mov	x16, #43980465111040            ; =0x280000000000
	movk	x16, #49286, lsl #48
	dup.2d	v3, x16
	mov	x16, #43980465111040            ; =0x280000000000
	movk	x16, #16518, lsl #48
	dup.2d	v4, x16
	dup.2d	v5, x8
	dup.2d	v6, x9
	dup.2d	v7, x10
	dup.2d	v16, x11
	dup.2d	v17, x12
	mov	x16, #1229782938247303441       ; =0x1111111111111111
	movk	x16, #16257, lsl #48
	dup.2d	v18, x16
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16293, lsl #48
	dup.2d	v19, x16
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16325, lsl #48
	dup.2d	v20, x16
	fmov.2d	v21, #-1.00000000
	mov	x16, x1
	mov	x17, x0
	dup.2d	v22, x13
LBB9_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q23, [x17], #16
	fmax.2d	v24, v23, v3
	fmin.2d	v24, v24, v4
	fmul.2d	v25, v24, v5
	frintn.2d	v25, v25
	fmul.2d	v26, v25, v6
	fadd.2d	v24, v24, v26
	fmul.2d	v26, v25, v7
	fadd.2d	v24, v24, v26
	mov.16b	v26, v17
	fmla.2d	v26, v16, v24
	mov.16b	v27, v22
	fmla.2d	v27, v24, v26
	mov.16b	v26, v18
	fmla.2d	v26, v24, v27
	mov.16b	v27, v19
	fmla.2d	v27, v24, v26
	mov.16b	v26, v20
	fmla.2d	v26, v24, v27
	mov.16b	v27, v1
	fmla.2d	v27, v24, v26
	mov.16b	v26, v2
	fmla.2d	v26, v24, v27
	mov.16b	v27, v2
	fmla.2d	v27, v24, v26
	fcvtzs.2d	v24, v25
	fcmgt.2d	v25, v23, #0.0
	shl.2d	v24, v24, #52
	add.2d	v24, v24, v2
	fmul.2d	v24, v27, v24
	fadd.2d	v24, v24, v21
	fmul.2d	v24, v24, v0[0]
	bif.16b	v23, v24, v25
	str	q23, [x16], #16
	add	x2, x15, #2
	add	x3, x15, #4
	mov	x15, x2
	cmp	x3, x14
	b.le	LBB9_4
LBB9_5:
	subs	x14, x14, x2
	b.ls	LBB9_10
; %bb.6:
	lsl	x16, x2, #3
	add	x15, x1, x16
	add	x16, x0, x16
	mov	x17, #43980465111040            ; =0x280000000000
	movk	x17, #49286, lsl #48
	mov	x0, #43980465111040             ; =0x280000000000
	movk	x0, #16518, lsl #48
	dup.2d	v3, x8
	dup.2d	v4, x9
	dup.2d	v5, x10
	dup.2d	v6, x11
	dup.2d	v7, x12
	dup.2d	v16, x13
	mov	x8, #1229782938247303441        ; =0x1111111111111111
	movk	x8, #16257, lsl #48
	dup.2d	v17, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16293, lsl #48
	dup.2d	v18, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16325, lsl #48
	dup.2d	v19, x8
	fmov	d20, #-1.00000000
	b	LBB9_8
LBB9_7:                                 ;   in Loop: Header=BB9_8 Depth=1
	str	d21, [x15], #8
	subs	x14, x14, #1
	b.eq	LBB9_10
LBB9_8:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d21, [x16], #8
	fcmp	d21, #0.0
	b.gt	LBB9_7
; %bb.9:                                ;   in Loop: Header=BB9_8 Depth=1
	fmov	d22, x17
	fcmp	d21, d22
	fcsel	d21, d22, d21, mi
	fmov	d22, x0
	fcmp	d21, d22
	fcsel	d21, d22, d21, gt
	dup.2d	v22, v21[0]
	fmul.2d	v21, v3, v21[0]
	frintn.2d	v21, v21
	fmul.2d	v23, v21, v4
	fadd.2d	v22, v22, v23
	fmul.2d	v23, v21, v5
	fadd.2d	v22, v22, v23
	mov.16b	v23, v7
	fmla.2d	v23, v6, v22
	mov.16b	v24, v16
	fmla.2d	v24, v22, v23
	mov.16b	v23, v17
	fmla.2d	v23, v22, v24
	mov.16b	v24, v18
	fmla.2d	v24, v22, v23
	mov.16b	v23, v19
	fmla.2d	v23, v22, v24
	mov.16b	v24, v1
	fmla.2d	v24, v22, v23
	mov.16b	v23, v2
	fmla.2d	v23, v22, v24
	mov.16b	v24, v2
	fmla.2d	v24, v22, v23
	fcvtzs.2d	v21, v21
	shl.2d	v21, v21, #52
	add.2d	v21, v21, v2
	fmul.2d	v21, v24, v21
	fadd	d21, d21, d20
	fmul	d21, d0, d21
	b	LBB9_7
LBB9_10:
	ret
                                        ; -- End function
.subsections_via_symbols
