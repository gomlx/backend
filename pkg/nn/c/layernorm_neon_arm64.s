	.build_version macos, 15, 0	sdk_version 15, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_layernorm_neon_f32             ; -- Begin function layernorm_neon_f32
	.p2align	2
_layernorm_neon_f32:                    ; @layernorm_neon_f32
; %bb.0:
	ldr	x9, [x4]
	ldr	x8, [x5]
	cmp	x9, #0
	ccmp	x8, #1, #8, ne
	b.lt	LBB0_62
; %bb.1:
	sdiv	x9, x9, x8
	cmp	x9, #1
	b.lt	LBB0_62
; %bb.2:
	stp	x22, x21, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	x10, #0                         ; =0x0
	ldr	s0, [x6]
	ucvtf	s1, x8
	and	x11, x8, #0x7ffffffffffffffc
	sub	x12, x1, x0
	sub	x13, x1, x2
	lsl	x14, x8, #2
	sub	x15, x1, x3
	and	x16, x8, #0x3
	sub	x17, x16, x8
	add	x4, x2, #48
	b	LBB0_4
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x10, x10, #1
	add	x0, x0, x14
	add	x1, x1, x14
	cmp	x10, x9
	b.eq	LBB0_61
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
                                        ;     Child Loop BB0_14 Depth 2
                                        ;     Child Loop BB0_18 Depth 2
                                        ;     Child Loop BB0_20 Depth 2
                                        ;     Child Loop BB0_24 Depth 2
                                        ;     Child Loop BB0_31 Depth 2
                                        ;     Child Loop BB0_35 Depth 2
                                        ;     Child Loop BB0_37 Depth 2
                                        ;     Child Loop BB0_41 Depth 2
                                        ;     Child Loop BB0_52 Depth 2
                                        ;     Child Loop BB0_56 Depth 2
                                        ;     Child Loop BB0_45 Depth 2
	cmp	x8, #4
	b.hs	LBB0_6
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x5, #0                          ; =0x0
	movi.2d	v2, #0000000000000000
	faddp.4s	v2, v2, v2
	faddp.2s	s2, v2
	subs	x6, x8, x5
	b.gt	LBB0_9
	b	LBB0_21
LBB0_6:                                 ;   in Loop: Header=BB0_4 Depth=1
	movi.2d	v2, #0000000000000000
	mov	x5, x0
	mov	w6, #4                          ; =0x4
LBB0_7:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q3, [x5], #16
	fadd.4s	v2, v2, v3
	add	x6, x6, #4
	cmp	x6, x8
	b.le	LBB0_7
; %bb.8:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x5, x11
	faddp.4s	v2, v2, v2
	faddp.2s	s2, v2
	subs	x6, x8, x11
	b.le	LBB0_21
LBB0_9:                                 ;   in Loop: Header=BB0_4 Depth=1
	cmp	x6, #4
	b.hs	LBB0_11
; %bb.10:                               ;   in Loop: Header=BB0_4 Depth=1
	mov	x6, x5
	b	LBB0_20
LBB0_11:                                ;   in Loop: Header=BB0_4 Depth=1
	cmp	x6, #16
	b.hs	LBB0_13
; %bb.12:                               ;   in Loop: Header=BB0_4 Depth=1
	mov	x7, #0                          ; =0x0
	b	LBB0_17
LBB0_13:                                ;   in Loop: Header=BB0_4 Depth=1
	and	x7, x6, #0xfffffffffffffff0
	add	x19, x0, x5, lsl #2
	mov	x20, x7
LBB0_14:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q3, q4, [x19]
	mov	s5, v3[3]
	mov	s6, v3[2]
	mov	s7, v3[1]
	mov	s16, v4[3]
	mov	s17, v4[2]
	mov	s18, v4[1]
	ldp	q19, q20, [x19, #32]
	mov	s21, v19[3]
	mov	s22, v19[2]
	mov	s23, v19[1]
	mov	s24, v20[3]
	mov	s25, v20[2]
	mov	s26, v20[1]
	fadd	s2, s2, s3
	fadd	s2, s2, s7
	fadd	s2, s2, s6
	fadd	s2, s2, s5
	fadd	s2, s2, s4
	fadd	s2, s2, s18
	fadd	s2, s2, s17
	fadd	s2, s2, s16
	fadd	s2, s2, s19
	fadd	s2, s2, s23
	fadd	s2, s2, s22
	fadd	s2, s2, s21
	fadd	s2, s2, s20
	fadd	s2, s2, s26
	fadd	s2, s2, s25
	fadd	s2, s2, s24
	add	x19, x19, #64
	subs	x20, x20, #16
	b.ne	LBB0_14
; %bb.15:                               ;   in Loop: Header=BB0_4 Depth=1
	cmp	x6, x7
	b.eq	LBB0_21
; %bb.16:                               ;   in Loop: Header=BB0_4 Depth=1
	tst	x6, #0xc
	b.eq	LBB0_58
LBB0_17:                                ;   in Loop: Header=BB0_4 Depth=1
	sub	x6, x6, x16
	add	x6, x5, x6
	lsl	x19, x7, #2
	add	x19, x19, x5, lsl #2
	add	x7, x17, x7
	add	x5, x7, x5
LBB0_18:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q3, [x0, x19]
	mov	s4, v3[3]
	mov	s5, v3[2]
	mov	s6, v3[1]
	fadd	s2, s2, s3
	fadd	s2, s2, s6
	fadd	s2, s2, s5
	fadd	s2, s2, s4
	add	x19, x19, #16
	adds	x5, x5, #4
	b.ne	LBB0_18
; %bb.19:                               ;   in Loop: Header=BB0_4 Depth=1
	cbz	x16, LBB0_21
LBB0_20:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s3, [x0, x6, lsl #2]
	fadd	s2, s2, s3
	add	x6, x6, #1
	cmp	x8, x6
	b.ne	LBB0_20
LBB0_21:                                ;   in Loop: Header=BB0_4 Depth=1
	fdiv	s2, s2, s1
	dup.4s	v3, v2[0]
	cmp	x8, #4
	b.hs	LBB0_23
; %bb.22:                               ;   in Loop: Header=BB0_4 Depth=1
	mov	x5, #0                          ; =0x0
	movi.2d	v4, #0000000000000000
	faddp.4s	v4, v4, v4
	faddp.2s	s4, v4
	subs	x6, x8, x5
	b.gt	LBB0_26
	b	LBB0_38
LBB0_23:                                ;   in Loop: Header=BB0_4 Depth=1
	movi.2d	v4, #0000000000000000
	mov	x5, x0
	mov	w6, #4                          ; =0x4
LBB0_24:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x5], #16
	fsub.4s	v5, v5, v3
	fmla.4s	v4, v5, v5
	add	x6, x6, #4
	cmp	x6, x8
	b.le	LBB0_24
; %bb.25:                               ;   in Loop: Header=BB0_4 Depth=1
	mov	x5, x11
	faddp.4s	v4, v4, v4
	faddp.2s	s4, v4
	subs	x6, x8, x11
	b.le	LBB0_38
LBB0_26:                                ;   in Loop: Header=BB0_4 Depth=1
	cmp	x6, #4
	b.hs	LBB0_28
; %bb.27:                               ;   in Loop: Header=BB0_4 Depth=1
	mov	x6, x5
	b	LBB0_37
LBB0_28:                                ;   in Loop: Header=BB0_4 Depth=1
	cmp	x6, #16
	b.hs	LBB0_30
; %bb.29:                               ;   in Loop: Header=BB0_4 Depth=1
	mov	x7, #0                          ; =0x0
	b	LBB0_34
LBB0_30:                                ;   in Loop: Header=BB0_4 Depth=1
	and	x7, x6, #0xfffffffffffffff0
	dup.4s	v5, v2[0]
	add	x19, x0, x5, lsl #2
	mov	x20, x7
LBB0_31:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q6, q7, [x19]
	ldp	q16, q17, [x19, #32]
	fsub.4s	v6, v6, v5
	fsub.4s	v7, v7, v5
	fsub.4s	v16, v16, v5
	fsub.4s	v17, v17, v5
	fmul.4s	v6, v6, v6
	mov	s18, v6[3]
	mov	s19, v6[2]
	mov	s20, v6[1]
	fmul.4s	v7, v7, v7
	mov	s21, v7[3]
	mov	s22, v7[2]
	mov	s23, v7[1]
	fmul.4s	v16, v16, v16
	mov	s24, v16[3]
	mov	s25, v16[2]
	mov	s26, v16[1]
	fmul.4s	v17, v17, v17
	mov	s27, v17[3]
	mov	s28, v17[2]
	mov	s29, v17[1]
	fadd	s4, s4, s6
	fadd	s4, s4, s20
	fadd	s4, s4, s19
	fadd	s4, s4, s18
	fadd	s4, s4, s7
	fadd	s4, s4, s23
	fadd	s4, s4, s22
	fadd	s4, s4, s21
	fadd	s4, s4, s16
	fadd	s4, s4, s26
	fadd	s4, s4, s25
	fadd	s4, s4, s24
	fadd	s4, s4, s17
	fadd	s4, s4, s29
	fadd	s4, s4, s28
	fadd	s4, s4, s27
	add	x19, x19, #64
	subs	x20, x20, #16
	b.ne	LBB0_31
; %bb.32:                               ;   in Loop: Header=BB0_4 Depth=1
	cmp	x6, x7
	b.eq	LBB0_38
; %bb.33:                               ;   in Loop: Header=BB0_4 Depth=1
	tst	x6, #0xc
	b.eq	LBB0_59
LBB0_34:                                ;   in Loop: Header=BB0_4 Depth=1
	sub	x6, x6, x16
	add	x6, x5, x6
	dup.4s	v5, v2[0]
	lsl	x19, x7, #2
	add	x19, x19, x5, lsl #2
	add	x7, x17, x7
	add	x5, x7, x5
LBB0_35:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q6, [x0, x19]
	fsub.4s	v6, v6, v5
	fmul.4s	v6, v6, v6
	mov	s7, v6[3]
	mov	s16, v6[2]
	mov	s17, v6[1]
	fadd	s4, s4, s6
	fadd	s4, s4, s17
	fadd	s4, s4, s16
	fadd	s4, s4, s7
	add	x19, x19, #16
	adds	x5, x5, #4
	b.ne	LBB0_35
; %bb.36:                               ;   in Loop: Header=BB0_4 Depth=1
	cbz	x16, LBB0_38
LBB0_37:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s5, [x0, x6, lsl #2]
	fsub	s5, s5, s2
	fmadd	s4, s5, s5, s4
	add	x6, x6, #1
	cmp	x8, x6
	b.ne	LBB0_37
LBB0_38:                                ;   in Loop: Header=BB0_4 Depth=1
	fdiv	s4, s4, s1
	fadd	s4, s0, s4
	dup.2s	v5, v4[0]
	frsqrte.2s	v5, v5
	fmul.2s	v6, v5, v4[0]
	frsqrts.2s	v6, v6, v5
	fmul.2s	v5, v5, v6
	fmul.2s	v4, v5, v4[0]
	frsqrts.2s	v4, v4, v5
	fmul.2s	v4, v5, v4
	cmp	x8, #4
	b.hs	LBB0_40
; %bb.39:                               ;   in Loop: Header=BB0_4 Depth=1
	mov	x5, #0                          ; =0x0
	b	LBB0_42
LBB0_40:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x6, #0                          ; =0x0
	mov	x7, #0                          ; =0x0
LBB0_41:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x0, x6]
	fsub.4s	v5, v5, v3
	ldr	q6, [x2, x6]
	fmul.4s	v5, v5, v4[0]
	ldr	q7, [x3, x6]
	fmla.4s	v7, v6, v5
	str	q7, [x1, x6]
	add	x5, x7, #4
	add	x19, x7, #8
	add	x6, x6, #16
	mov	x7, x5
	cmp	x19, x8
	b.le	LBB0_41
LBB0_42:                                ;   in Loop: Header=BB0_4 Depth=1
	subs	x6, x8, x5
	b.le	LBB0_3
; %bb.43:                               ;   in Loop: Header=BB0_4 Depth=1
	cmp	x6, #3
	b.hi	LBB0_46
LBB0_44:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x6, x5
LBB0_45:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s3, [x0, x6, lsl #2]
	fsub	s3, s3, s2
	ldr	s5, [x2, x6, lsl #2]
	ldr	s6, [x3, x6, lsl #2]
	fmul	s3, s4, s3
	fmadd	s3, s3, s5, s6
	str	s3, [x1, x6, lsl #2]
	add	x6, x6, #1
	cmp	x8, x6
	b.ne	LBB0_45
	b	LBB0_3
LBB0_46:                                ;   in Loop: Header=BB0_4 Depth=1
	cmp	x12, #64
	b.lo	LBB0_44
; %bb.47:                               ;   in Loop: Header=BB0_4 Depth=1
	mul	x7, x14, x10
	add	x19, x13, x7
	cmp	x19, #64
	b.lo	LBB0_44
; %bb.48:                               ;   in Loop: Header=BB0_4 Depth=1
	add	x7, x15, x7
	cmp	x7, #64
	b.lo	LBB0_44
; %bb.49:                               ;   in Loop: Header=BB0_4 Depth=1
	cmp	x6, #16
	b.hs	LBB0_51
; %bb.50:                               ;   in Loop: Header=BB0_4 Depth=1
	mov	x7, #0                          ; =0x0
	b	LBB0_55
LBB0_51:                                ;   in Loop: Header=BB0_4 Depth=1
	and	x7, x6, #0xfffffffffffffff0
	dup.4s	v3, v2[0]
	lsl	x19, x5, #2
	mov	x20, x7
LBB0_52:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x21, x0, x19
	ldp	q5, q6, [x21]
	ldp	q7, q16, [x21, #32]
	fsub.4s	v5, v5, v3
	fsub.4s	v6, v6, v3
	fsub.4s	v7, v7, v3
	fsub.4s	v16, v16, v3
	fmul.4s	v5, v5, v4[0]
	fmul.4s	v6, v6, v4[0]
	fmul.4s	v7, v7, v4[0]
	fmul.4s	v16, v16, v4[0]
	add	x21, x4, x19
	ldp	q17, q18, [x21, #-48]
	ldp	q19, q20, [x21, #-16]
	add	x21, x3, x19
	ldp	q21, q22, [x21]
	ldp	q23, q24, [x21, #32]
	fmla.4s	v21, v17, v5
	fmla.4s	v22, v18, v6
	fmla.4s	v23, v19, v7
	fmla.4s	v24, v20, v16
	add	x21, x1, x19
	stp	q21, q22, [x21]
	stp	q23, q24, [x21, #32]
	add	x19, x19, #64
	subs	x20, x20, #16
	b.ne	LBB0_52
; %bb.53:                               ;   in Loop: Header=BB0_4 Depth=1
	cmp	x6, x7
	b.eq	LBB0_3
; %bb.54:                               ;   in Loop: Header=BB0_4 Depth=1
	tst	x6, #0xc
	b.eq	LBB0_60
LBB0_55:                                ;   in Loop: Header=BB0_4 Depth=1
	sub	x6, x6, x16
	add	x6, x5, x6
	dup.4s	v3, v2[0]
	add	x20, x7, x5
	add	x19, x20, x17
	lsl	x21, x20, #2
	add	x20, x3, x21
	add	x21, x2, x21
	lsl	x7, x7, #2
	add	x5, x7, x5, lsl #2
LBB0_56:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x0, x5]
	fsub.4s	v5, v5, v3
	ldr	q6, [x21], #16
	ldr	q7, [x20], #16
	fmul.4s	v5, v5, v4[0]
	fmla.4s	v7, v6, v5
	str	q7, [x1, x5]
	add	x5, x5, #16
	adds	x19, x19, #4
	b.ne	LBB0_56
; %bb.57:                               ;   in Loop: Header=BB0_4 Depth=1
	cbnz	x16, LBB0_45
	b	LBB0_3
LBB0_58:                                ;   in Loop: Header=BB0_4 Depth=1
	add	x6, x5, x7
	b	LBB0_20
LBB0_59:                                ;   in Loop: Header=BB0_4 Depth=1
	add	x6, x5, x7
	b	LBB0_37
LBB0_60:                                ;   in Loop: Header=BB0_4 Depth=1
	add	x6, x5, x7
	b	LBB0_45
LBB0_61:
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #32             ; 16-byte Folded Reload
LBB0_62:
	ret
                                        ; -- End function
	.globl	_layernorm_neon_f32_no_affine   ; -- Begin function layernorm_neon_f32_no_affine
	.p2align	2
_layernorm_neon_f32_no_affine:          ; @layernorm_neon_f32_no_affine
; %bb.0:
	ldr	x9, [x2]
	ldr	x8, [x3]
	cmp	x9, #0
	ccmp	x8, #1, #8, ne
	b.lt	LBB1_59
; %bb.1:
	sdiv	x9, x9, x8
	cmp	x9, #1
	b.lt	LBB1_59
; %bb.2:
	mov	x10, #0                         ; =0x0
	ucvtf	s0, x8
	ldr	s1, [x4]
	and	x11, x8, #0x7ffffffffffffffc
	sub	x12, x1, x0
	and	x13, x8, #0x3
	lsl	x14, x8, #2
	sub	x15, x13, x8
	b	LBB1_4
LBB1_3:                                 ;   in Loop: Header=BB1_4 Depth=1
	add	x10, x10, #1
	add	x0, x0, x14
	add	x1, x1, x14
	cmp	x10, x9
	b.eq	LBB1_59
LBB1_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_7 Depth 2
                                        ;     Child Loop BB1_14 Depth 2
                                        ;     Child Loop BB1_18 Depth 2
                                        ;     Child Loop BB1_20 Depth 2
                                        ;     Child Loop BB1_24 Depth 2
                                        ;     Child Loop BB1_31 Depth 2
                                        ;     Child Loop BB1_35 Depth 2
                                        ;     Child Loop BB1_37 Depth 2
                                        ;     Child Loop BB1_41 Depth 2
                                        ;     Child Loop BB1_49 Depth 2
                                        ;     Child Loop BB1_53 Depth 2
                                        ;     Child Loop BB1_55 Depth 2
	cmp	x8, #4
	b.hs	LBB1_6
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x16, #0                         ; =0x0
	movi.2d	v2, #0000000000000000
	faddp.4s	v2, v2, v2
	faddp.2s	s2, v2
	subs	x17, x8, x16
	b.gt	LBB1_9
	b	LBB1_21
LBB1_6:                                 ;   in Loop: Header=BB1_4 Depth=1
	movi.2d	v2, #0000000000000000
	mov	x16, x0
	mov	w17, #4                         ; =0x4
LBB1_7:                                 ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q3, [x16], #16
	fadd.4s	v2, v2, v3
	add	x17, x17, #4
	cmp	x17, x8
	b.le	LBB1_7
; %bb.8:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x16, x11
	faddp.4s	v2, v2, v2
	faddp.2s	s2, v2
	subs	x17, x8, x11
	b.le	LBB1_21
LBB1_9:                                 ;   in Loop: Header=BB1_4 Depth=1
	cmp	x17, #4
	b.hs	LBB1_11
; %bb.10:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x17, x16
	b	LBB1_20
LBB1_11:                                ;   in Loop: Header=BB1_4 Depth=1
	cmp	x17, #16
	b.hs	LBB1_13
; %bb.12:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x2, #0                          ; =0x0
	b	LBB1_17
LBB1_13:                                ;   in Loop: Header=BB1_4 Depth=1
	and	x2, x17, #0xfffffffffffffff0
	add	x3, x0, x16, lsl #2
	mov	x4, x2
LBB1_14:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q3, q4, [x3]
	mov	s5, v3[3]
	mov	s6, v3[2]
	mov	s7, v3[1]
	mov	s16, v4[3]
	mov	s17, v4[2]
	mov	s18, v4[1]
	ldp	q19, q20, [x3, #32]
	mov	s21, v19[3]
	mov	s22, v19[2]
	mov	s23, v19[1]
	mov	s24, v20[3]
	mov	s25, v20[2]
	mov	s26, v20[1]
	fadd	s2, s2, s3
	fadd	s2, s2, s7
	fadd	s2, s2, s6
	fadd	s2, s2, s5
	fadd	s2, s2, s4
	fadd	s2, s2, s18
	fadd	s2, s2, s17
	fadd	s2, s2, s16
	fadd	s2, s2, s19
	fadd	s2, s2, s23
	fadd	s2, s2, s22
	fadd	s2, s2, s21
	fadd	s2, s2, s20
	fadd	s2, s2, s26
	fadd	s2, s2, s25
	fadd	s2, s2, s24
	add	x3, x3, #64
	subs	x4, x4, #16
	b.ne	LBB1_14
; %bb.15:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x17, x2
	b.eq	LBB1_21
; %bb.16:                               ;   in Loop: Header=BB1_4 Depth=1
	tst	x17, #0xc
	b.eq	LBB1_56
LBB1_17:                                ;   in Loop: Header=BB1_4 Depth=1
	sub	x17, x17, x13
	add	x17, x16, x17
	lsl	x3, x2, #2
	add	x3, x3, x16, lsl #2
	add	x2, x15, x2
	add	x16, x2, x16
LBB1_18:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q3, [x0, x3]
	mov	s4, v3[3]
	mov	s5, v3[2]
	mov	s6, v3[1]
	fadd	s2, s2, s3
	fadd	s2, s2, s6
	fadd	s2, s2, s5
	fadd	s2, s2, s4
	add	x3, x3, #16
	adds	x16, x16, #4
	b.ne	LBB1_18
; %bb.19:                               ;   in Loop: Header=BB1_4 Depth=1
	cbz	x13, LBB1_21
LBB1_20:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s3, [x0, x17, lsl #2]
	fadd	s2, s2, s3
	add	x17, x17, #1
	cmp	x8, x17
	b.ne	LBB1_20
LBB1_21:                                ;   in Loop: Header=BB1_4 Depth=1
	fdiv	s2, s2, s0
	dup.4s	v3, v2[0]
	cmp	x8, #4
	b.hs	LBB1_23
; %bb.22:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x16, #0                         ; =0x0
	movi.2d	v4, #0000000000000000
	faddp.4s	v4, v4, v4
	faddp.2s	s4, v4
	subs	x17, x8, x16
	b.gt	LBB1_26
	b	LBB1_38
LBB1_23:                                ;   in Loop: Header=BB1_4 Depth=1
	movi.2d	v4, #0000000000000000
	mov	x16, x0
	mov	w17, #4                         ; =0x4
LBB1_24:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x16], #16
	fsub.4s	v5, v5, v3
	fmla.4s	v4, v5, v5
	add	x17, x17, #4
	cmp	x17, x8
	b.le	LBB1_24
; %bb.25:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x16, x11
	faddp.4s	v4, v4, v4
	faddp.2s	s4, v4
	subs	x17, x8, x11
	b.le	LBB1_38
LBB1_26:                                ;   in Loop: Header=BB1_4 Depth=1
	cmp	x17, #4
	b.hs	LBB1_28
; %bb.27:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x17, x16
	b	LBB1_37
LBB1_28:                                ;   in Loop: Header=BB1_4 Depth=1
	cmp	x17, #16
	b.hs	LBB1_30
; %bb.29:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x2, #0                          ; =0x0
	b	LBB1_34
LBB1_30:                                ;   in Loop: Header=BB1_4 Depth=1
	and	x2, x17, #0xfffffffffffffff0
	dup.4s	v5, v2[0]
	add	x3, x0, x16, lsl #2
	mov	x4, x2
LBB1_31:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q6, q7, [x3]
	ldp	q16, q17, [x3, #32]
	fsub.4s	v6, v6, v5
	fsub.4s	v7, v7, v5
	fsub.4s	v16, v16, v5
	fsub.4s	v17, v17, v5
	fmul.4s	v6, v6, v6
	mov	s18, v6[3]
	mov	s19, v6[2]
	mov	s20, v6[1]
	fmul.4s	v7, v7, v7
	mov	s21, v7[3]
	mov	s22, v7[2]
	mov	s23, v7[1]
	fmul.4s	v16, v16, v16
	mov	s24, v16[3]
	mov	s25, v16[2]
	mov	s26, v16[1]
	fmul.4s	v17, v17, v17
	mov	s27, v17[3]
	mov	s28, v17[2]
	mov	s29, v17[1]
	fadd	s4, s4, s6
	fadd	s4, s4, s20
	fadd	s4, s4, s19
	fadd	s4, s4, s18
	fadd	s4, s4, s7
	fadd	s4, s4, s23
	fadd	s4, s4, s22
	fadd	s4, s4, s21
	fadd	s4, s4, s16
	fadd	s4, s4, s26
	fadd	s4, s4, s25
	fadd	s4, s4, s24
	fadd	s4, s4, s17
	fadd	s4, s4, s29
	fadd	s4, s4, s28
	fadd	s4, s4, s27
	add	x3, x3, #64
	subs	x4, x4, #16
	b.ne	LBB1_31
; %bb.32:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x17, x2
	b.eq	LBB1_38
; %bb.33:                               ;   in Loop: Header=BB1_4 Depth=1
	tst	x17, #0xc
	b.eq	LBB1_57
LBB1_34:                                ;   in Loop: Header=BB1_4 Depth=1
	sub	x17, x17, x13
	add	x17, x16, x17
	dup.4s	v5, v2[0]
	lsl	x3, x2, #2
	add	x3, x3, x16, lsl #2
	add	x2, x15, x2
	add	x16, x2, x16
LBB1_35:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q6, [x0, x3]
	fsub.4s	v6, v6, v5
	fmul.4s	v6, v6, v6
	mov	s7, v6[3]
	mov	s16, v6[2]
	mov	s17, v6[1]
	fadd	s4, s4, s6
	fadd	s4, s4, s17
	fadd	s4, s4, s16
	fadd	s4, s4, s7
	add	x3, x3, #16
	adds	x16, x16, #4
	b.ne	LBB1_35
; %bb.36:                               ;   in Loop: Header=BB1_4 Depth=1
	cbz	x13, LBB1_38
LBB1_37:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s5, [x0, x17, lsl #2]
	fsub	s5, s5, s2
	fmadd	s4, s5, s5, s4
	add	x17, x17, #1
	cmp	x8, x17
	b.ne	LBB1_37
LBB1_38:                                ;   in Loop: Header=BB1_4 Depth=1
	fdiv	s4, s4, s0
	fadd	s4, s1, s4
	dup.2s	v5, v4[0]
	frsqrte.2s	v5, v5
	fmul.2s	v6, v5, v4[0]
	frsqrts.2s	v6, v6, v5
	fmul.2s	v5, v5, v6
	fmul.2s	v4, v5, v4[0]
	frsqrts.2s	v4, v4, v5
	fmul.2s	v4, v5, v4
	cmp	x8, #4
	b.hs	LBB1_40
; %bb.39:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x16, #0                         ; =0x0
	b	LBB1_42
LBB1_40:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x17, #0                         ; =0x0
	mov	x2, #0                          ; =0x0
LBB1_41:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x0, x17]
	fsub.4s	v5, v5, v3
	fmul.4s	v5, v5, v4[0]
	str	q5, [x1, x17]
	add	x16, x2, #4
	add	x3, x2, #8
	add	x17, x17, #16
	mov	x2, x16
	cmp	x3, x8
	b.le	LBB1_41
LBB1_42:                                ;   in Loop: Header=BB1_4 Depth=1
	subs	x17, x8, x16
	b.le	LBB1_3
; %bb.43:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x17, #4
	b.lo	LBB1_47
; %bb.44:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x12, #63
	b.ls	LBB1_47
; %bb.45:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x17, #16
	b.hs	LBB1_48
; %bb.46:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x2, #0                          ; =0x0
	b	LBB1_52
LBB1_47:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x17, x16
	b	LBB1_55
LBB1_48:                                ;   in Loop: Header=BB1_4 Depth=1
	and	x2, x17, #0xfffffffffffffff0
	dup.4s	v3, v2[0]
	lsl	x3, x16, #2
	mov	x4, x2
LBB1_49:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x5, x0, x3
	ldp	q5, q6, [x5]
	ldp	q7, q16, [x5, #32]
	fsub.4s	v5, v5, v3
	fsub.4s	v6, v6, v3
	fsub.4s	v7, v7, v3
	fsub.4s	v16, v16, v3
	fmul.4s	v5, v5, v4[0]
	fmul.4s	v6, v6, v4[0]
	fmul.4s	v7, v7, v4[0]
	fmul.4s	v16, v16, v4[0]
	add	x5, x1, x3
	stp	q5, q6, [x5]
	stp	q7, q16, [x5, #32]
	add	x3, x3, #64
	subs	x4, x4, #16
	b.ne	LBB1_49
; %bb.50:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x17, x2
	b.eq	LBB1_3
; %bb.51:                               ;   in Loop: Header=BB1_4 Depth=1
	tst	x17, #0xc
	b.eq	LBB1_58
LBB1_52:                                ;   in Loop: Header=BB1_4 Depth=1
	sub	x17, x17, x13
	add	x17, x16, x17
	dup.4s	v3, v2[0]
	lsl	x3, x2, #2
	add	x3, x3, x16, lsl #2
	add	x2, x15, x2
	add	x16, x2, x16
LBB1_53:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x0, x3]
	fsub.4s	v5, v5, v3
	fmul.4s	v5, v5, v4[0]
	str	q5, [x1, x3]
	add	x3, x3, #16
	adds	x16, x16, #4
	b.ne	LBB1_53
; %bb.54:                               ;   in Loop: Header=BB1_4 Depth=1
	cbz	x13, LBB1_3
LBB1_55:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s3, [x0, x17, lsl #2]
	fsub	s3, s3, s2
	fmul	s3, s4, s3
	str	s3, [x1, x17, lsl #2]
	add	x17, x17, #1
	cmp	x8, x17
	b.ne	LBB1_55
	b	LBB1_3
LBB1_56:                                ;   in Loop: Header=BB1_4 Depth=1
	add	x17, x16, x2
	b	LBB1_20
LBB1_57:                                ;   in Loop: Header=BB1_4 Depth=1
	add	x17, x16, x2
	b	LBB1_37
LBB1_58:                                ;   in Loop: Header=BB1_4 Depth=1
	add	x17, x16, x2
	b	LBB1_55
LBB1_59:
	ret
                                        ; -- End function
	.globl	_layernorm_neon_f64             ; -- Begin function layernorm_neon_f64
	.p2align	2
_layernorm_neon_f64:                    ; @layernorm_neon_f64
; %bb.0:
	ldr	x9, [x4]
	ldr	x8, [x5]
	cmp	x9, #0
	ccmp	x8, #1, #8, ne
	b.lt	LBB2_39
; %bb.1:
	sdiv	x9, x9, x8
	cmp	x9, #1
	b.lt	LBB2_39
; %bb.2:
	stp	x20, x19, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x10, #0                         ; =0x0
	ldr	d0, [x6]
	and	x11, x8, #0x7ffffffffffffffe
	sub	x12, x1, x0
	ucvtf	d1, x8
	sub	x13, x1, x2
	lsl	x14, x8, #3
	sub	x15, x1, x3
	add	x16, x2, #48
	b	LBB2_4
LBB2_3:                                 ;   in Loop: Header=BB2_4 Depth=1
	add	x10, x10, #1
	add	x0, x0, x14
	add	x1, x1, x14
	cmp	x10, x9
	b.eq	LBB2_38
LBB2_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_7 Depth 2
                                        ;     Child Loop BB2_12 Depth 2
                                        ;     Child Loop BB2_14 Depth 2
                                        ;     Child Loop BB2_18 Depth 2
                                        ;     Child Loop BB2_20 Depth 2
                                        ;     Child Loop BB2_24 Depth 2
                                        ;     Child Loop BB2_33 Depth 2
                                        ;     Child Loop BB2_28 Depth 2
	cmp	x8, #2
	b.hs	LBB2_6
; %bb.5:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x6, #0                          ; =0x0
	movi.2d	v2, #0000000000000000
	faddp.2d	d2, v2
	subs	x4, x8, x6
	b.gt	LBB2_9
	b	LBB2_15
LBB2_6:                                 ;   in Loop: Header=BB2_4 Depth=1
	movi.2d	v2, #0000000000000000
	mov	x17, x0
	mov	w4, #2                          ; =0x2
LBB2_7:                                 ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q3, [x17], #16
	fadd.2d	v2, v2, v3
	add	x4, x4, #2
	cmp	x4, x8
	b.le	LBB2_7
; %bb.8:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x6, x11
	faddp.2d	d2, v2
	subs	x4, x8, x11
	b.le	LBB2_15
LBB2_9:                                 ;   in Loop: Header=BB2_4 Depth=1
	cmp	x4, #8
	b.hs	LBB2_11
; %bb.10:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x17, x6
	b	LBB2_14
LBB2_11:                                ;   in Loop: Header=BB2_4 Depth=1
	and	x5, x4, #0xfffffffffffffff8
	add	x17, x6, x5
	add	x6, x0, x6, lsl #3
	mov	x7, x5
LBB2_12:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q3, q4, [x6]
	mov	d5, v3[1]
	mov	d6, v4[1]
	ldp	q7, q16, [x6, #32]
	mov	d17, v7[1]
	mov	d18, v16[1]
	fadd	d2, d2, d3
	fadd	d2, d2, d5
	fadd	d2, d2, d4
	fadd	d2, d2, d6
	fadd	d2, d2, d7
	fadd	d2, d2, d17
	fadd	d2, d2, d16
	fadd	d2, d2, d18
	add	x6, x6, #64
	subs	x7, x7, #8
	b.ne	LBB2_12
; %bb.13:                               ;   in Loop: Header=BB2_4 Depth=1
	cmp	x4, x5
	b.eq	LBB2_15
LBB2_14:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d3, [x0, x17, lsl #3]
	fadd	d2, d2, d3
	add	x17, x17, #1
	cmp	x8, x17
	b.ne	LBB2_14
LBB2_15:                                ;   in Loop: Header=BB2_4 Depth=1
	fdiv	d2, d2, d1
	dup.2d	v4, v2[0]
	cmp	x8, #2
	b.hs	LBB2_17
; %bb.16:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x17, #0                         ; =0x0
	movi.2d	v3, #0000000000000000
	faddp.2d	d3, v3
	cmp	x17, x8
	b.lt	LBB2_20
	b	LBB2_21
LBB2_17:                                ;   in Loop: Header=BB2_4 Depth=1
	movi.2d	v3, #0000000000000000
	mov	x17, x0
	mov	w4, #2                          ; =0x2
LBB2_18:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x17], #16
	fsub.2d	v5, v5, v4
	fmla.2d	v3, v5, v5
	add	x4, x4, #2
	cmp	x4, x8
	b.le	LBB2_18
; %bb.19:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x17, x11
	faddp.2d	d3, v3
	cmp	x11, x8
	b.ge	LBB2_21
LBB2_20:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d5, [x0, x17, lsl #3]
	fsub	d5, d5, d2
	fmadd	d3, d5, d5, d3
	add	x17, x17, #1
	cmp	x8, x17
	b.ne	LBB2_20
LBB2_21:                                ;   in Loop: Header=BB2_4 Depth=1
	fdiv	d3, d3, d1
	fadd	d3, d0, d3
	frsqrte	d5, d3
	fmul	d6, d3, d5
	frsqrts	d6, d6, d5
	fmul	d5, d5, d6
	fmul	d6, d3, d5
	frsqrts	d6, d6, d5
	fmul	d5, d5, d6
	fmul	d3, d3, d5
	frsqrts	d3, d3, d5
	fmul	d3, d5, d3
	cmp	x8, #2
	b.hs	LBB2_23
; %bb.22:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x6, #0                          ; =0x0
	b	LBB2_25
LBB2_23:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x17, #0                         ; =0x0
	mov	x4, #0                          ; =0x0
LBB2_24:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x0, x17]
	fsub.2d	v5, v5, v4
	ldr	q6, [x2, x17]
	fmul.2d	v5, v5, v3[0]
	ldr	q7, [x3, x17]
	fmla.2d	v7, v6, v5
	str	q7, [x1, x17]
	add	x6, x4, #2
	add	x5, x4, #4
	add	x17, x17, #16
	mov	x4, x6
	cmp	x5, x8
	b.le	LBB2_24
LBB2_25:                                ;   in Loop: Header=BB2_4 Depth=1
	subs	x4, x8, x6
	b.le	LBB2_3
; %bb.26:                               ;   in Loop: Header=BB2_4 Depth=1
	cmp	x4, #8
	b.hs	LBB2_29
; %bb.27:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x17, x6
LBB2_28:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d4, [x0, x17, lsl #3]
	fsub	d4, d4, d2
	ldr	d5, [x2, x17, lsl #3]
	ldr	d6, [x3, x17, lsl #3]
	fmul	d4, d3, d4
	fmadd	d4, d4, d5, d6
	str	d4, [x1, x17, lsl #3]
	add	x17, x17, #1
	cmp	x8, x17
	b.ne	LBB2_28
	b	LBB2_3
LBB2_29:                                ;   in Loop: Header=BB2_4 Depth=1
	cmp	x12, #64
	b.lo	LBB2_36
; %bb.30:                               ;   in Loop: Header=BB2_4 Depth=1
	mul	x17, x14, x10
	add	x5, x13, x17
	cmp	x5, #64
	b.lo	LBB2_37
; %bb.31:                               ;   in Loop: Header=BB2_4 Depth=1
	add	x17, x15, x17
	cmp	x17, #64
	b.lo	LBB2_35
; %bb.32:                               ;   in Loop: Header=BB2_4 Depth=1
	and	x5, x4, #0xfffffffffffffff8
	add	x17, x6, x5
	dup.2d	v4, v2[0]
	lsl	x6, x6, #3
	mov	x7, x5
LBB2_33:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x19, x0, x6
	ldp	q5, q6, [x19]
	ldp	q7, q16, [x19, #32]
	fsub.2d	v5, v5, v4
	fsub.2d	v6, v6, v4
	fsub.2d	v7, v7, v4
	fsub.2d	v16, v16, v4
	fmul.2d	v5, v5, v3[0]
	fmul.2d	v6, v6, v3[0]
	fmul.2d	v7, v7, v3[0]
	fmul.2d	v16, v16, v3[0]
	add	x19, x16, x6
	ldp	q17, q18, [x19, #-48]
	ldp	q19, q20, [x19, #-16]
	add	x19, x3, x6
	ldp	q21, q22, [x19]
	ldp	q23, q24, [x19, #32]
	fmla.2d	v21, v17, v5
	fmla.2d	v22, v18, v6
	fmla.2d	v23, v19, v7
	fmla.2d	v24, v20, v16
	add	x19, x1, x6
	stp	q21, q22, [x19]
	stp	q23, q24, [x19, #32]
	add	x6, x6, #64
	subs	x7, x7, #8
	b.ne	LBB2_33
; %bb.34:                               ;   in Loop: Header=BB2_4 Depth=1
	cmp	x4, x5
	b.ne	LBB2_28
	b	LBB2_3
LBB2_35:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x17, x6
	b	LBB2_28
LBB2_36:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x17, x6
	b	LBB2_28
LBB2_37:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x17, x6
	b	LBB2_28
LBB2_38:
	ldp	x20, x19, [sp], #16             ; 16-byte Folded Reload
LBB2_39:
	ret
                                        ; -- End function
	.globl	_layernorm_neon_f64_no_affine   ; -- Begin function layernorm_neon_f64_no_affine
	.p2align	2
_layernorm_neon_f64_no_affine:          ; @layernorm_neon_f64_no_affine
; %bb.0:
	ldr	x9, [x2]
	ldr	x8, [x3]
	cmp	x9, #0
	ccmp	x8, #1, #8, ne
	b.lt	LBB3_34
; %bb.1:
	sdiv	x9, x9, x8
	cmp	x9, #1
	b.lt	LBB3_34
; %bb.2:
	mov	x10, #0                         ; =0x0
	ldr	d0, [x4]
	ucvtf	d1, x8
	and	x11, x8, #0x7ffffffffffffffe
	sub	x12, x1, x0
	lsl	x13, x8, #3
	b	LBB3_4
LBB3_3:                                 ;   in Loop: Header=BB3_4 Depth=1
	add	x10, x10, #1
	add	x0, x0, x13
	add	x1, x1, x13
	cmp	x10, x9
	b.eq	LBB3_34
LBB3_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_7 Depth 2
                                        ;     Child Loop BB3_12 Depth 2
                                        ;     Child Loop BB3_14 Depth 2
                                        ;     Child Loop BB3_18 Depth 2
                                        ;     Child Loop BB3_20 Depth 2
                                        ;     Child Loop BB3_24 Depth 2
                                        ;     Child Loop BB3_29 Depth 2
                                        ;     Child Loop BB3_33 Depth 2
	cmp	x8, #2
	b.hs	LBB3_6
; %bb.5:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x17, #0                         ; =0x0
	movi.2d	v2, #0000000000000000
	faddp.2d	d2, v2
	subs	x15, x8, x17
	b.gt	LBB3_9
	b	LBB3_15
LBB3_6:                                 ;   in Loop: Header=BB3_4 Depth=1
	movi.2d	v2, #0000000000000000
	mov	x14, x0
	mov	w15, #2                         ; =0x2
LBB3_7:                                 ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q3, [x14], #16
	fadd.2d	v2, v2, v3
	add	x15, x15, #2
	cmp	x15, x8
	b.le	LBB3_7
; %bb.8:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x17, x11
	faddp.2d	d2, v2
	subs	x15, x8, x11
	b.le	LBB3_15
LBB3_9:                                 ;   in Loop: Header=BB3_4 Depth=1
	cmp	x15, #8
	b.hs	LBB3_11
; %bb.10:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x14, x17
	b	LBB3_14
LBB3_11:                                ;   in Loop: Header=BB3_4 Depth=1
	and	x16, x15, #0xfffffffffffffff8
	add	x14, x17, x16
	add	x17, x0, x17, lsl #3
	mov	x2, x16
LBB3_12:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q3, q4, [x17]
	mov	d5, v3[1]
	mov	d6, v4[1]
	ldp	q7, q16, [x17, #32]
	mov	d17, v7[1]
	mov	d18, v16[1]
	fadd	d2, d2, d3
	fadd	d2, d2, d5
	fadd	d2, d2, d4
	fadd	d2, d2, d6
	fadd	d2, d2, d7
	fadd	d2, d2, d17
	fadd	d2, d2, d16
	fadd	d2, d2, d18
	add	x17, x17, #64
	subs	x2, x2, #8
	b.ne	LBB3_12
; %bb.13:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x15, x16
	b.eq	LBB3_15
LBB3_14:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d3, [x0, x14, lsl #3]
	fadd	d2, d2, d3
	add	x14, x14, #1
	cmp	x8, x14
	b.ne	LBB3_14
LBB3_15:                                ;   in Loop: Header=BB3_4 Depth=1
	fdiv	d2, d2, d1
	dup.2d	v4, v2[0]
	cmp	x8, #2
	b.hs	LBB3_17
; %bb.16:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x14, #0                         ; =0x0
	movi.2d	v3, #0000000000000000
	faddp.2d	d3, v3
	cmp	x14, x8
	b.lt	LBB3_20
	b	LBB3_21
LBB3_17:                                ;   in Loop: Header=BB3_4 Depth=1
	movi.2d	v3, #0000000000000000
	mov	x14, x0
	mov	w15, #2                         ; =0x2
LBB3_18:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x14], #16
	fsub.2d	v5, v5, v4
	fmla.2d	v3, v5, v5
	add	x15, x15, #2
	cmp	x15, x8
	b.le	LBB3_18
; %bb.19:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x14, x11
	faddp.2d	d3, v3
	cmp	x11, x8
	b.ge	LBB3_21
LBB3_20:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d5, [x0, x14, lsl #3]
	fsub	d5, d5, d2
	fmadd	d3, d5, d5, d3
	add	x14, x14, #1
	cmp	x8, x14
	b.ne	LBB3_20
LBB3_21:                                ;   in Loop: Header=BB3_4 Depth=1
	fdiv	d3, d3, d1
	fadd	d3, d0, d3
	frsqrte	d5, d3
	fmul	d6, d3, d5
	frsqrts	d6, d6, d5
	fmul	d5, d5, d6
	fmul	d6, d3, d5
	frsqrts	d6, d6, d5
	fmul	d5, d5, d6
	fmul	d3, d3, d5
	frsqrts	d3, d3, d5
	fmul	d3, d5, d3
	cmp	x8, #2
	b.hs	LBB3_23
; %bb.22:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x17, #0                         ; =0x0
	b	LBB3_25
LBB3_23:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x14, #0                         ; =0x0
	mov	x15, #0                         ; =0x0
LBB3_24:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q5, [x0, x14]
	fsub.2d	v5, v5, v4
	fmul.2d	v5, v5, v3[0]
	str	q5, [x1, x14]
	add	x17, x15, #2
	add	x16, x15, #4
	add	x14, x14, #16
	mov	x15, x17
	cmp	x16, x8
	b.le	LBB3_24
LBB3_25:                                ;   in Loop: Header=BB3_4 Depth=1
	subs	x15, x8, x17
	b.le	LBB3_3
; %bb.26:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x15, #8
	b.lo	LBB3_32
; %bb.27:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x12, #64
	b.lo	LBB3_31
; %bb.28:                               ;   in Loop: Header=BB3_4 Depth=1
	and	x16, x15, #0xfffffffffffffff8
	add	x14, x17, x16
	dup.2d	v4, v2[0]
	lsl	x17, x17, #3
	mov	x2, x16
LBB3_29:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x3, x0, x17
	ldp	q5, q6, [x3]
	ldp	q7, q16, [x3, #32]
	fsub.2d	v5, v5, v4
	fsub.2d	v6, v6, v4
	fsub.2d	v7, v7, v4
	fsub.2d	v16, v16, v4
	fmul.2d	v5, v5, v3[0]
	fmul.2d	v6, v6, v3[0]
	fmul.2d	v7, v7, v3[0]
	fmul.2d	v16, v16, v3[0]
	add	x3, x1, x17
	stp	q5, q6, [x3]
	stp	q7, q16, [x3, #32]
	add	x17, x17, #64
	subs	x2, x2, #8
	b.ne	LBB3_29
; %bb.30:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x15, x16
	b.ne	LBB3_33
	b	LBB3_3
LBB3_31:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x14, x17
	b	LBB3_33
LBB3_32:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x14, x17
LBB3_33:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d4, [x0, x14, lsl #3]
	fsub	d4, d4, d2
	fmul	d4, d3, d4
	str	d4, [x1, x14, lsl #3]
	add	x14, x14, #1
	cmp	x8, x14
	b.ne	LBB3_33
	b	LBB3_3
LBB3_34:
	ret
                                        ; -- End function
.subsections_via_symbols
