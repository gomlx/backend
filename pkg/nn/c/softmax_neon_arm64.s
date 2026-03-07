	.build_version macos, 15, 0	sdk_version 15, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_softmax_neon_f32               ; -- Begin function softmax_neon_f32
	.p2align	2
_softmax_neon_f32:                      ; @softmax_neon_f32
; %bb.0:
	ldr	x8, [x2]
	cmp	x8, #1
	b.lt	LBB0_33
; %bb.1:
	ld1r.4s	{ v0 }, [x0]
	cmp	x8, #4
	b.hs	LBB0_3
; %bb.2:
	mov	x10, #0                         ; =0x0
	fmaxv.4s	s0, v0
	subs	x9, x8, x10
	b.hi	LBB0_6
	b	LBB0_8
LBB0_3:
	mov	w9, #4                          ; =0x4
	mov	x10, x0
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x10], #16
	fmax.4s	v0, v0, v1
	add	x9, x9, #4
	cmp	x9, x8
	b.le	LBB0_4
; %bb.5:
	and	x10, x8, #0x7ffffffffffffffc
	fmaxv.4s	s0, v0
	subs	x9, x8, x10
	b.ls	LBB0_8
LBB0_6:
	add	x10, x0, x10, lsl #2
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x10], #4
	fcmp	s1, s0
	fcsel	s0, s1, s0, gt
	subs	x9, x9, #1
	b.ne	LBB0_7
LBB0_8:
	fmov.4s	v1, #1.00000000
	cmp	x8, #4
	b.hs	LBB0_10
; %bb.9:
	mov	x12, #0                         ; =0x0
	movi.2d	v7, #0000000000000000
	b	LBB0_12
LBB0_10:
	mov	x9, #0                          ; =0x0
	dup.4s	v2, v0[0]
	mov	w10, #44106                     ; =0xac4a
	movk	w10, #49838, lsl #16
	dup.4s	v3, w10
	mov	w10, #43579                     ; =0xaa3b
	movk	w10, #16312, lsl #16
	dup.4s	v4, w10
	mov	w10, #32768                     ; =0x8000
	movk	w10, #48945, lsl #16
	dup.4s	v5, w10
	mov	w10, #32899                     ; =0x8083
	movk	w10, #14686, lsl #16
	dup.4s	v6, w10
	mov	w10, #2913                      ; =0xb61
	movk	w10, #15030, lsl #16
	dup.4s	v16, w10
	mov	w10, #34953                     ; =0x8889
	movk	w10, #15368, lsl #16
	dup.4s	v17, w10
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15658, lsl #16
	dup.4s	v18, w10
	movi.2d	v7, #0000000000000000
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #15914, lsl #16
	dup.4s	v19, w10
	mov	x10, x1
	mov	x11, x0
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q20, [x11], #16
	fsub.4s	v20, v20, v2
	fmax.4s	v20, v20, v3
	fmul.4s	v21, v20, v4
	frintn.4s	v21, v21
	fmul.4s	v22, v21, v5
	fadd.4s	v20, v20, v22
	fmul.4s	v22, v21, v6
	fadd.4s	v20, v20, v22
	mov.16b	v22, v17
	fmla.4s	v22, v16, v20
	mov.16b	v23, v18
	fmla.4s	v23, v20, v22
	mov.16b	v22, v19
	fmla.4s	v22, v20, v23
	movi.4s	v23, #63, lsl #24
	fmla.4s	v23, v20, v22
	mov.16b	v22, v1
	fmla.4s	v22, v20, v23
	mov.16b	v23, v1
	fmla.4s	v23, v20, v22
	fcvtns.4s	v20, v21
	shl.4s	v20, v20, #23
	add.4s	v20, v20, v1
	fmul.4s	v20, v23, v20
	str	q20, [x10], #16
	fadd.4s	v7, v7, v20
	add	x12, x9, #4
	add	x13, x9, #8
	mov	x9, x12
	cmp	x13, x8
	b.le	LBB0_11
LBB0_12:
	faddp.4s	v2, v7, v7
	faddp.2s	s2, v2
	movi	d3, #0000000000000000
	fadd	s2, s2, s3
	subs	x9, x8, x12
	b.ls	LBB0_15
; %bb.13:
	lsl	x11, x12, #2
	add	x10, x1, x11
	add	x11, x0, x11
	mov	w12, #44106                     ; =0xac4a
	movk	w12, #49838, lsl #16
	fmov	s3, w12
	mov	w12, #43579                     ; =0xaa3b
	movk	w12, #16312, lsl #16
	dup.4s	v4, w12
	mov	w12, #32768                     ; =0x8000
	movk	w12, #48945, lsl #16
	dup.4s	v5, w12
	mov	w12, #32899                     ; =0x8083
	movk	w12, #14686, lsl #16
	dup.4s	v6, w12
	mov	w12, #2913                      ; =0xb61
	movk	w12, #15030, lsl #16
	dup.4s	v7, w12
	mov	w12, #34953                     ; =0x8889
	movk	w12, #15368, lsl #16
	dup.4s	v16, w12
	mov	w12, #43691                     ; =0xaaab
	movk	w12, #15658, lsl #16
	dup.4s	v17, w12
	mov	w12, #43691                     ; =0xaaab
	movk	w12, #15914, lsl #16
	dup.4s	v18, w12
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	s19, [x11], #4
	fsub	s19, s19, s0
	fcmp	s19, s3
	fcsel	s19, s3, s19, mi
	fmul.4s	v20, v4, v19[0]
	dup.4s	v19, v19[0]
	frintn.4s	v20, v20
	fmul.4s	v21, v20, v5
	fadd.4s	v19, v19, v21
	fmul.4s	v21, v20, v6
	fadd.4s	v19, v19, v21
	mov.16b	v21, v16
	fmla.4s	v21, v7, v19
	mov.16b	v22, v17
	fmla.4s	v22, v19, v21
	mov.16b	v21, v18
	fmla.4s	v21, v19, v22
	movi.4s	v22, #63, lsl #24
	fmla.4s	v22, v19, v21
	mov.16b	v21, v1
	fmla.4s	v21, v19, v22
	mov.16b	v22, v1
	fmla.4s	v22, v19, v21
	fcvtns.4s	v19, v20
	shl.4s	v19, v19, #23
	add.4s	v19, v19, v1
	fmul.4s	v19, v22, v19
	st1.s	{ v19 }[0], [x10], #4
	fadd	s2, s2, s19
	subs	x9, x9, #1
	b.ne	LBB0_14
LBB0_15:
	fmov	s0, #1.00000000
	fdiv	s0, s0, s2
	cmp	x8, #4
	b.hs	LBB0_17
; %bb.16:
	mov	x9, #0                          ; =0x0
	b	LBB0_19
LBB0_17:
	mov	x11, #0                         ; =0x0
	mov	x10, x1
LBB0_18:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x10]
	fmul.4s	v1, v1, v0[0]
	str	q1, [x10], #16
	add	x9, x11, #4
	add	x12, x11, #8
	mov	x11, x9
	cmp	x12, x8
	b.le	LBB0_18
LBB0_19:
	subs	x10, x8, x9
	b.ls	LBB0_33
; %bb.20:
	cmp	x10, #3
	b.hi	LBB0_22
; %bb.21:
	mov	x10, x9
	b	LBB0_31
LBB0_22:
	cmp	x10, #16
	b.hs	LBB0_24
; %bb.23:
	mov	x11, #0                         ; =0x0
	b	LBB0_28
LBB0_24:
	and	x11, x10, #0x7ffffffffffffff0
	add	x12, x1, x9, lsl #2
	add	x12, x12, #32
	mov	x13, x11
LBB0_25:                                ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x12, #-32]
	ldp	q3, q4, [x12]
	fmul.4s	v1, v1, v0[0]
	fmul.4s	v2, v2, v0[0]
	fmul.4s	v3, v3, v0[0]
	fmul.4s	v4, v4, v0[0]
	stp	q1, q2, [x12, #-32]
	stp	q3, q4, [x12], #64
	subs	x13, x13, #16
	b.ne	LBB0_25
; %bb.26:
	cmp	x10, x11
	b.eq	LBB0_33
; %bb.27:
	tst	x10, #0xc
	b.eq	LBB0_34
LBB0_28:
	and	x12, x8, #0x3
	sub	x10, x10, x12
	add	x10, x9, x10
	lsl	x13, x9, #2
	add	x13, x13, x11, lsl #2
	add	x13, x1, x13
	add	x9, x11, x9
	add	x9, x9, x12
	sub	x9, x9, x8
LBB0_29:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x13]
	fmul.4s	v1, v1, v0[0]
	str	q1, [x13], #16
	adds	x9, x9, #4
	b.ne	LBB0_29
; %bb.30:
	cbz	x12, LBB0_33
LBB0_31:
	sub	x8, x8, x10
	add	x9, x1, x10, lsl #2
LBB0_32:                                ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x9]
	fmul	s1, s0, s1
	str	s1, [x9], #4
	subs	x8, x8, #1
	b.ne	LBB0_32
LBB0_33:
	ret
LBB0_34:
	add	x10, x9, x11
	b	LBB0_31
                                        ; -- End function
	.globl	_softmax_neon_f64               ; -- Begin function softmax_neon_f64
	.p2align	2
_softmax_neon_f64:                      ; @softmax_neon_f64
; %bb.0:
	ldr	x8, [x2]
	cmp	x8, #1
	b.lt	LBB1_27
; %bb.1:
	ld1r.2d	{ v0 }, [x0]
	cmp	x8, #1
	b.ne	LBB1_3
; %bb.2:
	mov	x10, #0                         ; =0x0
	fmaxp.2d	d0, v0
	subs	x9, x8, x10
	b.hi	LBB1_6
	b	LBB1_8
LBB1_3:
	mov	w9, #2                          ; =0x2
	mov	x10, x0
LBB1_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x10], #16
	fmax.2d	v0, v0, v1
	add	x9, x9, #2
	cmp	x9, x8
	b.le	LBB1_4
; %bb.5:
	and	x10, x8, #0x7ffffffffffffffe
	fmaxp.2d	d0, v0
	subs	x9, x8, x10
	b.ls	LBB1_8
LBB1_6:
	add	x10, x0, x10, lsl #3
LBB1_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x10], #8
	fcmp	d1, d0
	fcsel	d0, d1, d0, gt
	subs	x9, x9, #1
	b.ne	LBB1_7
LBB1_8:
	mov	x9, #33534                      ; =0x82fe
	movk	x9, #25899, lsl #16
	movk	x9, #5447, lsl #32
	movk	x9, #16375, lsl #48
	mov	x10, #4276092928                ; =0xfee00000
	movk	x10, #11842, lsl #32
	movk	x10, #49126, lsl #48
	mov	x11, #15478                     ; =0x3c76
	movk	x11, #13689, lsl #16
	movk	x11, #14831, lsl #32
	movk	x11, #48618, lsl #48
	mov	x12, #40986                     ; =0xa01a
	movk	x12, #6657, lsl #16
	movk	x12, #416, lsl #32
	movk	x12, #16122, lsl #48
	mov	x13, #40986                     ; =0xa01a
	movk	x13, #6657, lsl #16
	movk	x13, #416, lsl #32
	movk	x13, #16170, lsl #48
	fmov.2d	v1, #0.50000000
	mov	x14, #27671                     ; =0x6c17
	movk	x14, #5825, lsl #16
	movk	x14, #49516, lsl #32
	movk	x14, #16214, lsl #48
	fmov.2d	v2, #1.00000000
	cmp	x8, #1
	b.ne	LBB1_10
; %bb.9:
	mov	x2, #0                          ; =0x0
	movi.2d	v4, #0000000000000000
	b	LBB1_12
LBB1_10:
	mov	x15, #0                         ; =0x0
	dup.2d	v3, v0[0]
	mov	x16, #18874                     ; =0x49ba
	movk	x16, #524, lsl #16
	movk	x16, #9003, lsl #32
	movk	x16, #49286, lsl #48
	dup.2d	v5, x16
	dup.2d	v6, x9
	dup.2d	v7, x10
	dup.2d	v16, x11
	movi.2d	v4, #0000000000000000
	dup.2d	v17, x12
	dup.2d	v18, x13
	mov	x16, #1229782938247303441       ; =0x1111111111111111
	movk	x16, #16257, lsl #48
	dup.2d	v19, x16
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16293, lsl #48
	dup.2d	v20, x16
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16325, lsl #48
	dup.2d	v21, x16
	mov	x16, x1
	mov	x17, x0
	dup.2d	v22, x14
LBB1_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q23, [x17], #16
	fsub.2d	v23, v23, v3
	fmax.2d	v23, v23, v5
	fmul.2d	v24, v23, v6
	frintn.2d	v24, v24
	fmul.2d	v25, v24, v7
	fadd.2d	v23, v23, v25
	fmul.2d	v25, v24, v16
	fadd.2d	v23, v23, v25
	mov.16b	v25, v18
	fmla.2d	v25, v17, v23
	mov.16b	v26, v22
	fmla.2d	v26, v23, v25
	mov.16b	v25, v19
	fmla.2d	v25, v23, v26
	mov.16b	v26, v20
	fmla.2d	v26, v23, v25
	mov.16b	v25, v21
	fmla.2d	v25, v23, v26
	mov.16b	v26, v1
	fmla.2d	v26, v23, v25
	mov.16b	v25, v2
	fmla.2d	v25, v23, v26
	mov.16b	v26, v2
	fmla.2d	v26, v23, v25
	fcvtzs.2d	v23, v24
	shl.2d	v23, v23, #52
	add.2d	v23, v23, v2
	fmul.2d	v23, v26, v23
	str	q23, [x16], #16
	fadd.2d	v4, v4, v23
	add	x2, x15, #2
	add	x3, x15, #4
	mov	x15, x2
	cmp	x3, x8
	b.le	LBB1_11
LBB1_12:
	faddp.2d	d3, v4
	subs	x15, x8, x2
	b.ls	LBB1_15
; %bb.13:
	lsl	x17, x2, #3
	add	x16, x1, x17
	add	x17, x0, x17
	mov	x0, #18874                      ; =0x49ba
	movk	x0, #524, lsl #16
	movk	x0, #9003, lsl #32
	movk	x0, #49286, lsl #48
	dup.2d	v4, x9
	dup.2d	v5, x10
	dup.2d	v6, x11
	dup.2d	v7, x12
	dup.2d	v16, x13
	fmov	d17, x0
	dup.2d	v18, x14
	mov	x9, #1229782938247303441        ; =0x1111111111111111
	movk	x9, #16257, lsl #48
	dup.2d	v19, x9
	mov	x9, #6148914691236517205        ; =0x5555555555555555
	movk	x9, #16293, lsl #48
	dup.2d	v20, x9
	mov	x9, #6148914691236517205        ; =0x5555555555555555
	movk	x9, #16325, lsl #48
	dup.2d	v21, x9
LBB1_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	d22, [x17], #8
	fsub	d22, d22, d0
	fcmp	d22, d17
	fcsel	d22, d17, d22, mi
	fmul.2d	v23, v4, v22[0]
	dup.2d	v22, v22[0]
	frintn.2d	v23, v23
	fmul.2d	v24, v23, v5
	fadd.2d	v22, v22, v24
	fmul.2d	v24, v23, v6
	fadd.2d	v22, v22, v24
	mov.16b	v24, v16
	fmla.2d	v24, v7, v22
	mov.16b	v25, v18
	fmla.2d	v25, v22, v24
	mov.16b	v24, v19
	fmla.2d	v24, v22, v25
	mov.16b	v25, v20
	fmla.2d	v25, v22, v24
	mov.16b	v24, v21
	fmla.2d	v24, v22, v25
	mov.16b	v25, v1
	fmla.2d	v25, v22, v24
	mov.16b	v24, v2
	fmla.2d	v24, v22, v25
	mov.16b	v25, v2
	fmla.2d	v25, v22, v24
	fcvtzs.2d	v22, v23
	shl.2d	v22, v22, #52
	add.2d	v22, v22, v2
	fmul.2d	v22, v25, v22
	st1.d	{ v22 }[0], [x16], #8
	fadd	d3, d3, d22
	subs	x15, x15, #1
	b.ne	LBB1_14
LBB1_15:
	fmov	d0, #1.00000000
	fdiv	d0, d0, d3
	cmp	x8, #1
	b.ne	LBB1_17
; %bb.16:
	mov	x12, #0                         ; =0x0
	b	LBB1_19
LBB1_17:
	mov	x10, #0                         ; =0x0
	mov	x9, x1
LBB1_18:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x9]
	fmul.2d	v1, v1, v0[0]
	str	q1, [x9], #16
	add	x12, x10, #2
	add	x11, x10, #4
	mov	x10, x12
	cmp	x11, x8
	b.le	LBB1_18
LBB1_19:
	subs	x10, x8, x12
	b.ls	LBB1_27
; %bb.20:
	cmp	x10, #8
	b.hs	LBB1_22
; %bb.21:
	mov	x9, x12
	b	LBB1_25
LBB1_22:
	and	x11, x10, #0x7ffffffffffffff8
	add	x9, x12, x11
	add	x12, x1, x12, lsl #3
	add	x12, x12, #32
	mov	x13, x11
LBB1_23:                                ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x12, #-32]
	ldp	q3, q4, [x12]
	fmul.2d	v1, v1, v0[0]
	fmul.2d	v2, v2, v0[0]
	fmul.2d	v3, v3, v0[0]
	fmul.2d	v4, v4, v0[0]
	stp	q1, q2, [x12, #-32]
	stp	q3, q4, [x12], #64
	subs	x13, x13, #8
	b.ne	LBB1_23
; %bb.24:
	cmp	x10, x11
	b.eq	LBB1_27
LBB1_25:
	sub	x8, x8, x9
	add	x9, x1, x9, lsl #3
LBB1_26:                                ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x9]
	fmul	d1, d0, d1
	str	d1, [x9], #8
	subs	x8, x8, #1
	b.ne	LBB1_26
LBB1_27:
	ret
                                        ; -- End function
.subsections_via_symbols
