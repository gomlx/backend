	.build_version macos, 15, 0	sdk_version 15, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_qkvdense_neon_f32             ; -- Begin function qkvdense_neon_f32
	.p2align	2
_qkvdense_neon_f32:                    ; @qkvdense_neon_f32
; %bb.0:
	sub	sp, sp, #96
	stp	x25, x6, [sp, #16]              ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	ldr	x8, [x7, #8]
	cmp	x8, #1
	b.lt	LBB0_71
; %bb.1:
	mov	x9, #0                          ; =0x0
	ldr	x10, [x7]
	str	x10, [sp, #8]                   ; 8-byte Folded Spill
	ldp	x11, x12, [x7, #16]
	ldr	x13, [x7, #32]
	and	x14, x11, #0xfffffffffffffffc
	and	x15, x11, #0x3
	lsl	x16, x11, #2
	sub	x17, x15, x11
	mul	x10, x12, x11
	add	x10, x1, x10, lsl #2
	str	x10, [sp]                       ; 8-byte Folded Spill
	add	x10, x13, x12
	mul	x10, x11, x10
	add	x19, x1, x10, lsl #2
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #1
	add	x0, x0, x16
	cmp	x9, x8
	b.eq	LBB0_71
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_6 Depth 2
                                        ;       Child Loop BB0_9 Depth 3
                                        ;       Child Loop BB0_16 Depth 3
                                        ;       Child Loop BB0_20 Depth 3
                                        ;       Child Loop BB0_22 Depth 3
                                        ;     Child Loop BB0_29 Depth 2
                                        ;       Child Loop BB0_32 Depth 3
                                        ;       Child Loop BB0_39 Depth 3
                                        ;       Child Loop BB0_43 Depth 3
                                        ;       Child Loop BB0_45 Depth 3
                                        ;     Child Loop BB0_51 Depth 2
                                        ;       Child Loop BB0_54 Depth 3
                                        ;       Child Loop BB0_61 Depth 3
                                        ;       Child Loop BB0_65 Depth 3
                                        ;       Child Loop BB0_67 Depth 3
	cmp	x12, #1
	b.lt	LBB0_26
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x20, #0                         ; =0x0
	mul	x10, x9, x12
	add	x21, x5, x10, lsl #2
	mov	x22, x1
	b	LBB0_6
LBB0_5:                                 ;   in Loop: Header=BB0_6 Depth=2
	str	s0, [x21, x20, lsl #2]
	add	x20, x20, #1
	add	x22, x22, x16
	cmp	x20, x12
	b.eq	LBB0_26
LBB0_6:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_9 Depth 3
                                        ;       Child Loop BB0_16 Depth 3
                                        ;       Child Loop BB0_20 Depth 3
                                        ;       Child Loop BB0_22 Depth 3
	cmp	x11, #4
	b.ge	LBB0_8
; %bb.7:                                ;   in Loop: Header=BB0_6 Depth=2
	mov	x23, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	faddp.4s	v0, v0, v0
	faddp.2s	s0, v0
	subs	x24, x11, x23
	b.gt	LBB0_11
	b	LBB0_23
LBB0_8:                                 ;   in Loop: Header=BB0_6 Depth=2
	movi.2d	v0, #0000000000000000
	mov	x10, x22
	mov	x7, x0
	mov	w23, #4                         ; =0x4
LBB0_9:                                 ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x7], #16
	ldr	q2, [x10], #16
	fmla.4s	v0, v2, v1
	add	x23, x23, #4
	cmp	x23, x11
	b.le	LBB0_9
; %bb.10:                               ;   in Loop: Header=BB0_6 Depth=2
	mov	x23, x14
	faddp.4s	v0, v0, v0
	faddp.2s	s0, v0
	subs	x24, x11, x14
	b.le	LBB0_23
LBB0_11:                                ;   in Loop: Header=BB0_6 Depth=2
	cmp	x24, #4
	b.hs	LBB0_13
; %bb.12:                               ;   in Loop: Header=BB0_6 Depth=2
	mov	x24, x23
	b	LBB0_22
LBB0_13:                                ;   in Loop: Header=BB0_6 Depth=2
	cmp	x24, #16
	b.hs	LBB0_15
; %bb.14:                               ;   in Loop: Header=BB0_6 Depth=2
	mov	x25, #0                         ; =0x0
	b	LBB0_19
LBB0_15:                                ;   in Loop: Header=BB0_6 Depth=2
	and	x25, x24, #0xfffffffffffffff0
	lsl	x30, x23, #2
	mov	x10, x25
LBB0_16:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x7, x0, x30
	ldp	q1, q2, [x7]
	ldp	q3, q4, [x7, #32]
	add	x7, x22, x30
	ldp	q5, q6, [x7]
	ldp	q7, q16, [x7, #32]
	fmul.4s	v1, v1, v5
	mov	s5, v1[3]
	mov	s17, v1[2]
	mov	s18, v1[1]
	fmul.4s	v2, v2, v6
	mov	s6, v2[3]
	mov	s19, v2[2]
	mov	s20, v2[1]
	fmul.4s	v3, v3, v7
	mov	s7, v3[3]
	mov	s21, v3[2]
	mov	s22, v3[1]
	fmul.4s	v4, v4, v16
	mov	s16, v4[3]
	mov	s23, v4[2]
	mov	s24, v4[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s18
	fadd	s0, s0, s17
	fadd	s0, s0, s5
	fadd	s0, s0, s2
	fadd	s0, s0, s20
	fadd	s0, s0, s19
	fadd	s0, s0, s6
	fadd	s0, s0, s3
	fadd	s0, s0, s22
	fadd	s0, s0, s21
	fadd	s0, s0, s7
	fadd	s0, s0, s4
	fadd	s0, s0, s24
	fadd	s0, s0, s23
	fadd	s0, s0, s16
	add	x30, x30, #64
	subs	x10, x10, #16
	b.ne	LBB0_16
; %bb.17:                               ;   in Loop: Header=BB0_6 Depth=2
	cmp	x24, x25
	b.eq	LBB0_23
; %bb.18:                               ;   in Loop: Header=BB0_6 Depth=2
	tst	x24, #0xc
	b.eq	LBB0_25
LBB0_19:                                ;   in Loop: Header=BB0_6 Depth=2
	sub	x10, x24, x15
	add	x24, x23, x10
	add	x7, x25, x23
	add	x10, x7, x17
	lsl	x7, x7, #2
LBB0_20:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x0, x7]
	ldr	q2, [x22, x7]
	fmul.4s	v1, v1, v2
	mov	s2, v1[3]
	mov	s3, v1[2]
	mov	s4, v1[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	add	x7, x7, #16
	adds	x10, x10, #4
	b.ne	LBB0_20
; %bb.21:                               ;   in Loop: Header=BB0_6 Depth=2
	cbz	x15, LBB0_23
LBB0_22:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s1, [x0, x24, lsl #2]
	ldr	s2, [x22, x24, lsl #2]
	fmadd	s0, s1, s2, s0
	add	x24, x24, #1
	cmp	x11, x24
	b.ne	LBB0_22
LBB0_23:                                ;   in Loop: Header=BB0_6 Depth=2
	cbz	x2, LBB0_5
; %bb.24:                               ;   in Loop: Header=BB0_6 Depth=2
	ldr	s1, [x2, x20, lsl #2]
	fadd	s0, s0, s1
	b	LBB0_5
LBB0_25:                                ;   in Loop: Header=BB0_6 Depth=2
	add	x24, x23, x25
	b	LBB0_22
LBB0_26:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	x13, #1
	b.lt	LBB0_2
; %bb.27:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x21, #0                         ; =0x0
	mul	x20, x9, x13
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	add	x22, x10, x20, lsl #2
	ldr	x23, [sp]                       ; 8-byte Folded Reload
	b	LBB0_29
LBB0_28:                                ;   in Loop: Header=BB0_29 Depth=2
	str	s0, [x22, x21, lsl #2]
	add	x21, x21, #1
	add	x23, x23, x16
	cmp	x21, x13
	b.eq	LBB0_49
LBB0_29:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_32 Depth 3
                                        ;       Child Loop BB0_39 Depth 3
                                        ;       Child Loop BB0_43 Depth 3
                                        ;       Child Loop BB0_45 Depth 3
	cmp	x11, #4
	b.ge	LBB0_31
; %bb.30:                               ;   in Loop: Header=BB0_29 Depth=2
	mov	x24, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	faddp.4s	v0, v0, v0
	faddp.2s	s0, v0
	subs	x25, x11, x24
	b.gt	LBB0_34
	b	LBB0_46
LBB0_31:                                ;   in Loop: Header=BB0_29 Depth=2
	mov	x10, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	mov	w7, #4                          ; =0x4
LBB0_32:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_29 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x0, x10]
	ldr	q2, [x23, x10]
	fmla.4s	v0, v2, v1
	add	x7, x7, #4
	add	x10, x10, #16
	cmp	x7, x11
	b.le	LBB0_32
; %bb.33:                               ;   in Loop: Header=BB0_29 Depth=2
	mov	x24, x14
	faddp.4s	v0, v0, v0
	faddp.2s	s0, v0
	subs	x25, x11, x14
	b.le	LBB0_46
LBB0_34:                                ;   in Loop: Header=BB0_29 Depth=2
	cmp	x25, #4
	b.hs	LBB0_36
; %bb.35:                               ;   in Loop: Header=BB0_29 Depth=2
	mov	x25, x24
	b	LBB0_45
LBB0_36:                                ;   in Loop: Header=BB0_29 Depth=2
	cmp	x25, #16
	b.hs	LBB0_38
; %bb.37:                               ;   in Loop: Header=BB0_29 Depth=2
	mov	x7, #0                          ; =0x0
	b	LBB0_42
LBB0_38:                                ;   in Loop: Header=BB0_29 Depth=2
	and	x7, x25, #0xfffffffffffffff0
	lsl	x10, x24, #2
	mov	x30, x7
LBB0_39:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_29 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x6, x0, x10
	ldp	q1, q2, [x6]
	ldp	q3, q4, [x6, #32]
	add	x6, x23, x10
	ldp	q5, q6, [x6]
	ldp	q7, q16, [x6, #32]
	fmul.4s	v1, v1, v5
	mov	s5, v1[3]
	mov	s17, v1[2]
	mov	s18, v1[1]
	fmul.4s	v2, v2, v6
	mov	s6, v2[3]
	mov	s19, v2[2]
	mov	s20, v2[1]
	fmul.4s	v3, v3, v7
	mov	s7, v3[3]
	mov	s21, v3[2]
	mov	s22, v3[1]
	fmul.4s	v4, v4, v16
	mov	s16, v4[3]
	mov	s23, v4[2]
	mov	s24, v4[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s18
	fadd	s0, s0, s17
	fadd	s0, s0, s5
	fadd	s0, s0, s2
	fadd	s0, s0, s20
	fadd	s0, s0, s19
	fadd	s0, s0, s6
	fadd	s0, s0, s3
	fadd	s0, s0, s22
	fadd	s0, s0, s21
	fadd	s0, s0, s7
	fadd	s0, s0, s4
	fadd	s0, s0, s24
	fadd	s0, s0, s23
	fadd	s0, s0, s16
	add	x10, x10, #64
	subs	x30, x30, #16
	b.ne	LBB0_39
; %bb.40:                               ;   in Loop: Header=BB0_29 Depth=2
	cmp	x25, x7
	b.eq	LBB0_46
; %bb.41:                               ;   in Loop: Header=BB0_29 Depth=2
	tst	x25, #0xc
	b.eq	LBB0_48
LBB0_42:                                ;   in Loop: Header=BB0_29 Depth=2
	sub	x10, x25, x15
	add	x25, x24, x10
	add	x6, x7, x24
	add	x10, x6, x17
	lsl	x7, x6, #2
LBB0_43:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_29 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x0, x7]
	ldr	q2, [x23, x7]
	fmul.4s	v1, v1, v2
	mov	s2, v1[3]
	mov	s3, v1[2]
	mov	s4, v1[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	add	x7, x7, #16
	adds	x10, x10, #4
	b.ne	LBB0_43
; %bb.44:                               ;   in Loop: Header=BB0_29 Depth=2
	cbz	x15, LBB0_46
LBB0_45:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_29 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s1, [x0, x25, lsl #2]
	ldr	s2, [x23, x25, lsl #2]
	fmadd	s0, s1, s2, s0
	add	x25, x25, #1
	cmp	x11, x25
	b.ne	LBB0_45
LBB0_46:                                ;   in Loop: Header=BB0_29 Depth=2
	cbz	x3, LBB0_28
; %bb.47:                               ;   in Loop: Header=BB0_29 Depth=2
	ldr	s1, [x3, x21, lsl #2]
	fadd	s0, s0, s1
	b	LBB0_28
LBB0_48:                                ;   in Loop: Header=BB0_29 Depth=2
	add	x25, x24, x7
	b	LBB0_45
LBB0_49:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x21, #0                         ; =0x0
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	add	x20, x10, x20, lsl #2
	mov	x22, x19
	b	LBB0_51
LBB0_50:                                ;   in Loop: Header=BB0_51 Depth=2
	str	s0, [x20, x21, lsl #2]
	add	x21, x21, #1
	add	x22, x22, x16
	cmp	x21, x13
	b.eq	LBB0_2
LBB0_51:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_54 Depth 3
                                        ;       Child Loop BB0_61 Depth 3
                                        ;       Child Loop BB0_65 Depth 3
                                        ;       Child Loop BB0_67 Depth 3
	cmp	x11, #4
	b.ge	LBB0_53
; %bb.52:                               ;   in Loop: Header=BB0_51 Depth=2
	mov	x23, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	faddp.4s	v0, v0, v0
	faddp.2s	s0, v0
	subs	x24, x11, x23
	b.gt	LBB0_56
	b	LBB0_68
LBB0_53:                                ;   in Loop: Header=BB0_51 Depth=2
	mov	x10, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	mov	w7, #4                          ; =0x4
LBB0_54:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_51 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x0, x10]
	ldr	q2, [x22, x10]
	fmla.4s	v0, v2, v1
	add	x7, x7, #4
	add	x10, x10, #16
	cmp	x7, x11
	b.le	LBB0_54
; %bb.55:                               ;   in Loop: Header=BB0_51 Depth=2
	mov	x23, x14
	faddp.4s	v0, v0, v0
	faddp.2s	s0, v0
	subs	x24, x11, x14
	b.le	LBB0_68
LBB0_56:                                ;   in Loop: Header=BB0_51 Depth=2
	cmp	x24, #4
	b.hs	LBB0_58
; %bb.57:                               ;   in Loop: Header=BB0_51 Depth=2
	mov	x24, x23
	b	LBB0_67
LBB0_58:                                ;   in Loop: Header=BB0_51 Depth=2
	cmp	x24, #16
	b.hs	LBB0_60
; %bb.59:                               ;   in Loop: Header=BB0_51 Depth=2
	mov	x25, #0                         ; =0x0
	b	LBB0_64
LBB0_60:                                ;   in Loop: Header=BB0_51 Depth=2
	and	x25, x24, #0xfffffffffffffff0
	lsl	x10, x23, #2
	mov	x7, x25
LBB0_61:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_51 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x6, x0, x10
	ldp	q1, q2, [x6]
	ldp	q3, q4, [x6, #32]
	add	x6, x22, x10
	ldp	q5, q6, [x6]
	ldp	q7, q16, [x6, #32]
	fmul.4s	v1, v1, v5
	mov	s5, v1[3]
	mov	s17, v1[2]
	mov	s18, v1[1]
	fmul.4s	v2, v2, v6
	mov	s6, v2[3]
	mov	s19, v2[2]
	mov	s20, v2[1]
	fmul.4s	v3, v3, v7
	mov	s7, v3[3]
	mov	s21, v3[2]
	mov	s22, v3[1]
	fmul.4s	v4, v4, v16
	mov	s16, v4[3]
	mov	s23, v4[2]
	mov	s24, v4[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s18
	fadd	s0, s0, s17
	fadd	s0, s0, s5
	fadd	s0, s0, s2
	fadd	s0, s0, s20
	fadd	s0, s0, s19
	fadd	s0, s0, s6
	fadd	s0, s0, s3
	fadd	s0, s0, s22
	fadd	s0, s0, s21
	fadd	s0, s0, s7
	fadd	s0, s0, s4
	fadd	s0, s0, s24
	fadd	s0, s0, s23
	fadd	s0, s0, s16
	add	x10, x10, #64
	subs	x7, x7, #16
	b.ne	LBB0_61
; %bb.62:                               ;   in Loop: Header=BB0_51 Depth=2
	cmp	x24, x25
	b.eq	LBB0_68
; %bb.63:                               ;   in Loop: Header=BB0_51 Depth=2
	tst	x24, #0xc
	b.eq	LBB0_70
LBB0_64:                                ;   in Loop: Header=BB0_51 Depth=2
	sub	x10, x24, x15
	add	x24, x23, x10
	add	x6, x25, x23
	add	x10, x6, x17
	lsl	x7, x6, #2
LBB0_65:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_51 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x0, x7]
	ldr	q2, [x22, x7]
	fmul.4s	v1, v1, v2
	mov	s2, v1[3]
	mov	s3, v1[2]
	mov	s4, v1[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	add	x7, x7, #16
	adds	x10, x10, #4
	b.ne	LBB0_65
; %bb.66:                               ;   in Loop: Header=BB0_51 Depth=2
	cbz	x15, LBB0_68
LBB0_67:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_51 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s1, [x0, x24, lsl #2]
	ldr	s2, [x22, x24, lsl #2]
	fmadd	s0, s1, s2, s0
	add	x24, x24, #1
	cmp	x11, x24
	b.ne	LBB0_67
LBB0_68:                                ;   in Loop: Header=BB0_51 Depth=2
	cbz	x4, LBB0_50
; %bb.69:                               ;   in Loop: Header=BB0_51 Depth=2
	ldr	s1, [x4, x21, lsl #2]
	fadd	s0, s0, s1
	b	LBB0_50
LBB0_70:                                ;   in Loop: Header=BB0_51 Depth=2
	add	x24, x23, x25
	b	LBB0_67
LBB0_71:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldr	x25, [sp, #16]                  ; 8-byte Folded Reload
	add	sp, sp, #96
	ret
                                        ; -- End function
	.globl	_qkvdense_neon_f64             ; -- Begin function qkvdense_neon_f64
	.p2align	2
_qkvdense_neon_f64:                    ; @qkvdense_neon_f64
; %bb.0:
	ldr	x8, [x7, #8]
	cmp	x8, #1
	b.lt	LBB1_51
; %bb.1:
	str	x25, [sp, #-80]!                ; 8-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	mov	x9, #0                          ; =0x0
	ldr	x10, [x7]
	str	x10, [sp, #8]                   ; 8-byte Folded Spill
	ldp	x11, x12, [x7, #16]
	ldr	x13, [x7, #32]
	and	x14, x11, #0xfffffffffffffffe
	lsl	x15, x11, #3
	mul	x16, x12, x11
	add	x16, x1, x16, lsl #3
	add	x17, x13, x12
	mul	x17, x11, x17
	add	x17, x1, x17, lsl #3
	b	LBB1_3
LBB1_2:                                 ;   in Loop: Header=BB1_3 Depth=1
	add	x9, x9, #1
	add	x0, x0, x15
	cmp	x9, x8
	b.eq	LBB1_50
LBB1_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_6 Depth 2
                                        ;       Child Loop BB1_9 Depth 3
                                        ;       Child Loop BB1_14 Depth 3
                                        ;       Child Loop BB1_16 Depth 3
                                        ;     Child Loop BB1_22 Depth 2
                                        ;       Child Loop BB1_25 Depth 3
                                        ;       Child Loop BB1_30 Depth 3
                                        ;       Child Loop BB1_32 Depth 3
                                        ;     Child Loop BB1_37 Depth 2
                                        ;       Child Loop BB1_40 Depth 3
                                        ;       Child Loop BB1_45 Depth 3
                                        ;       Child Loop BB1_47 Depth 3
	cmp	x12, #1
	b.lt	LBB1_19
; %bb.4:                                ;   in Loop: Header=BB1_3 Depth=1
	mov	x7, #0                          ; =0x0
	mul	x19, x9, x12
	add	x19, x5, x19, lsl #3
	mov	x20, x1
	b	LBB1_6
LBB1_5:                                 ;   in Loop: Header=BB1_6 Depth=2
	str	d0, [x19, x7, lsl #3]
	add	x7, x7, #1
	add	x20, x20, x15
	cmp	x7, x12
	b.eq	LBB1_19
LBB1_6:                                 ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_9 Depth 3
                                        ;       Child Loop BB1_14 Depth 3
                                        ;       Child Loop BB1_16 Depth 3
	cmp	x11, #2
	b.ge	LBB1_8
; %bb.7:                                ;   in Loop: Header=BB1_6 Depth=2
	mov	x24, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	faddp.2d	d0, v0
	subs	x22, x11, x24
	b.gt	LBB1_11
	b	LBB1_17
LBB1_8:                                 ;   in Loop: Header=BB1_6 Depth=2
	movi.2d	v0, #0000000000000000
	mov	x21, x20
	mov	x22, x0
	mov	w23, #2                         ; =0x2
LBB1_9:                                 ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x22], #16
	ldr	q2, [x21], #16
	fmla.2d	v0, v2, v1
	add	x23, x23, #2
	cmp	x23, x11
	b.le	LBB1_9
; %bb.10:                               ;   in Loop: Header=BB1_6 Depth=2
	mov	x24, x14
	faddp.2d	d0, v0
	subs	x22, x11, x14
	b.le	LBB1_17
LBB1_11:                                ;   in Loop: Header=BB1_6 Depth=2
	cmp	x22, #8
	b.hs	LBB1_13
; %bb.12:                               ;   in Loop: Header=BB1_6 Depth=2
	mov	x21, x24
	b	LBB1_16
LBB1_13:                                ;   in Loop: Header=BB1_6 Depth=2
	and	x23, x22, #0xfffffffffffffff8
	add	x21, x24, x23
	lsl	x24, x24, #3
	mov	x25, x23
LBB1_14:                                ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x30, x0, x24
	ldp	q1, q2, [x30]
	ldp	q3, q4, [x30, #32]
	add	x30, x20, x24
	ldp	q5, q6, [x30]
	ldp	q7, q16, [x30, #32]
	fmul.2d	v1, v1, v5
	mov	d5, v1[1]
	fmul.2d	v2, v2, v6
	mov	d6, v2[1]
	fmul.2d	v3, v3, v7
	mov	d7, v3[1]
	fmul.2d	v4, v4, v16
	mov	d16, v4[1]
	fadd	d0, d0, d1
	fadd	d0, d0, d5
	fadd	d0, d0, d2
	fadd	d0, d0, d6
	fadd	d0, d0, d3
	fadd	d0, d0, d7
	fadd	d0, d0, d4
	fadd	d0, d0, d16
	add	x24, x24, #64
	subs	x25, x25, #8
	b.ne	LBB1_14
; %bb.15:                               ;   in Loop: Header=BB1_6 Depth=2
	cmp	x22, x23
	b.eq	LBB1_17
LBB1_16:                                ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d1, [x0, x21, lsl #3]
	ldr	d2, [x20, x21, lsl #3]
	fmadd	d0, d1, d2, d0
	add	x21, x21, #1
	cmp	x11, x21
	b.ne	LBB1_16
LBB1_17:                                ;   in Loop: Header=BB1_6 Depth=2
	cbz	x2, LBB1_5
; %bb.18:                               ;   in Loop: Header=BB1_6 Depth=2
	ldr	d1, [x2, x7, lsl #3]
	fadd	d0, d0, d1
	b	LBB1_5
LBB1_19:                                ;   in Loop: Header=BB1_3 Depth=1
	cmp	x13, #1
	b.lt	LBB1_2
; %bb.20:                               ;   in Loop: Header=BB1_3 Depth=1
	mov	x19, #0                         ; =0x0
	mul	x7, x9, x13
	add	x20, x6, x7, lsl #3
	mov	x21, x16
	b	LBB1_22
LBB1_21:                                ;   in Loop: Header=BB1_22 Depth=2
	str	d0, [x20, x19, lsl #3]
	add	x19, x19, #1
	add	x21, x21, x15
	cmp	x19, x13
	b.eq	LBB1_35
LBB1_22:                                ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_25 Depth 3
                                        ;       Child Loop BB1_30 Depth 3
                                        ;       Child Loop BB1_32 Depth 3
	cmp	x11, #2
	b.ge	LBB1_24
; %bb.23:                               ;   in Loop: Header=BB1_22 Depth=2
	mov	x25, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	faddp.2d	d0, v0
	subs	x23, x11, x25
	b.gt	LBB1_27
	b	LBB1_33
LBB1_24:                                ;   in Loop: Header=BB1_22 Depth=2
	mov	x22, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	mov	w23, #2                         ; =0x2
LBB1_25:                                ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_22 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x0, x22]
	ldr	q2, [x21, x22]
	fmla.2d	v0, v2, v1
	add	x23, x23, #2
	add	x22, x22, #16
	cmp	x23, x11
	b.le	LBB1_25
; %bb.26:                               ;   in Loop: Header=BB1_22 Depth=2
	mov	x25, x14
	faddp.2d	d0, v0
	subs	x23, x11, x14
	b.le	LBB1_33
LBB1_27:                                ;   in Loop: Header=BB1_22 Depth=2
	cmp	x23, #8
	b.hs	LBB1_29
; %bb.28:                               ;   in Loop: Header=BB1_22 Depth=2
	mov	x22, x25
	b	LBB1_32
LBB1_29:                                ;   in Loop: Header=BB1_22 Depth=2
	and	x24, x23, #0xfffffffffffffff8
	add	x22, x25, x24
	lsl	x25, x25, #3
	mov	x30, x24
LBB1_30:                                ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_22 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x10, x0, x25
	ldp	q1, q2, [x10]
	ldp	q3, q4, [x10, #32]
	add	x10, x21, x25
	ldp	q5, q6, [x10]
	ldp	q7, q16, [x10, #32]
	fmul.2d	v1, v1, v5
	mov	d5, v1[1]
	fmul.2d	v2, v2, v6
	mov	d6, v2[1]
	fmul.2d	v3, v3, v7
	mov	d7, v3[1]
	fmul.2d	v4, v4, v16
	mov	d16, v4[1]
	fadd	d0, d0, d1
	fadd	d0, d0, d5
	fadd	d0, d0, d2
	fadd	d0, d0, d6
	fadd	d0, d0, d3
	fadd	d0, d0, d7
	fadd	d0, d0, d4
	fadd	d0, d0, d16
	add	x25, x25, #64
	subs	x30, x30, #8
	b.ne	LBB1_30
; %bb.31:                               ;   in Loop: Header=BB1_22 Depth=2
	cmp	x23, x24
	b.eq	LBB1_33
LBB1_32:                                ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_22 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d1, [x0, x22, lsl #3]
	ldr	d2, [x21, x22, lsl #3]
	fmadd	d0, d1, d2, d0
	add	x22, x22, #1
	cmp	x11, x22
	b.ne	LBB1_32
LBB1_33:                                ;   in Loop: Header=BB1_22 Depth=2
	cbz	x3, LBB1_21
; %bb.34:                               ;   in Loop: Header=BB1_22 Depth=2
	ldr	d1, [x3, x19, lsl #3]
	fadd	d0, d0, d1
	b	LBB1_21
LBB1_35:                                ;   in Loop: Header=BB1_3 Depth=1
	mov	x19, #0                         ; =0x0
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	add	x7, x10, x7, lsl #3
	mov	x20, x17
	b	LBB1_37
LBB1_36:                                ;   in Loop: Header=BB1_37 Depth=2
	str	d0, [x7, x19, lsl #3]
	add	x19, x19, #1
	add	x20, x20, x15
	cmp	x19, x13
	b.eq	LBB1_2
LBB1_37:                                ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_40 Depth 3
                                        ;       Child Loop BB1_45 Depth 3
                                        ;       Child Loop BB1_47 Depth 3
	cmp	x11, #2
	b.ge	LBB1_39
; %bb.38:                               ;   in Loop: Header=BB1_37 Depth=2
	mov	x24, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	faddp.2d	d0, v0
	subs	x22, x11, x24
	b.gt	LBB1_42
	b	LBB1_48
LBB1_39:                                ;   in Loop: Header=BB1_37 Depth=2
	mov	x21, #0                         ; =0x0
	movi.2d	v0, #0000000000000000
	mov	w22, #2                         ; =0x2
LBB1_40:                                ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_37 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x0, x21]
	ldr	q2, [x20, x21]
	fmla.2d	v0, v2, v1
	add	x22, x22, #2
	add	x21, x21, #16
	cmp	x22, x11
	b.le	LBB1_40
; %bb.41:                               ;   in Loop: Header=BB1_37 Depth=2
	mov	x24, x14
	faddp.2d	d0, v0
	subs	x22, x11, x14
	b.le	LBB1_48
LBB1_42:                                ;   in Loop: Header=BB1_37 Depth=2
	cmp	x22, #8
	b.hs	LBB1_44
; %bb.43:                               ;   in Loop: Header=BB1_37 Depth=2
	mov	x21, x24
	b	LBB1_47
LBB1_44:                                ;   in Loop: Header=BB1_37 Depth=2
	and	x23, x22, #0xfffffffffffffff8
	add	x21, x24, x23
	lsl	x24, x24, #3
	mov	x25, x23
LBB1_45:                                ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_37 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x10, x0, x24
	ldp	q1, q2, [x10]
	ldp	q3, q4, [x10, #32]
	add	x10, x20, x24
	ldp	q5, q6, [x10]
	ldp	q7, q16, [x10, #32]
	fmul.2d	v1, v1, v5
	mov	d5, v1[1]
	fmul.2d	v2, v2, v6
	mov	d6, v2[1]
	fmul.2d	v3, v3, v7
	mov	d7, v3[1]
	fmul.2d	v4, v4, v16
	mov	d16, v4[1]
	fadd	d0, d0, d1
	fadd	d0, d0, d5
	fadd	d0, d0, d2
	fadd	d0, d0, d6
	fadd	d0, d0, d3
	fadd	d0, d0, d7
	fadd	d0, d0, d4
	fadd	d0, d0, d16
	add	x24, x24, #64
	subs	x25, x25, #8
	b.ne	LBB1_45
; %bb.46:                               ;   in Loop: Header=BB1_37 Depth=2
	cmp	x22, x23
	b.eq	LBB1_48
LBB1_47:                                ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_37 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d1, [x0, x21, lsl #3]
	ldr	d2, [x20, x21, lsl #3]
	fmadd	d0, d1, d2, d0
	add	x21, x21, #1
	cmp	x11, x21
	b.ne	LBB1_47
LBB1_48:                                ;   in Loop: Header=BB1_37 Depth=2
	cbz	x4, LBB1_36
; %bb.49:                               ;   in Loop: Header=BB1_37 Depth=2
	ldr	d1, [x4, x19, lsl #3]
	fadd	d0, d0, d1
	b	LBB1_36
LBB1_50:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldr	x25, [sp], #80                  ; 8-byte Folded Reload
LBB1_51:
	ret
                                        ; -- End function
.subsections_via_symbols
