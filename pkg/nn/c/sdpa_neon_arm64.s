	.build_version macos, 15, 0	sdk_version 15, 5
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function sdpa_neon_f32
lCPI0_0:
	.quad	2                               ; 0x2
	.quad	3                               ; 0x3
lCPI0_1:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_sdpa_neon_f32
	.p2align	2
_sdpa_neon_f32:                         ; @sdpa_neon_f32
; %bb.0:
	sub	sp, sp, #128
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
	stp	x25, x5, [sp, #48]              ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	ldp	x8, x11, [x6]
	ldr	x10, [x6, #16]
	cmp	x8, #1
	ccmp	x11, #1, #8, ge
	ccmp	x10, #1, #8, ge
	b.lt	LBB0_129
; %bb.1:
	str	x2, [sp]                        ; 8-byte Folded Spill
	mov	x12, #0                         ; =0x0
	ldr	s0, [x7]
	and	x13, x10, #0x7ffffffffffffffc
	and	x9, x11, #0x7ffffffffffffffc
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	and	x15, x10, #0x3
	and	x16, x11, #0x3
	lsl	x9, x10, #2
	mov	w14, #43579                     ; =0xaa3b
	movk	w14, #16312, lsl #16
	dup.4s	v1, w14
	sub	x17, x15, x10
	lsl	x2, x11, #2
	mov	w14, #32768                     ; =0x8000
	movk	w14, #48945, lsl #16
	dup.4s	v2, w14
	sub	x14, x16, x11
	stp	x14, x16, [sp, #8]              ; 16-byte Folded Spill
	mov	w14, #32899                     ; =0x8083
	movk	w14, #14686, lsl #16
	dup.4s	v3, w14
	mov	w14, #2913                      ; =0xb61
	movk	w14, #15030, lsl #16
	dup.4s	v4, w14
	mov	w14, #34953                     ; =0x8889
	movk	w14, #15368, lsl #16
	dup.4s	v5, w14
	mov	w14, #43691                     ; =0xaaab
	movk	w14, #15658, lsl #16
	dup.4s	v6, w14
	mov	w19, #44106                     ; =0xac4a
	movk	w19, #49838, lsl #16
	mov	w14, #43691                     ; =0xaaab
	movk	w14, #15914, lsl #16
	dup.4s	v7, w14
	fmov	s16, #1.00000000
	mov	x20, x4
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x12, x12, #1
	add	x0, x0, x9
	add	x20, x20, x2
	cmp	x12, x8
	b.eq	LBB0_55
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
                                        ;       Child Loop BB0_8 Depth 3
                                        ;       Child Loop BB0_15 Depth 3
                                        ;       Child Loop BB0_19 Depth 3
                                        ;       Child Loop BB0_21 Depth 3
                                        ;     Child Loop BB0_28 Depth 2
                                        ;     Child Loop BB0_30 Depth 2
                                        ;     Child Loop BB0_34 Depth 2
                                        ;     Child Loop BB0_36 Depth 2
                                        ;     Child Loop BB0_40 Depth 2
                                        ;     Child Loop BB0_47 Depth 2
                                        ;     Child Loop BB0_51 Depth 2
                                        ;     Child Loop BB0_53 Depth 2
	mov	x21, #0                         ; =0x0
	mul	x22, x12, x11
	lsl	x14, x22, #2
	add	x23, x3, x14
	add	x24, x4, x14
	mov	x25, x1
	b	LBB0_5
LBB0_4:                                 ;   in Loop: Header=BB0_5 Depth=2
	str	s17, [x24, x21, lsl #2]
	add	x21, x21, #1
	add	x25, x25, x9
	cmp	x21, x11
	b.eq	LBB0_25
LBB0_5:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_8 Depth 3
                                        ;       Child Loop BB0_15 Depth 3
                                        ;       Child Loop BB0_19 Depth 3
                                        ;       Child Loop BB0_21 Depth 3
	cmp	x10, #4
	b.hs	LBB0_7
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	mov	x30, #0                         ; =0x0
	movi.2d	v17, #0000000000000000
	faddp.4s	v17, v17, v17
	faddp.2s	s17, v17
	subs	x7, x10, x30
	b.gt	LBB0_10
	b	LBB0_22
LBB0_7:                                 ;   in Loop: Header=BB0_5 Depth=2
	movi.2d	v17, #0000000000000000
	mov	x14, x25
	mov	x16, x0
	mov	w5, #4                          ; =0x4
LBB0_8:                                 ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_5 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q18, [x16], #16
	ldr	q19, [x14], #16
	fmla.4s	v17, v19, v18
	add	x5, x5, #4
	cmp	x5, x10
	b.le	LBB0_8
; %bb.9:                                ;   in Loop: Header=BB0_5 Depth=2
	mov	x30, x13
	faddp.4s	v17, v17, v17
	faddp.2s	s17, v17
	subs	x7, x10, x13
	b.le	LBB0_22
LBB0_10:                                ;   in Loop: Header=BB0_5 Depth=2
	cmp	x7, #4
	b.hs	LBB0_12
; %bb.11:                               ;   in Loop: Header=BB0_5 Depth=2
	mov	x7, x30
	b	LBB0_21
LBB0_12:                                ;   in Loop: Header=BB0_5 Depth=2
	cmp	x7, #16
	b.hs	LBB0_14
; %bb.13:                               ;   in Loop: Header=BB0_5 Depth=2
	mov	x14, #0                         ; =0x0
	b	LBB0_18
LBB0_14:                                ;   in Loop: Header=BB0_5 Depth=2
	and	x14, x7, #0xfffffffffffffff0
	lsl	x5, x30, #2
	mov	x16, x14
LBB0_15:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_5 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x6, x0, x5
	ldp	q18, q19, [x6]
	ldp	q20, q21, [x6, #32]
	add	x6, x25, x5
	ldp	q22, q23, [x6]
	ldp	q24, q25, [x6, #32]
	fmul.4s	v18, v18, v22
	mov	s22, v18[3]
	mov	s26, v18[2]
	mov	s27, v18[1]
	fmul.4s	v19, v19, v23
	mov	s23, v19[3]
	mov	s28, v19[2]
	mov	s29, v19[1]
	fmul.4s	v20, v20, v24
	mov	s24, v20[3]
	mov	s30, v20[2]
	mov	s31, v20[1]
	fmul.4s	v21, v21, v25
	mov	s25, v21[3]
	mov	s8, v21[2]
	mov	s9, v21[1]
	fadd	s17, s17, s18
	fadd	s17, s17, s27
	fadd	s17, s17, s26
	fadd	s17, s17, s22
	fadd	s17, s17, s19
	fadd	s17, s17, s29
	fadd	s17, s17, s28
	fadd	s17, s17, s23
	fadd	s17, s17, s20
	fadd	s17, s17, s31
	fadd	s17, s17, s30
	fadd	s17, s17, s24
	fadd	s17, s17, s21
	fadd	s17, s17, s9
	fadd	s17, s17, s8
	fadd	s17, s17, s25
	add	x5, x5, #64
	subs	x16, x16, #16
	b.ne	LBB0_15
; %bb.16:                               ;   in Loop: Header=BB0_5 Depth=2
	cmp	x7, x14
	b.eq	LBB0_22
; %bb.17:                               ;   in Loop: Header=BB0_5 Depth=2
	tst	x7, #0xc
	b.eq	LBB0_24
LBB0_18:                                ;   in Loop: Header=BB0_5 Depth=2
	sub	x16, x7, x15
	add	x7, x30, x16
	add	x16, x14, x30
	add	x14, x16, x17
	lsl	x16, x16, #2
LBB0_19:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_5 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q18, [x0, x16]
	ldr	q19, [x25, x16]
	fmul.4s	v18, v18, v19
	mov	s19, v18[3]
	mov	s20, v18[2]
	mov	s21, v18[1]
	fadd	s17, s17, s18
	fadd	s17, s17, s21
	fadd	s17, s17, s20
	fadd	s17, s17, s19
	add	x16, x16, #16
	adds	x14, x14, #4
	b.ne	LBB0_19
; %bb.20:                               ;   in Loop: Header=BB0_5 Depth=2
	cbz	x15, LBB0_22
LBB0_21:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_5 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s18, [x0, x7, lsl #2]
	ldr	s19, [x25, x7, lsl #2]
	fmadd	s17, s18, s19, s17
	add	x7, x7, #1
	cmp	x10, x7
	b.ne	LBB0_21
LBB0_22:                                ;   in Loop: Header=BB0_5 Depth=2
	fmul	s17, s0, s17
	cbz	x3, LBB0_4
; %bb.23:                               ;   in Loop: Header=BB0_5 Depth=2
	ldr	s18, [x23, x21, lsl #2]
	fadd	s17, s17, s18
	b	LBB0_4
LBB0_24:                                ;   in Loop: Header=BB0_5 Depth=2
	add	x7, x30, x14
	b	LBB0_21
LBB0_25:                                ;   in Loop: Header=BB0_3 Depth=1
	add	x14, x4, x22, lsl #2
	ld1r.4s	{ v17 }, [x14]
	cmp	x11, #4
	b.hs	LBB0_27
; %bb.26:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x14, #0                         ; =0x0
	fmaxv.4s	s17, v17
	cmp	x14, x11
	b.lt	LBB0_30
	b	LBB0_31
LBB0_27:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x14, x20
	mov	w16, #4                         ; =0x4
LBB0_28:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q18, [x14], #16
	fmax.4s	v17, v17, v18
	add	x16, x16, #4
	cmp	x16, x11
	b.le	LBB0_28
; %bb.29:                               ;   in Loop: Header=BB0_3 Depth=1
	ldr	x14, [sp, #24]                  ; 8-byte Folded Reload
	fmaxv.4s	s17, v17
	cmp	x14, x11
	b.ge	LBB0_31
LBB0_30:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s18, [x20, x14, lsl #2]
	fcmp	s18, s17
	fcsel	s17, s18, s17, gt
	add	x14, x14, #1
	cmp	x11, x14
	b.ne	LBB0_30
LBB0_31:                                ;   in Loop: Header=BB0_3 Depth=1
	fmov.4s	v18, #1.00000000
	cmp	x11, #4
	b.hs	LBB0_33
; %bb.32:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x16, #0                         ; =0x0
	movi.2d	v19, #0000000000000000
	b	LBB0_35
LBB0_33:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x14, #0                         ; =0x0
	dup.4s	v20, v17[0]
	movi.2d	v19, #0000000000000000
	mov	x5, x20
LBB0_34:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q21, [x5]
	fsub.4s	v21, v21, v20
	dup.4s	v22, w19
	fmax.4s	v21, v21, v22
	fmul.4s	v22, v21, v1
	frintn.4s	v22, v22
	fmul.4s	v23, v22, v2
	fadd.4s	v21, v21, v23
	fmul.4s	v23, v22, v3
	fadd.4s	v21, v21, v23
	mov.16b	v23, v5
	fmla.4s	v23, v4, v21
	mov.16b	v24, v6
	fmla.4s	v24, v21, v23
	mov.16b	v23, v7
	fmla.4s	v23, v21, v24
	movi.4s	v24, #63, lsl #24
	fmla.4s	v24, v21, v23
	mov.16b	v23, v18
	fmla.4s	v23, v21, v24
	mov.16b	v24, v18
	fmla.4s	v24, v21, v23
	fcvtns.4s	v21, v22
	shl.4s	v21, v21, #23
	add.4s	v21, v21, v18
	fmul.4s	v21, v24, v21
	str	q21, [x5], #16
	fadd.4s	v19, v19, v21
	add	x16, x14, #4
	add	x6, x14, #8
	mov	x14, x16
	cmp	x6, x11
	b.le	LBB0_34
LBB0_35:                                ;   in Loop: Header=BB0_3 Depth=1
	faddp.4s	v19, v19, v19
	faddp.2s	s19, v19
	cmp	x16, x11
	b.ge	LBB0_37
LBB0_36:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s20, [x20, x16, lsl #2]
	fsub	s20, s20, s17
	fmov	s21, w19
	fcmp	s20, s21
	fcsel	s20, s21, s20, mi
	dup.4s	v21, v20[0]
	fmul.4s	v20, v1, v20[0]
	frintn.4s	v20, v20
	fmul.4s	v22, v20, v2
	fadd.4s	v21, v21, v22
	fmul.4s	v22, v20, v3
	fadd.4s	v21, v21, v22
	mov.16b	v22, v5
	fmla.4s	v22, v4, v21
	mov.16b	v23, v6
	fmla.4s	v23, v21, v22
	mov.16b	v22, v7
	fmla.4s	v22, v21, v23
	movi.4s	v23, #63, lsl #24
	fmla.4s	v23, v21, v22
	mov.16b	v22, v18
	fmla.4s	v22, v21, v23
	mov.16b	v23, v18
	fmla.4s	v23, v21, v22
	fcvtns.4s	v20, v20
	shl.4s	v20, v20, #23
	add.4s	v20, v20, v18
	fmul.4s	v20, v23, v20
	str	s20, [x20, x16, lsl #2]
	fadd	s19, s19, s20
	add	x16, x16, #1
	cmp	x11, x16
	b.ne	LBB0_36
LBB0_37:                                ;   in Loop: Header=BB0_3 Depth=1
	fdiv	s17, s16, s19
	cmp	x11, #4
	b.hs	LBB0_39
; %bb.38:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x16, #0                         ; =0x0
	b	LBB0_41
LBB0_39:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x5, #0                          ; =0x0
	mov	x14, x20
LBB0_40:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q18, [x14]
	fmul.4s	v18, v18, v17[0]
	str	q18, [x14], #16
	add	x16, x5, #4
	add	x6, x5, #8
	mov	x5, x16
	cmp	x6, x11
	b.le	LBB0_40
LBB0_41:                                ;   in Loop: Header=BB0_3 Depth=1
	subs	x14, x11, x16
	b.le	LBB0_2
; %bb.42:                               ;   in Loop: Header=BB0_3 Depth=1
	cmp	x14, #3
	b.hi	LBB0_44
; %bb.43:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x14, x16
	b	LBB0_53
LBB0_44:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	x14, #16
	b.hs	LBB0_46
; %bb.45:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x5, #0                          ; =0x0
	b	LBB0_50
LBB0_46:                                ;   in Loop: Header=BB0_3 Depth=1
	and	x5, x14, #0xfffffffffffffff0
	add	x7, x20, x16, lsl #2
	mov	x21, x5
LBB0_47:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q18, q19, [x7]
	ldp	q20, q21, [x7, #32]
	fmul.4s	v18, v18, v17[0]
	fmul.4s	v19, v19, v17[0]
	fmul.4s	v20, v20, v17[0]
	fmul.4s	v21, v21, v17[0]
	stp	q18, q19, [x7]
	stp	q20, q21, [x7, #32]
	add	x7, x7, #64
	subs	x21, x21, #16
	b.ne	LBB0_47
; %bb.48:                               ;   in Loop: Header=BB0_3 Depth=1
	cmp	x14, x5
	b.eq	LBB0_2
; %bb.49:                               ;   in Loop: Header=BB0_3 Depth=1
	tst	x14, #0xc
	b.eq	LBB0_54
LBB0_50:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	x6, [sp, #16]                   ; 8-byte Folded Reload
	sub	x14, x14, x6
	add	x14, x16, x14
	lsl	x6, x5, #2
	add	x7, x6, x16, lsl #2
	ldr	x6, [sp, #8]                    ; 8-byte Folded Reload
	add	x5, x6, x5
	add	x16, x5, x16
LBB0_51:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q18, [x20, x7]
	fmul.4s	v18, v18, v17[0]
	str	q18, [x20, x7]
	add	x7, x7, #16
	adds	x16, x16, #4
	b.ne	LBB0_51
; %bb.52:                               ;   in Loop: Header=BB0_3 Depth=1
	ldr	x16, [sp, #16]                  ; 8-byte Folded Reload
	cbz	x16, LBB0_2
LBB0_53:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s18, [x20, x14, lsl #2]
	fmul	s18, s17, s18
	str	s18, [x20, x14, lsl #2]
	add	x14, x14, #1
	cmp	x11, x14
	b.ne	LBB0_53
	b	LBB0_2
LBB0_54:                                ;   in Loop: Header=BB0_3 Depth=1
	add	x14, x16, x5
	b	LBB0_53
LBB0_55:
	cmp	x8, #1
	ldr	x2, [sp]                        ; 8-byte Folded Reload
	b.lt	LBB0_129
; %bb.56:
	cmp	x11, #1
	b.lt	LBB0_100
; %bb.57:
	mov	x12, #0                         ; =0x0
	ldr	x17, [sp, #56]                  ; 8-byte Folded Reload
	add	x13, x17, x9
	and	x14, x10, #0x3
	add	x15, x2, x9
	sub	x16, x14, x10
	movi.2d	v0, #0000000000000000
	b	LBB0_59
LBB0_58:                                ;   in Loop: Header=BB0_59 Depth=1
	add	x12, x12, #1
	add	x17, x17, x9
	cmp	x12, x8
	b.eq	LBB0_129
LBB0_59:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_62 Depth 2
                                        ;     Child Loop BB0_69 Depth 2
                                        ;     Child Loop BB0_73 Depth 2
                                        ;     Child Loop BB0_75 Depth 2
                                        ;     Child Loop BB0_78 Depth 2
                                        ;       Child Loop BB0_82 Depth 3
                                        ;       Child Loop BB0_92 Depth 3
                                        ;       Child Loop BB0_96 Depth 3
                                        ;       Child Loop BB0_88 Depth 3
	cmp	x10, #4
	b.hs	LBB0_61
; %bb.60:                               ;   in Loop: Header=BB0_59 Depth=1
	mov	x0, #0                          ; =0x0
	b	LBB0_63
LBB0_61:                                ;   in Loop: Header=BB0_59 Depth=1
	mov	x3, #0                          ; =0x0
	mov	x1, x17
LBB0_62:                                ;   Parent Loop BB0_59 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	xzr, xzr, [x1], #16
	add	x0, x3, #4
	add	x5, x3, #8
	mov	x3, x0
	cmp	x5, x10
	b.le	LBB0_62
LBB0_63:                                ;   in Loop: Header=BB0_59 Depth=1
	subs	x1, x10, x0
	b.le	LBB0_76
; %bb.64:                               ;   in Loop: Header=BB0_59 Depth=1
	cmp	x1, #3
	b.hi	LBB0_66
; %bb.65:                               ;   in Loop: Header=BB0_59 Depth=1
	mov	x1, x0
	b	LBB0_75
LBB0_66:                                ;   in Loop: Header=BB0_59 Depth=1
	cmp	x1, #16
	b.hs	LBB0_68
; %bb.67:                               ;   in Loop: Header=BB0_59 Depth=1
	mov	x3, #0                          ; =0x0
	b	LBB0_72
LBB0_68:                                ;   in Loop: Header=BB0_59 Depth=1
	and	x3, x1, #0xfffffffffffffff0
	add	x5, x17, x0, lsl #2
	mov	x6, x3
LBB0_69:                                ;   Parent Loop BB0_59 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	q0, q0, [x5]
	stp	q0, q0, [x5, #32]
	add	x5, x5, #64
	subs	x6, x6, #16
	b.ne	LBB0_69
; %bb.70:                               ;   in Loop: Header=BB0_59 Depth=1
	cmp	x1, x3
	b.eq	LBB0_76
; %bb.71:                               ;   in Loop: Header=BB0_59 Depth=1
	tst	x1, #0xc
	b.eq	LBB0_99
LBB0_72:                                ;   in Loop: Header=BB0_59 Depth=1
	sub	x1, x1, x14
	add	x1, x0, x1
	lsl	x5, x3, #2
	add	x5, x5, x0, lsl #2
	add	x3, x16, x3
	add	x0, x3, x0
LBB0_73:                                ;   Parent Loop BB0_59 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x3, x17, x5
	stp	xzr, xzr, [x3]
	add	x5, x5, #16
	adds	x0, x0, #4
	b.ne	LBB0_73
; %bb.74:                               ;   in Loop: Header=BB0_59 Depth=1
	cbz	x14, LBB0_76
LBB0_75:                                ;   Parent Loop BB0_59 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	wzr, [x17, x1, lsl #2]
	add	x1, x1, #1
	cmp	x10, x1
	b.ne	LBB0_75
LBB0_76:                                ;   in Loop: Header=BB0_59 Depth=1
	mov	x0, #0                          ; =0x0
	mul	x3, x9, x12
	ldr	x1, [sp, #56]                   ; 8-byte Folded Reload
	add	x1, x1, x3
	add	x3, x13, x3
	mul	x5, x12, x11
	add	x6, x4, x5, lsl #2
	mov	x7, x2
	b	LBB0_78
LBB0_77:                                ;   in Loop: Header=BB0_78 Depth=2
	add	x0, x0, #1
	add	x7, x7, x9
	cmp	x0, x11
	b.eq	LBB0_58
LBB0_78:                                ;   Parent Loop BB0_59 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_82 Depth 3
                                        ;       Child Loop BB0_92 Depth 3
                                        ;       Child Loop BB0_96 Depth 3
                                        ;       Child Loop BB0_88 Depth 3
	ldr	s1, [x6, x0, lsl #2]
	fcmp	s1, #0.0
	b.eq	LBB0_77
; %bb.79:                               ;   in Loop: Header=BB0_78 Depth=2
	cmp	x10, #4
	b.hs	LBB0_81
; %bb.80:                               ;   in Loop: Header=BB0_78 Depth=2
	mov	x19, #0                         ; =0x0
	b	LBB0_83
LBB0_81:                                ;   in Loop: Header=BB0_78 Depth=2
	mov	x5, #0                          ; =0x0
	mov	x20, #0                         ; =0x0
LBB0_82:                                ;   Parent Loop BB0_59 Depth=1
                                        ;     Parent Loop BB0_78 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q2, [x17, x5]
	ldr	q3, [x7, x5]
	fmla.4s	v2, v3, v1[0]
	str	q2, [x17, x5]
	add	x19, x20, #4
	add	x5, x5, #16
	add	x21, x20, #8
	mov	x20, x19
	cmp	x21, x10
	b.le	LBB0_82
LBB0_83:                                ;   in Loop: Header=BB0_78 Depth=2
	subs	x5, x10, x19
	b.le	LBB0_77
; %bb.84:                               ;   in Loop: Header=BB0_78 Depth=2
	cmp	x5, #3
	b.ls	LBB0_87
; %bb.85:                               ;   in Loop: Header=BB0_78 Depth=2
	mul	x20, x9, x0
	add	x22, x15, x20
	lsl	x21, x19, #2
	add	x23, x1, x21
	cmp	x23, x22
	b.hs	LBB0_89
; %bb.86:                               ;   in Loop: Header=BB0_78 Depth=2
	add	x20, x2, x20
	add	x20, x20, x21
	cmp	x20, x3
	b.hs	LBB0_89
LBB0_87:                                ;   in Loop: Header=BB0_78 Depth=2
	mov	x5, x19
LBB0_88:                                ;   Parent Loop BB0_59 Depth=1
                                        ;     Parent Loop BB0_78 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s2, [x7, x5, lsl #2]
	ldr	s3, [x17, x5, lsl #2]
	fmadd	s2, s1, s2, s3
	str	s2, [x17, x5, lsl #2]
	add	x5, x5, #1
	cmp	x10, x5
	b.ne	LBB0_88
	b	LBB0_77
LBB0_89:                                ;   in Loop: Header=BB0_78 Depth=2
	cmp	x5, #16
	b.hs	LBB0_91
; %bb.90:                               ;   in Loop: Header=BB0_78 Depth=2
	mov	x20, #0                         ; =0x0
	b	LBB0_95
LBB0_91:                                ;   in Loop: Header=BB0_78 Depth=2
	and	x20, x5, #0xfffffffffffffff0
	mov	x22, x20
LBB0_92:                                ;   Parent Loop BB0_59 Depth=1
                                        ;     Parent Loop BB0_78 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x23, x7, x21
	ldp	q2, q3, [x23]
	ldp	q4, q5, [x23, #32]
	add	x23, x17, x21
	ldp	q6, q7, [x23]
	ldp	q16, q17, [x23, #32]
	fmla.4s	v6, v2, v1[0]
	fmla.4s	v7, v3, v1[0]
	fmla.4s	v16, v4, v1[0]
	fmla.4s	v17, v5, v1[0]
	stp	q6, q7, [x23]
	stp	q16, q17, [x23, #32]
	add	x21, x21, #64
	subs	x22, x22, #16
	b.ne	LBB0_92
; %bb.93:                               ;   in Loop: Header=BB0_78 Depth=2
	cmp	x5, x20
	b.eq	LBB0_77
; %bb.94:                               ;   in Loop: Header=BB0_78 Depth=2
	tst	x5, #0xc
	b.eq	LBB0_98
LBB0_95:                                ;   in Loop: Header=BB0_78 Depth=2
	sub	x5, x5, x14
	add	x5, x19, x5
	add	x20, x20, x19
	add	x19, x20, x16
	lsl	x20, x20, #2
LBB0_96:                                ;   Parent Loop BB0_59 Depth=1
                                        ;     Parent Loop BB0_78 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q2, [x7, x20]
	ldr	q3, [x17, x20]
	fmla.4s	v3, v2, v1[0]
	str	q3, [x17, x20]
	add	x20, x20, #16
	adds	x19, x19, #4
	b.ne	LBB0_96
; %bb.97:                               ;   in Loop: Header=BB0_78 Depth=2
	cbnz	x14, LBB0_88
	b	LBB0_77
LBB0_98:                                ;   in Loop: Header=BB0_78 Depth=2
	add	x5, x19, x20
	b	LBB0_88
LBB0_99:                                ;   in Loop: Header=BB0_59 Depth=1
	add	x1, x0, x3
	b	LBB0_75
LBB0_100:
	cmp	x10, #4
	b.hs	LBB0_112
; %bb.101:
	cbz	x10, LBB0_129
; %bb.102:
	sub	x10, x10, #1
	dup.2d	v0, x10
Lloh0:
	adrp	x10, lCPI0_0@PAGE
Lloh1:
	ldr	q1, [x10, lCPI0_0@PAGEOFF]
	cmhs.2d	v1, v0, v1
Lloh2:
	adrp	x10, lCPI0_1@PAGE
Lloh3:
	ldr	q2, [x10, lCPI0_1@PAGEOFF]
	cmhs.2d	v0, v0, v2
	uzp1.4s	v0, v0, v1
	xtn.4h	v0, v0
	umov.h	w10, v0[0]
	umov.h	w11, v0[1]
	umov.h	w12, v0[2]
	umov.h	w13, v0[3]
	ldr	x14, [sp, #56]                  ; 8-byte Folded Reload
	add	x14, x14, #8
	b	LBB0_104
LBB0_103:                               ;   in Loop: Header=BB0_104 Depth=1
	add	x14, x14, x9
	subs	x8, x8, #1
	b.eq	LBB0_129
LBB0_104:                               ; =>This Inner Loop Header: Depth=1
	tbnz	w10, #0, LBB0_108
; %bb.105:                              ;   in Loop: Header=BB0_104 Depth=1
	tbnz	w11, #0, LBB0_109
LBB0_106:                               ;   in Loop: Header=BB0_104 Depth=1
	tbnz	w12, #0, LBB0_110
LBB0_107:                               ;   in Loop: Header=BB0_104 Depth=1
	tbz	w13, #0, LBB0_103
	b	LBB0_111
LBB0_108:                               ;   in Loop: Header=BB0_104 Depth=1
	stur	wzr, [x14, #-8]
	tbz	w11, #0, LBB0_106
LBB0_109:                               ;   in Loop: Header=BB0_104 Depth=1
	stur	wzr, [x14, #-4]
	tbz	w12, #0, LBB0_107
LBB0_110:                               ;   in Loop: Header=BB0_104 Depth=1
	str	wzr, [x14]
	tbz	w13, #0, LBB0_103
LBB0_111:                               ;   in Loop: Header=BB0_104 Depth=1
	str	wzr, [x14, #4]
	b	LBB0_103
LBB0_112:
	mov	x11, #0                         ; =0x0
	mov	w12, #7                         ; =0x7
	cmp	x10, #7
	csel	x12, x10, x12, gt
	and	x1, x12, #0x7ffffffffffffffc
	orr	x12, x1, #0x1
	cmp	x10, x12
	csinc	x2, x10, x1, gt
	and	x12, x2, #0x3
	sub	x13, x2, x1
	sub	x14, x13, x12
	and	x15, x13, #0xfffffffffffffff0
	and	x16, x13, #0xc
	ldr	x3, [sp, #56]                   ; 8-byte Folded Reload
	add	x17, x3, #48
	add	x0, x3, #16
	bfxil	x1, x2, #0, #2
	sub	x1, x1, x2
	movi.2d	v0, #0000000000000000
	mov	x2, x3
	b	LBB0_114
LBB0_113:                               ;   in Loop: Header=BB0_114 Depth=1
	add	x11, x11, #1
	add	x17, x17, x9
	add	x0, x0, x9
	add	x2, x2, x9
	cmp	x11, x8
	b.eq	LBB0_129
LBB0_114:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_115 Depth 2
                                        ;     Child Loop BB0_121 Depth 2
                                        ;     Child Loop BB0_125 Depth 2
                                        ;     Child Loop BB0_127 Depth 2
	mov	x3, #0                          ; =0x0
	mul	x4, x11, x10
	ldr	x5, [sp, #56]                   ; 8-byte Folded Reload
	add	x6, x5, x4, lsl #2
	mov	x7, x0
	mov	x19, x17
	mov	w20, #4                         ; =0x4
LBB0_115:                               ;   Parent Loop BB0_114 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x21, x6, x3, lsl #2
	mov	x3, x20
	mov	x5, x19
	mov	x4, x7
	stp	xzr, xzr, [x21]
	add	x20, x20, #4
	add	x19, x19, #16
	add	x7, x7, #16
	cmp	x20, x10
	b.le	LBB0_115
; %bb.116:                              ;   in Loop: Header=BB0_114 Depth=1
	cmp	x3, x10
	b.ge	LBB0_113
; %bb.117:                              ;   in Loop: Header=BB0_114 Depth=1
	cmp	x13, #3
	b.ls	LBB0_127
; %bb.118:                              ;   in Loop: Header=BB0_114 Depth=1
	cmp	x13, #16
	b.hs	LBB0_120
; %bb.119:                              ;   in Loop: Header=BB0_114 Depth=1
	mov	x5, #0                          ; =0x0
	b	LBB0_124
LBB0_120:                               ;   in Loop: Header=BB0_114 Depth=1
	mov	x6, x15
LBB0_121:                               ;   Parent Loop BB0_114 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	q0, q0, [x5, #-32]
	stp	q0, q0, [x5], #64
	subs	x6, x6, #16
	b.ne	LBB0_121
; %bb.122:                              ;   in Loop: Header=BB0_114 Depth=1
	cmp	x13, x15
	b.eq	LBB0_113
; %bb.123:                              ;   in Loop: Header=BB0_114 Depth=1
	mov	x5, x15
	cbz	x16, LBB0_128
LBB0_124:                               ;   in Loop: Header=BB0_114 Depth=1
	add	x3, x3, x14
	add	x4, x4, x5, lsl #2
	add	x5, x1, x5
LBB0_125:                               ;   Parent Loop BB0_114 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	xzr, xzr, [x4], #16
	adds	x5, x5, #4
	b.ne	LBB0_125
; %bb.126:                              ;   in Loop: Header=BB0_114 Depth=1
	cbz	x12, LBB0_113
LBB0_127:                               ;   Parent Loop BB0_114 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	wzr, [x2, x3, lsl #2]
	add	x3, x3, #1
	cmp	x3, x10
	b.lt	LBB0_127
	b	LBB0_113
LBB0_128:                               ;   in Loop: Header=BB0_114 Depth=1
	add	x3, x3, x15
	b	LBB0_127
LBB0_129:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldr	x25, [sp, #48]                  ; 8-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpAdrp	Lloh0, Lloh2
	.loh AdrpLdr	Lloh0, Lloh1
                                        ; -- End function
	.globl	_sdpa_causal_neon_f32           ; -- Begin function sdpa_causal_neon_f32
	.p2align	2
_sdpa_causal_neon_f32:                  ; @sdpa_causal_neon_f32
; %bb.0:
	sub	sp, sp, #224
	stp	d11, d10, [sp, #112]            ; 16-byte Folded Spill
	stp	d9, d8, [sp, #128]              ; 16-byte Folded Spill
	str	x25, [sp, #144]                 ; 8-byte Folded Spill
	stp	x24, x23, [sp, #160]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #176]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #192]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #208]            ; 16-byte Folded Spill
	stp	x1, x4, [sp, #40]               ; 16-byte Folded Spill
	str	x2, [sp, #104]                  ; 8-byte Folded Spill
	ldp	x8, x9, [x5]
	ldr	x10, [x5, #16]
	stp	x3, x8, [sp, #80]               ; 16-byte Folded Spill
	subs	x11, x8, #1
	ccmp	x9, #1, #8, ge
	ccmp	x10, #1, #8, ge
	b.ge	LBB1_2
LBB1_1:
	ldp	x29, x30, [sp, #208]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #192]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #176]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #160]            ; 16-byte Folded Reload
	ldr	x25, [sp, #144]                 ; 8-byte Folded Reload
	ldp	d9, d8, [sp, #128]              ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #224
	ret
LBB1_2:
	mov	x12, #0                         ; =0x0
	ldr	s0, [x6]
	ldr	x13, [sp, #88]                  ; 8-byte Folded Reload
	sub	x8, x9, x13
	add	x15, x8, #1
	and	x14, x10, #0x7ffffffffffffffc
	and	x8, x9, #0x7ffffffffffffffc
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	lsl	x16, x10, #2
	ldr	x4, [sp, #48]                   ; 8-byte Folded Reload
	add	x8, x4, x16
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	mvni.4s	v1, #127, msl #16
	mov	w8, #43579                      ; =0xaa3b
	movk	w8, #16312, lsl #16
	dup.4s	v2, w8
	and	x5, x10, #0x3
	and	x17, x9, #0x3
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	add	x8, x8, x16
	str	x8, [sp, #96]                   ; 8-byte Folded Spill
	mov	w8, #32768                      ; =0x8000
	movk	w8, #48945, lsl #16
	dup.4s	v3, w8
	sub	x8, x5, x10
	str	x8, [sp, #152]                  ; 8-byte Folded Spill
	lsl	x1, x9, #2
	lsl	x8, x13, #2
	sub	x13, x1, x8
	ldr	x3, [sp, #80]                   ; 8-byte Folded Reload
	add	x13, x13, x3
	add	x21, x13, #36
	add	x13, x1, #4
	stp	x13, x1, [sp, #56]              ; 16-byte Folded Spill
	sub	x8, x13, x8
	add	x23, x3, x8
	sub	x8, x17, x9
	stp	x8, x17, [sp, #8]               ; 16-byte Folded Spill
	mov	w25, #-8388608                  ; =0xff800000
	mov	w30, #44106                     ; =0xac4a
	movk	w30, #49838, lsl #16
	mov	w8, #32899                      ; =0x8083
	movk	w8, #14686, lsl #16
	dup.4s	v4, w8
	mov	w8, #2913                       ; =0xb61
	movk	w8, #15030, lsl #16
	dup.4s	v5, w8
	mov	w8, #34953                      ; =0x8889
	movk	w8, #15368, lsl #16
	dup.4s	v6, w8
	mov	w8, #43691                      ; =0xaaab
	movk	w8, #15658, lsl #16
	dup.4s	v7, w8
	fmov	s16, #1.00000000
	movi.2d	v17, #0000000000000000
	str	x15, [sp, #72]                  ; 8-byte Folded Spill
	mov	x13, x15
	b	LBB1_4
LBB1_3:                                 ;   in Loop: Header=BB1_4 Depth=1
	add	x12, x12, #1
	add	x13, x13, #1
	add	x0, x0, x16
	sub	x11, x11, #1
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	add	x21, x21, x8
	add	x23, x23, x8
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	add	x3, x3, x8
	add	x4, x4, x16
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	cmp	x12, x8
	b.eq	LBB1_1
LBB1_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_7 Depth 2
                                        ;       Child Loop BB1_10 Depth 3
                                        ;       Child Loop BB1_17 Depth 3
                                        ;       Child Loop BB1_21 Depth 3
                                        ;       Child Loop BB1_23 Depth 3
                                        ;     Child Loop BB1_30 Depth 2
                                        ;     Child Loop BB1_34 Depth 2
                                        ;     Child Loop BB1_38 Depth 2
                                        ;     Child Loop BB1_42 Depth 2
                                        ;     Child Loop BB1_44 Depth 2
                                        ;     Child Loop BB1_48 Depth 2
                                        ;     Child Loop BB1_50 Depth 2
                                        ;     Child Loop BB1_54 Depth 2
                                        ;     Child Loop BB1_61 Depth 2
                                        ;     Child Loop BB1_65 Depth 2
                                        ;     Child Loop BB1_67 Depth 2
                                        ;     Child Loop BB1_71 Depth 2
                                        ;     Child Loop BB1_78 Depth 2
                                        ;     Child Loop BB1_82 Depth 2
                                        ;     Child Loop BB1_84 Depth 2
                                        ;     Child Loop BB1_88 Depth 2
                                        ;       Child Loop BB1_92 Depth 3
                                        ;       Child Loop BB1_102 Depth 3
                                        ;       Child Loop BB1_106 Depth 3
                                        ;       Child Loop BB1_98 Depth 3
	mul	x8, x12, x9
	ldp	x15, x17, [sp, #72]             ; 16-byte Folded Reload
	add	x15, x12, x15
	add	x17, x17, x8, lsl #2
	cmp	x15, #1
	b.lt	LBB1_25
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x6, #0                          ; =0x0
	ldr	x1, [sp, #40]                   ; 8-byte Folded Reload
	b	LBB1_7
LBB1_6:                                 ;   in Loop: Header=BB1_7 Depth=2
	fmul	s18, s0, s18
	str	s18, [x17, x6, lsl #2]
	add	x6, x6, #1
	add	x1, x1, x16
	cmp	x6, x13
	b.eq	LBB1_25
LBB1_7:                                 ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_10 Depth 3
                                        ;       Child Loop BB1_17 Depth 3
                                        ;       Child Loop BB1_21 Depth 3
                                        ;       Child Loop BB1_23 Depth 3
	cmp	x10, #4
	b.hs	LBB1_9
; %bb.8:                                ;   in Loop: Header=BB1_7 Depth=2
	mov	x2, #0                          ; =0x0
	movi.2d	v18, #0000000000000000
	faddp.4s	v18, v18, v18
	faddp.2s	s18, v18
	subs	x24, x10, x2
	b.le	LBB1_6
	b	LBB1_12
LBB1_9:                                 ;   in Loop: Header=BB1_7 Depth=2
	movi.2d	v18, #0000000000000000
	mov	x8, x1
	mov	x2, x0
	mov	w7, #4                          ; =0x4
LBB1_10:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q19, [x2], #16
	ldr	q20, [x8], #16
	fmla.4s	v18, v20, v19
	add	x7, x7, #4
	cmp	x7, x10
	b.le	LBB1_10
; %bb.11:                               ;   in Loop: Header=BB1_7 Depth=2
	mov	x2, x14
	faddp.4s	v18, v18, v18
	faddp.2s	s18, v18
	subs	x24, x10, x14
	b.le	LBB1_6
LBB1_12:                                ;   in Loop: Header=BB1_7 Depth=2
	cmp	x24, #4
	b.hs	LBB1_14
; %bb.13:                               ;   in Loop: Header=BB1_7 Depth=2
	mov	x24, x2
	b	LBB1_23
LBB1_14:                                ;   in Loop: Header=BB1_7 Depth=2
	cmp	x24, #16
	b.hs	LBB1_16
; %bb.15:                               ;   in Loop: Header=BB1_7 Depth=2
	mov	x20, #0                         ; =0x0
	b	LBB1_20
LBB1_16:                                ;   in Loop: Header=BB1_7 Depth=2
	and	x20, x24, #0xfffffffffffffff0
	lsl	x7, x2, #2
	mov	x8, x20
LBB1_17:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x22, x0, x7
	ldp	q19, q20, [x22]
	ldp	q21, q22, [x22, #32]
	add	x22, x1, x7
	ldp	q23, q24, [x22]
	ldp	q25, q26, [x22, #32]
	fmul.4s	v19, v19, v23
	mov	s23, v19[3]
	mov	s27, v19[2]
	mov	s28, v19[1]
	fmul.4s	v20, v20, v24
	mov	s24, v20[3]
	mov	s29, v20[2]
	mov	s30, v20[1]
	fmul.4s	v21, v21, v25
	mov	s25, v21[3]
	mov	s31, v21[2]
	mov	s8, v21[1]
	fmul.4s	v22, v22, v26
	mov	s26, v22[3]
	mov	s9, v22[2]
	mov	s10, v22[1]
	fadd	s18, s18, s19
	fadd	s18, s18, s28
	fadd	s18, s18, s27
	fadd	s18, s18, s23
	fadd	s18, s18, s20
	fadd	s18, s18, s30
	fadd	s18, s18, s29
	fadd	s18, s18, s24
	fadd	s18, s18, s21
	fadd	s18, s18, s8
	fadd	s18, s18, s31
	fadd	s18, s18, s25
	fadd	s18, s18, s22
	fadd	s18, s18, s10
	fadd	s18, s18, s9
	fadd	s18, s18, s26
	add	x7, x7, #64
	subs	x8, x8, #16
	b.ne	LBB1_17
; %bb.18:                               ;   in Loop: Header=BB1_7 Depth=2
	cmp	x24, x20
	b.eq	LBB1_6
; %bb.19:                               ;   in Loop: Header=BB1_7 Depth=2
	tst	x24, #0xc
	b.eq	LBB1_24
LBB1_20:                                ;   in Loop: Header=BB1_7 Depth=2
	sub	x8, x24, x5
	add	x24, x2, x8
	add	x2, x20, x2
	ldr	x8, [sp, #152]                  ; 8-byte Folded Reload
	add	x8, x2, x8
	lsl	x2, x2, #2
LBB1_21:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q19, [x0, x2]
	ldr	q20, [x1, x2]
	fmul.4s	v19, v19, v20
	mov	s20, v19[3]
	mov	s21, v19[2]
	mov	s22, v19[1]
	fadd	s18, s18, s19
	fadd	s18, s18, s22
	fadd	s18, s18, s21
	fadd	s18, s18, s20
	add	x2, x2, #16
	adds	x8, x8, #4
	b.ne	LBB1_21
; %bb.22:                               ;   in Loop: Header=BB1_7 Depth=2
	cbz	x5, LBB1_6
LBB1_23:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s19, [x0, x24, lsl #2]
	ldr	s20, [x1, x24, lsl #2]
	fmadd	s18, s19, s20, s18
	add	x24, x24, #1
	cmp	x10, x24
	b.ne	LBB1_23
	b	LBB1_6
LBB1_24:                                ;   in Loop: Header=BB1_7 Depth=2
	add	x24, x2, x20
	b	LBB1_23
LBB1_25:                                ;   in Loop: Header=BB1_4 Depth=1
	cmp	x15, x9
	b.ge	LBB1_39
; %bb.26:                               ;   in Loop: Header=BB1_4 Depth=1
	mvn	x8, x12
	ldr	x1, [sp, #88]                   ; 8-byte Folded Reload
	add	x8, x1, x8
	mov	x2, x15
	cmp	x8, #3
	b.ls	LBB1_37
; %bb.27:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x8, #16
	b.hs	LBB1_29
; %bb.28:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x1, #0                          ; =0x0
	b	LBB1_33
LBB1_29:                                ;   in Loop: Header=BB1_4 Depth=1
	and	x2, x11, #0xfffffffffffffff0
	and	x1, x8, #0xfffffffffffffff0
	mov	x6, x21
LBB1_30:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	q1, q1, [x6, #-32]
	stp	q1, q1, [x6], #64
	subs	x2, x2, #16
	b.ne	LBB1_30
; %bb.31:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x8, x1
	b.eq	LBB1_39
; %bb.32:                               ;   in Loop: Header=BB1_4 Depth=1
	tst	x8, #0xc
	b.eq	LBB1_36
LBB1_33:                                ;   in Loop: Header=BB1_4 Depth=1
	and	x20, x11, #0xfffffffffffffffc
	and	x6, x8, #0xfffffffffffffffc
	add	x2, x15, x6
	add	x7, x23, x1, lsl #2
	sub	x1, x1, x20
LBB1_34:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	q1, [x7], #16
	adds	x1, x1, #4
	b.ne	LBB1_34
; %bb.35:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x8, x6
	b.ne	LBB1_37
	b	LBB1_39
LBB1_36:                                ;   in Loop: Header=BB1_4 Depth=1
	add	x2, x15, x1
LBB1_37:                                ;   in Loop: Header=BB1_4 Depth=1
	sub	x8, x9, x2
	add	x1, x3, x2, lsl #2
LBB1_38:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	w25, [x1], #4
	subs	x8, x8, #1
	b.ne	LBB1_38
LBB1_39:                                ;   in Loop: Header=BB1_4 Depth=1
	ld1r.4s	{ v18 }, [x17]
	cmp	x9, #4
	b.hs	LBB1_41
; %bb.40:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x8, #0                          ; =0x0
	fmaxv.4s	s18, v18
	cmp	x8, x9
	b.lt	LBB1_44
	b	LBB1_45
LBB1_41:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x8, x3
	mov	w1, #4                          ; =0x4
LBB1_42:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q19, [x8], #16
	fmax.4s	v18, v18, v19
	add	x1, x1, #4
	cmp	x1, x9
	b.le	LBB1_42
; %bb.43:                               ;   in Loop: Header=BB1_4 Depth=1
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	fmaxv.4s	s18, v18
	cmp	x8, x9
	b.ge	LBB1_45
LBB1_44:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s19, [x3, x8, lsl #2]
	fcmp	s19, s18
	fcsel	s18, s19, s18, gt
	add	x8, x8, #1
	cmp	x9, x8
	b.ne	LBB1_44
LBB1_45:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	w8, #43691                      ; =0xaaab
	movk	w8, #15914, lsl #16
	dup.4s	v19, w8
	fmov.4s	v20, #1.00000000
	cmp	x9, #4
	b.hs	LBB1_47
; %bb.46:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x8, #0                          ; =0x0
	movi.2d	v21, #0000000000000000
	b	LBB1_49
LBB1_47:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x1, #0                          ; =0x0
	dup.4s	v22, v18[0]
	movi.2d	v21, #0000000000000000
	mov	x2, x3
LBB1_48:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q23, [x2]
	fsub.4s	v23, v23, v22
	dup.4s	v24, w30
	fmax.4s	v23, v23, v24
	fmul.4s	v24, v23, v2
	frintn.4s	v24, v24
	fmul.4s	v25, v24, v3
	fadd.4s	v23, v23, v25
	fmul.4s	v25, v24, v4
	fadd.4s	v23, v23, v25
	mov.16b	v25, v6
	fmla.4s	v25, v5, v23
	mov.16b	v26, v7
	fmla.4s	v26, v23, v25
	mov.16b	v25, v19
	fmla.4s	v25, v23, v26
	movi.4s	v26, #63, lsl #24
	fmla.4s	v26, v23, v25
	mov.16b	v25, v20
	fmla.4s	v25, v23, v26
	mov.16b	v26, v20
	fmla.4s	v26, v23, v25
	fcvtns.4s	v23, v24
	shl.4s	v23, v23, #23
	add.4s	v23, v23, v20
	fmul.4s	v23, v26, v23
	str	q23, [x2], #16
	fadd.4s	v21, v21, v23
	add	x8, x1, #4
	add	x6, x1, #8
	mov	x1, x8
	cmp	x6, x9
	b.le	LBB1_48
LBB1_49:                                ;   in Loop: Header=BB1_4 Depth=1
	faddp.4s	v21, v21, v21
	faddp.2s	s21, v21
	cmp	x8, x9
	b.ge	LBB1_51
LBB1_50:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s22, [x3, x8, lsl #2]
	fsub	s22, s22, s18
	fmov	s23, w30
	fcmp	s22, s23
	fcsel	s22, s23, s22, mi
	dup.4s	v23, v22[0]
	fmul.4s	v22, v2, v22[0]
	frintn.4s	v22, v22
	fmul.4s	v24, v22, v3
	fadd.4s	v23, v23, v24
	fmul.4s	v24, v22, v4
	fadd.4s	v23, v23, v24
	mov.16b	v24, v6
	fmla.4s	v24, v5, v23
	mov.16b	v25, v7
	fmla.4s	v25, v23, v24
	mov.16b	v24, v19
	fmla.4s	v24, v23, v25
	movi.4s	v25, #63, lsl #24
	fmla.4s	v25, v23, v24
	mov.16b	v24, v20
	fmla.4s	v24, v23, v25
	mov.16b	v25, v20
	fmla.4s	v25, v23, v24
	fcvtns.4s	v22, v22
	shl.4s	v22, v22, #23
	add.4s	v22, v22, v20
	fmul.4s	v22, v25, v22
	str	s22, [x3, x8, lsl #2]
	fadd	s21, s21, s22
	add	x8, x8, #1
	cmp	x9, x8
	b.ne	LBB1_50
LBB1_51:                                ;   in Loop: Header=BB1_4 Depth=1
	fdiv	s18, s16, s21
	cmp	x9, #4
	b.hs	LBB1_53
; %bb.52:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x8, #0                          ; =0x0
	b	LBB1_55
LBB1_53:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x2, #0                          ; =0x0
	mov	x1, x3
LBB1_54:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q19, [x1]
	fmul.4s	v19, v19, v18[0]
	str	q19, [x1], #16
	add	x8, x2, #4
	add	x6, x2, #8
	mov	x2, x8
	cmp	x6, x9
	b.le	LBB1_54
LBB1_55:                                ;   in Loop: Header=BB1_4 Depth=1
	subs	x1, x9, x8
	b.le	LBB1_68
; %bb.56:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x1, #3
	b.hi	LBB1_58
; %bb.57:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x1, x8
	b	LBB1_67
LBB1_58:                                ;   in Loop: Header=BB1_4 Depth=1
	cmp	x1, #16
	b.hs	LBB1_60
; %bb.59:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x2, #0                          ; =0x0
	b	LBB1_64
LBB1_60:                                ;   in Loop: Header=BB1_4 Depth=1
	and	x2, x1, #0xfffffffffffffff0
	add	x6, x3, x8, lsl #2
	mov	x7, x2
LBB1_61:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q19, q20, [x6]
	ldp	q21, q22, [x6, #32]
	fmul.4s	v19, v19, v18[0]
	fmul.4s	v20, v20, v18[0]
	fmul.4s	v21, v21, v18[0]
	fmul.4s	v22, v22, v18[0]
	stp	q19, q20, [x6]
	stp	q21, q22, [x6, #32]
	add	x6, x6, #64
	subs	x7, x7, #16
	b.ne	LBB1_61
; %bb.62:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x1, x2
	b.eq	LBB1_68
; %bb.63:                               ;   in Loop: Header=BB1_4 Depth=1
	tst	x1, #0xc
	b.eq	LBB1_109
LBB1_64:                                ;   in Loop: Header=BB1_4 Depth=1
	ldp	x7, x6, [sp, #8]                ; 16-byte Folded Reload
	sub	x1, x1, x6
	add	x1, x8, x1
	lsl	x6, x2, #2
	add	x6, x6, x8, lsl #2
	add	x2, x7, x2
	add	x8, x2, x8
LBB1_65:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q19, [x3, x6]
	fmul.4s	v19, v19, v18[0]
	str	q19, [x3, x6]
	add	x6, x6, #16
	adds	x8, x8, #4
	b.ne	LBB1_65
; %bb.66:                               ;   in Loop: Header=BB1_4 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	cbz	x8, LBB1_68
LBB1_67:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s19, [x3, x1, lsl #2]
	fmul	s19, s18, s19
	str	s19, [x3, x1, lsl #2]
	add	x1, x1, #1
	cmp	x9, x1
	b.ne	LBB1_67
LBB1_68:                                ;   in Loop: Header=BB1_4 Depth=1
	cmp	x10, #4
	b.hs	LBB1_70
; %bb.69:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x8, #0                          ; =0x0
	b	LBB1_72
LBB1_70:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x2, #0                          ; =0x0
	mov	x1, x4
LBB1_71:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	xzr, xzr, [x1], #16
	add	x8, x2, #4
	add	x6, x2, #8
	mov	x2, x8
	cmp	x6, x10
	b.le	LBB1_71
LBB1_72:                                ;   in Loop: Header=BB1_4 Depth=1
	subs	x1, x10, x8
	b.le	LBB1_85
; %bb.73:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x1, #3
	b.hi	LBB1_75
; %bb.74:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x1, x8
	b	LBB1_84
LBB1_75:                                ;   in Loop: Header=BB1_4 Depth=1
	cmp	x1, #16
	b.hs	LBB1_77
; %bb.76:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x2, #0                          ; =0x0
	b	LBB1_81
LBB1_77:                                ;   in Loop: Header=BB1_4 Depth=1
	and	x2, x1, #0xfffffffffffffff0
	add	x6, x4, x8, lsl #2
	mov	x7, x2
LBB1_78:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	q17, q17, [x6]
	stp	q17, q17, [x6, #32]
	add	x6, x6, #64
	subs	x7, x7, #16
	b.ne	LBB1_78
; %bb.79:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x1, x2
	b.eq	LBB1_85
; %bb.80:                               ;   in Loop: Header=BB1_4 Depth=1
	tst	x1, #0xc
	b.eq	LBB1_110
LBB1_81:                                ;   in Loop: Header=BB1_4 Depth=1
	sub	x1, x1, x5
	add	x1, x8, x1
	lsl	x6, x2, #2
	add	x6, x6, x8, lsl #2
	ldr	x7, [sp, #152]                  ; 8-byte Folded Reload
	add	x2, x7, x2
	add	x8, x2, x8
LBB1_82:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x2, x4, x6
	stp	xzr, xzr, [x2]
	add	x6, x6, #16
	adds	x8, x8, #4
	b.ne	LBB1_82
; %bb.83:                               ;   in Loop: Header=BB1_4 Depth=1
	cbz	x5, LBB1_85
LBB1_84:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	wzr, [x4, x1, lsl #2]
	add	x1, x1, #1
	cmp	x10, x1
	b.ne	LBB1_84
LBB1_85:                                ;   in Loop: Header=BB1_4 Depth=1
	cmp	x15, #1
	b.lt	LBB1_3
; %bb.86:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x15, #0                         ; =0x0
	mul	x8, x16, x12
	ldr	x1, [sp, #48]                   ; 8-byte Folded Reload
	add	x1, x1, x8
	ldr	x2, [sp, #32]                   ; 8-byte Folded Reload
	add	x6, x2, x8
	ldr	x2, [sp, #104]                  ; 8-byte Folded Reload
	b	LBB1_88
LBB1_87:                                ;   in Loop: Header=BB1_88 Depth=2
	add	x15, x15, #1
	add	x2, x2, x16
	cmp	x15, x13
	b.eq	LBB1_3
LBB1_88:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_92 Depth 3
                                        ;       Child Loop BB1_102 Depth 3
                                        ;       Child Loop BB1_106 Depth 3
                                        ;       Child Loop BB1_98 Depth 3
	ldr	s18, [x17, x15, lsl #2]
	fcmp	s18, #0.0
	b.eq	LBB1_87
; %bb.89:                               ;   in Loop: Header=BB1_88 Depth=2
	cmp	x10, #4
	b.hs	LBB1_91
; %bb.90:                               ;   in Loop: Header=BB1_88 Depth=2
	mov	x24, #0                         ; =0x0
	b	LBB1_93
LBB1_91:                                ;   in Loop: Header=BB1_88 Depth=2
	mov	x8, #0                          ; =0x0
	mov	x7, #0                          ; =0x0
LBB1_92:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_88 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q19, [x4, x8]
	ldr	q20, [x2, x8]
	fmla.4s	v19, v20, v18[0]
	str	q19, [x4, x8]
	add	x24, x7, #4
	add	x8, x8, #16
	add	x19, x7, #8
	mov	x7, x24
	cmp	x19, x10
	b.le	LBB1_92
LBB1_93:                                ;   in Loop: Header=BB1_88 Depth=2
	subs	x8, x10, x24
	b.le	LBB1_87
; %bb.94:                               ;   in Loop: Header=BB1_88 Depth=2
	cmp	x8, #3
	b.ls	LBB1_97
; %bb.95:                               ;   in Loop: Header=BB1_88 Depth=2
	mul	x7, x16, x15
	ldr	x19, [sp, #96]                  ; 8-byte Folded Reload
	add	x22, x19, x7
	lsl	x20, x24, #2
	add	x19, x1, x20
	cmp	x19, x22
	b.hs	LBB1_99
; %bb.96:                               ;   in Loop: Header=BB1_88 Depth=2
	ldr	x19, [sp, #104]                 ; 8-byte Folded Reload
	add	x7, x19, x7
	add	x7, x7, x20
	cmp	x7, x6
	b.hs	LBB1_99
LBB1_97:                                ;   in Loop: Header=BB1_88 Depth=2
	mov	x8, x24
LBB1_98:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_88 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s19, [x2, x8, lsl #2]
	ldr	s20, [x4, x8, lsl #2]
	fmadd	s19, s18, s19, s20
	str	s19, [x4, x8, lsl #2]
	add	x8, x8, #1
	cmp	x10, x8
	b.ne	LBB1_98
	b	LBB1_87
LBB1_99:                                ;   in Loop: Header=BB1_88 Depth=2
	cmp	x8, #16
	b.hs	LBB1_101
; %bb.100:                              ;   in Loop: Header=BB1_88 Depth=2
	mov	x22, #0                         ; =0x0
	b	LBB1_105
LBB1_101:                               ;   in Loop: Header=BB1_88 Depth=2
	and	x22, x8, #0xfffffffffffffff0
	mov	x7, x22
LBB1_102:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_88 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x19, x2, x20
	ldp	q19, q20, [x19]
	ldp	q21, q22, [x19, #32]
	add	x19, x4, x20
	ldp	q23, q24, [x19]
	ldp	q25, q26, [x19, #32]
	fmla.4s	v23, v19, v18[0]
	fmla.4s	v24, v20, v18[0]
	fmla.4s	v25, v21, v18[0]
	fmla.4s	v26, v22, v18[0]
	stp	q23, q24, [x19]
	stp	q25, q26, [x19, #32]
	add	x20, x20, #64
	subs	x7, x7, #16
	b.ne	LBB1_102
; %bb.103:                              ;   in Loop: Header=BB1_88 Depth=2
	cmp	x8, x22
	b.eq	LBB1_87
; %bb.104:                              ;   in Loop: Header=BB1_88 Depth=2
	tst	x8, #0xc
	b.eq	LBB1_108
LBB1_105:                               ;   in Loop: Header=BB1_88 Depth=2
	sub	x8, x8, x5
	add	x8, x24, x8
	add	x19, x22, x24
	ldr	x7, [sp, #152]                  ; 8-byte Folded Reload
	add	x7, x19, x7
	lsl	x20, x19, #2
LBB1_106:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_88 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q19, [x2, x20]
	ldr	q20, [x4, x20]
	fmla.4s	v20, v19, v18[0]
	str	q20, [x4, x20]
	add	x20, x20, #16
	adds	x7, x7, #4
	b.ne	LBB1_106
; %bb.107:                              ;   in Loop: Header=BB1_88 Depth=2
	cbnz	x5, LBB1_98
	b	LBB1_87
LBB1_108:                               ;   in Loop: Header=BB1_88 Depth=2
	add	x8, x24, x22
	b	LBB1_98
LBB1_109:                               ;   in Loop: Header=BB1_4 Depth=1
	add	x1, x8, x2
	b	LBB1_67
LBB1_110:                               ;   in Loop: Header=BB1_4 Depth=1
	add	x1, x8, x2
	b	LBB1_84
                                        ; -- End function
	.globl	_sdpa_neon_f64                  ; -- Begin function sdpa_neon_f64
	.p2align	2
_sdpa_neon_f64:                         ; @sdpa_neon_f64
; %bb.0:
	sub	sp, sp, #128
	stp	x25, x5, [sp, #48]              ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	ldp	x8, x9, [x6]
	ldr	x10, [x6, #16]
	stp	x8, x1, [sp, #32]               ; 16-byte Folded Spill
	cmp	x8, #1
	ccmp	x9, #1, #8, ge
	ccmp	x10, #1, #8, ge
	b.ge	LBB2_2
LBB2_1:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldr	x25, [sp, #48]                  ; 8-byte Folded Reload
	add	sp, sp, #128
	ret
LBB2_2:
	mov	x11, #0                         ; =0x0
	ldr	d0, [x7]
	and	x12, x10, #0x7ffffffffffffffe
	and	x8, x9, #0x7ffffffffffffffe
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	lsl	x14, x10, #3
	ldr	x7, [sp, #56]                   ; 8-byte Folded Reload
	add	x8, x7, x14
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	add	x5, x2, x14
	lsl	x8, x9, #3
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	mov	x8, #33534                      ; =0x82fe
	movk	x8, #25899, lsl #16
	movk	x8, #5447, lsl #32
	movk	x8, #16375, lsl #48
	dup.2d	v1, x8
	mov	x6, #18874                      ; =0x49ba
	movk	x6, #524, lsl #16
	movk	x6, #9003, lsl #32
	movk	x6, #49286, lsl #48
	mov	x8, #4276092928                 ; =0xfee00000
	movk	x8, #11842, lsl #32
	movk	x8, #49126, lsl #48
	dup.2d	v2, x8
	mov	x8, #15478                      ; =0x3c76
	movk	x8, #13689, lsl #16
	movk	x8, #14831, lsl #32
	movk	x8, #48618, lsl #48
	dup.2d	v3, x8
	mov	x8, #40986                      ; =0xa01a
	movk	x8, #6657, lsl #16
	movk	x8, #416, lsl #32
	movk	x8, #16122, lsl #48
	dup.2d	v4, x8
	mov	x8, #40986                      ; =0xa01a
	movk	x8, #6657, lsl #16
	movk	x8, #416, lsl #32
	movk	x8, #16170, lsl #48
	dup.2d	v5, x8
	mov	x8, #27671                      ; =0x6c17
	movk	x8, #5825, lsl #16
	movk	x8, #49516, lsl #32
	movk	x8, #16214, lsl #48
	dup.2d	v6, x8
	mov	x8, #1229782938247303441        ; =0x1111111111111111
	movk	x8, #16257, lsl #48
	dup.2d	v7, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16293, lsl #48
	dup.2d	v16, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16325, lsl #48
	dup.2d	v17, x8
	fmov.2d	v18, #0.50000000
	fmov.2d	v19, #1.00000000
	fmov	d20, #1.00000000
	movi.2d	v21, #0000000000000000
	mov	x19, x4
	b	LBB2_4
LBB2_3:                                 ;   in Loop: Header=BB2_4 Depth=1
	add	x11, x11, #1
	add	x0, x0, x14
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x19, x19, x8
	add	x7, x7, x14
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	cmp	x11, x8
	b.eq	LBB2_1
LBB2_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_6 Depth 2
                                        ;       Child Loop BB2_9 Depth 3
                                        ;       Child Loop BB2_14 Depth 3
                                        ;       Child Loop BB2_16 Depth 3
                                        ;     Child Loop BB2_22 Depth 2
                                        ;     Child Loop BB2_24 Depth 2
                                        ;     Child Loop BB2_28 Depth 2
                                        ;     Child Loop BB2_30 Depth 2
                                        ;     Child Loop BB2_34 Depth 2
                                        ;     Child Loop BB2_39 Depth 2
                                        ;     Child Loop BB2_41 Depth 2
                                        ;     Child Loop BB2_45 Depth 2
                                        ;     Child Loop BB2_50 Depth 2
                                        ;     Child Loop BB2_52 Depth 2
                                        ;     Child Loop BB2_55 Depth 2
                                        ;       Child Loop BB2_59 Depth 3
                                        ;       Child Loop BB2_65 Depth 3
                                        ;       Child Loop BB2_67 Depth 3
	mov	x22, #0                         ; =0x0
	mul	x8, x14, x11
	ldr	x13, [sp, #56]                  ; 8-byte Folded Reload
	add	x20, x13, x8
	ldr	x13, [sp, #24]                  ; 8-byte Folded Reload
	add	x21, x13, x8
	mul	x23, x11, x9
	lsl	x8, x23, #3
	add	x24, x3, x8
	add	x25, x4, x8
	ldr	x30, [sp, #40]                  ; 8-byte Folded Reload
	b	LBB2_6
LBB2_5:                                 ;   in Loop: Header=BB2_6 Depth=2
	str	d22, [x25, x22, lsl #3]
	add	x22, x22, #1
	add	x30, x30, x14
	cmp	x22, x9
	b.eq	LBB2_19
LBB2_6:                                 ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_9 Depth 3
                                        ;       Child Loop BB2_14 Depth 3
                                        ;       Child Loop BB2_16 Depth 3
	cmp	x10, #2
	b.hs	LBB2_8
; %bb.7:                                ;   in Loop: Header=BB2_6 Depth=2
	mov	x8, #0                          ; =0x0
	movi.2d	v22, #0000000000000000
	faddp.2d	d22, v22
	subs	x15, x10, x8
	b.gt	LBB2_11
	b	LBB2_17
LBB2_8:                                 ;   in Loop: Header=BB2_6 Depth=2
	movi.2d	v22, #0000000000000000
	mov	x8, x30
	mov	x13, x0
	mov	w15, #2                         ; =0x2
LBB2_9:                                 ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q23, [x13], #16
	ldr	q24, [x8], #16
	fmla.2d	v22, v24, v23
	add	x15, x15, #2
	cmp	x15, x10
	b.le	LBB2_9
; %bb.10:                               ;   in Loop: Header=BB2_6 Depth=2
	mov	x8, x12
	faddp.2d	d22, v22
	subs	x15, x10, x12
	b.le	LBB2_17
LBB2_11:                                ;   in Loop: Header=BB2_6 Depth=2
	cmp	x15, #8
	b.hs	LBB2_13
; %bb.12:                               ;   in Loop: Header=BB2_6 Depth=2
	mov	x13, x8
	b	LBB2_16
LBB2_13:                                ;   in Loop: Header=BB2_6 Depth=2
	and	x1, x15, #0xfffffffffffffff8
	add	x13, x8, x1
	lsl	x8, x8, #3
	mov	x17, x1
LBB2_14:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x16, x0, x8
	ldp	q23, q24, [x16]
	ldp	q25, q26, [x16, #32]
	add	x16, x30, x8
	ldp	q27, q28, [x16]
	ldp	q29, q30, [x16, #32]
	fmul.2d	v23, v23, v27
	mov	d27, v23[1]
	fmul.2d	v24, v24, v28
	mov	d28, v24[1]
	fmul.2d	v25, v25, v29
	mov	d29, v25[1]
	fmul.2d	v26, v26, v30
	mov	d30, v26[1]
	fadd	d22, d22, d23
	fadd	d22, d22, d27
	fadd	d22, d22, d24
	fadd	d22, d22, d28
	fadd	d22, d22, d25
	fadd	d22, d22, d29
	fadd	d22, d22, d26
	fadd	d22, d22, d30
	add	x8, x8, #64
	subs	x17, x17, #8
	b.ne	LBB2_14
; %bb.15:                               ;   in Loop: Header=BB2_6 Depth=2
	cmp	x15, x1
	b.eq	LBB2_17
LBB2_16:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d23, [x0, x13, lsl #3]
	ldr	d24, [x30, x13, lsl #3]
	fmadd	d22, d23, d24, d22
	add	x13, x13, #1
	cmp	x10, x13
	b.ne	LBB2_16
LBB2_17:                                ;   in Loop: Header=BB2_6 Depth=2
	fmul	d22, d0, d22
	cbz	x3, LBB2_5
; %bb.18:                               ;   in Loop: Header=BB2_6 Depth=2
	ldr	d23, [x24, x22, lsl #3]
	fadd	d22, d22, d23
	b	LBB2_5
LBB2_19:                                ;   in Loop: Header=BB2_4 Depth=1
	add	x22, x4, x23, lsl #3
	ld1r.2d	{ v22 }, [x22]
	cmp	x9, #2
	b.hs	LBB2_21
; %bb.20:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x8, #0                          ; =0x0
	fmaxp.2d	d22, v22
	cmp	x8, x9
	b.lt	LBB2_24
	b	LBB2_25
LBB2_21:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x8, x19
	mov	w13, #2                         ; =0x2
LBB2_22:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q23, [x8], #16
	fmax.2d	v22, v22, v23
	add	x13, x13, #2
	cmp	x13, x9
	b.le	LBB2_22
; %bb.23:                               ;   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	fmaxp.2d	d22, v22
	cmp	x8, x9
	b.ge	LBB2_25
LBB2_24:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d23, [x19, x8, lsl #3]
	fcmp	d23, d22
	fcsel	d22, d23, d22, gt
	add	x8, x8, #1
	cmp	x9, x8
	b.ne	LBB2_24
LBB2_25:                                ;   in Loop: Header=BB2_4 Depth=1
	cmp	x9, #2
	b.hs	LBB2_27
; %bb.26:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x13, #0                         ; =0x0
	movi.2d	v23, #0000000000000000
	b	LBB2_29
LBB2_27:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x15, #0                         ; =0x0
	dup.2d	v24, v22[0]
	movi.2d	v23, #0000000000000000
	mov	x17, x19
LBB2_28:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q25, [x17]
	dup.2d	v26, x6
	fsub.2d	v25, v25, v24
	fmax.2d	v25, v25, v26
	fmul.2d	v26, v25, v1
	frintn.2d	v26, v26
	fmul.2d	v27, v26, v2
	fadd.2d	v25, v25, v27
	fmul.2d	v27, v26, v3
	fadd.2d	v25, v25, v27
	mov.16b	v27, v5
	fmla.2d	v27, v4, v25
	mov.16b	v28, v6
	fmla.2d	v28, v25, v27
	mov.16b	v27, v7
	fmla.2d	v27, v25, v28
	mov.16b	v28, v16
	fmla.2d	v28, v25, v27
	mov.16b	v27, v17
	fmla.2d	v27, v25, v28
	mov.16b	v28, v18
	fmla.2d	v28, v25, v27
	mov.16b	v27, v19
	fmla.2d	v27, v25, v28
	mov.16b	v28, v19
	fmla.2d	v28, v25, v27
	fcvtzs.2d	v25, v26
	shl.2d	v25, v25, #52
	add.2d	v25, v25, v19
	fmul.2d	v25, v28, v25
	str	q25, [x17], #16
	fadd.2d	v23, v23, v25
	add	x13, x15, #2
	add	x8, x15, #4
	mov	x15, x13
	cmp	x8, x9
	b.le	LBB2_28
LBB2_29:                                ;   in Loop: Header=BB2_4 Depth=1
	faddp.2d	d23, v23
	cmp	x13, x9
	b.ge	LBB2_31
LBB2_30:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d24, [x19, x13, lsl #3]
	fsub	d24, d24, d22
	fmov	d25, x6
	fcmp	d24, d25
	fcsel	d24, d25, d24, mi
	dup.2d	v25, v24[0]
	fmul.2d	v24, v1, v24[0]
	frintn.2d	v24, v24
	fmul.2d	v26, v24, v2
	fadd.2d	v25, v25, v26
	fmul.2d	v26, v24, v3
	fadd.2d	v25, v25, v26
	mov.16b	v26, v5
	fmla.2d	v26, v4, v25
	mov.16b	v27, v6
	fmla.2d	v27, v25, v26
	mov.16b	v26, v7
	fmla.2d	v26, v25, v27
	mov.16b	v27, v16
	fmla.2d	v27, v25, v26
	mov.16b	v26, v17
	fmla.2d	v26, v25, v27
	mov.16b	v27, v18
	fmla.2d	v27, v25, v26
	mov.16b	v26, v19
	fmla.2d	v26, v25, v27
	mov.16b	v27, v19
	fmla.2d	v27, v25, v26
	fcvtzs.2d	v24, v24
	shl.2d	v24, v24, #52
	add.2d	v24, v24, v19
	fmul.2d	v24, v27, v24
	str	d24, [x19, x13, lsl #3]
	fadd	d23, d23, d24
	add	x13, x13, #1
	cmp	x9, x13
	b.ne	LBB2_30
LBB2_31:                                ;   in Loop: Header=BB2_4 Depth=1
	fdiv	d22, d20, d23
	cmp	x9, #2
	b.hs	LBB2_33
; %bb.32:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x17, #0                         ; =0x0
	b	LBB2_35
LBB2_33:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x13, #0                         ; =0x0
	mov	x8, x19
LBB2_34:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q23, [x8]
	fmul.2d	v23, v23, v22[0]
	str	q23, [x8], #16
	add	x17, x13, #2
	add	x15, x13, #4
	mov	x13, x17
	cmp	x15, x9
	b.le	LBB2_34
LBB2_35:                                ;   in Loop: Header=BB2_4 Depth=1
	subs	x8, x9, x17
	b.le	LBB2_42
; %bb.36:                               ;   in Loop: Header=BB2_4 Depth=1
	cmp	x8, #8
	b.hs	LBB2_38
; %bb.37:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x13, x17
	b	LBB2_41
LBB2_38:                                ;   in Loop: Header=BB2_4 Depth=1
	and	x15, x8, #0xfffffffffffffff8
	add	x13, x17, x15
	add	x17, x19, x17, lsl #3
	mov	x1, x15
LBB2_39:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q23, q24, [x17]
	ldp	q25, q26, [x17, #32]
	fmul.2d	v23, v23, v22[0]
	fmul.2d	v24, v24, v22[0]
	fmul.2d	v25, v25, v22[0]
	fmul.2d	v26, v26, v22[0]
	stp	q23, q24, [x17]
	stp	q25, q26, [x17, #32]
	add	x17, x17, #64
	subs	x1, x1, #8
	b.ne	LBB2_39
; %bb.40:                               ;   in Loop: Header=BB2_4 Depth=1
	cmp	x8, x15
	b.eq	LBB2_42
LBB2_41:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d23, [x19, x13, lsl #3]
	fmul	d23, d22, d23
	str	d23, [x19, x13, lsl #3]
	add	x13, x13, #1
	cmp	x9, x13
	b.ne	LBB2_41
LBB2_42:                                ;   in Loop: Header=BB2_4 Depth=1
	cmp	x10, #2
	b.hs	LBB2_44
; %bb.43:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x15, #0                         ; =0x0
	b	LBB2_46
LBB2_44:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x13, #0                         ; =0x0
	mov	x8, x7
LBB2_45:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	xzr, xzr, [x8], #16
	add	x15, x13, #2
	add	x16, x13, #4
	mov	x13, x15
	cmp	x16, x10
	b.le	LBB2_45
LBB2_46:                                ;   in Loop: Header=BB2_4 Depth=1
	subs	x13, x10, x15
	b.le	LBB2_53
; %bb.47:                               ;   in Loop: Header=BB2_4 Depth=1
	cmp	x13, #8
	b.hs	LBB2_49
; %bb.48:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x8, x15
	b	LBB2_52
LBB2_49:                                ;   in Loop: Header=BB2_4 Depth=1
	and	x17, x13, #0xfffffffffffffff8
	add	x8, x15, x17
	add	x15, x7, x15, lsl #3
	mov	x1, x17
LBB2_50:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	q21, q21, [x15]
	stp	q21, q21, [x15, #32]
	add	x15, x15, #64
	subs	x1, x1, #8
	b.ne	LBB2_50
; %bb.51:                               ;   in Loop: Header=BB2_4 Depth=1
	cmp	x13, x17
	b.eq	LBB2_53
LBB2_52:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	xzr, [x7, x8, lsl #3]
	add	x8, x8, #1
	cmp	x10, x8
	b.ne	LBB2_52
LBB2_53:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x23, #0                         ; =0x0
	mov	x24, x2
	b	LBB2_55
LBB2_54:                                ;   in Loop: Header=BB2_55 Depth=2
	add	x23, x23, #1
	add	x24, x24, x14
	cmp	x23, x9
	b.eq	LBB2_3
LBB2_55:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_59 Depth 3
                                        ;       Child Loop BB2_65 Depth 3
                                        ;       Child Loop BB2_67 Depth 3
	ldr	d22, [x22, x23, lsl #3]
	fcmp	d22, #0.0
	b.eq	LBB2_54
; %bb.56:                               ;   in Loop: Header=BB2_55 Depth=2
	cmp	x10, #2
	b.hs	LBB2_58
; %bb.57:                               ;   in Loop: Header=BB2_55 Depth=2
	mov	x25, #0                         ; =0x0
	b	LBB2_60
LBB2_58:                                ;   in Loop: Header=BB2_55 Depth=2
	mov	x8, #0                          ; =0x0
	mov	x13, #0                         ; =0x0
LBB2_59:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_55 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q23, [x7, x8]
	ldr	q24, [x24, x8]
	fmla.2d	v23, v24, v22[0]
	str	q23, [x7, x8]
	add	x25, x13, #2
	add	x8, x8, #16
	add	x15, x13, #4
	mov	x13, x25
	cmp	x15, x10
	b.le	LBB2_59
LBB2_60:                                ;   in Loop: Header=BB2_55 Depth=2
	subs	x13, x10, x25
	b.le	LBB2_54
; %bb.61:                               ;   in Loop: Header=BB2_55 Depth=2
	cmp	x13, #8
	b.lo	LBB2_67
; %bb.62:                               ;   in Loop: Header=BB2_55 Depth=2
	mul	x8, x14, x23
	add	x16, x5, x8
	lsl	x15, x25, #3
	add	x17, x20, x15
	cmp	x17, x16
	b.hs	LBB2_64
; %bb.63:                               ;   in Loop: Header=BB2_55 Depth=2
	add	x8, x2, x8
	add	x8, x8, x15
	cmp	x8, x21
	b.lo	LBB2_67
LBB2_64:                                ;   in Loop: Header=BB2_55 Depth=2
	and	x8, x13, #0xfffffffffffffff8
	add	x25, x25, x8
	mov	x17, x8
LBB2_65:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_55 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x16, x24, x15
	ldp	q23, q24, [x16]
	ldp	q25, q26, [x16, #32]
	add	x16, x7, x15
	ldp	q27, q28, [x16]
	ldp	q29, q30, [x16, #32]
	fmla.2d	v27, v23, v22[0]
	fmla.2d	v28, v24, v22[0]
	fmla.2d	v29, v25, v22[0]
	fmla.2d	v30, v26, v22[0]
	stp	q27, q28, [x16]
	stp	q29, q30, [x16, #32]
	add	x15, x15, #64
	subs	x17, x17, #8
	b.ne	LBB2_65
; %bb.66:                               ;   in Loop: Header=BB2_55 Depth=2
	cmp	x13, x8
	b.eq	LBB2_54
LBB2_67:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_55 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d23, [x24, x25, lsl #3]
	ldr	d24, [x7, x25, lsl #3]
	fmadd	d23, d22, d23, d24
	str	d23, [x7, x25, lsl #3]
	add	x25, x25, #1
	cmp	x10, x25
	b.ne	LBB2_67
	b	LBB2_54
                                        ; -- End function
	.globl	_sdpa_causal_neon_f64           ; -- Begin function sdpa_causal_neon_f64
	.p2align	2
_sdpa_causal_neon_f64:                  ; @sdpa_causal_neon_f64
; %bb.0:
	sub	sp, sp, #144
	stp	x3, x25, [sp, #56]              ; 16-byte Folded Spill
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	stp	x1, x4, [sp, #16]               ; 16-byte Folded Spill
	ldp	x8, x9, [x5]
	ldr	x10, [x5, #16]
	str	x8, [sp, #72]                   ; 8-byte Folded Spill
	subs	x11, x8, #1
	ccmp	x9, #1, #8, ge
	ccmp	x10, #1, #8, ge
	b.ge	LBB3_2
LBB3_1:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldr	x25, [sp, #64]                  ; 8-byte Folded Reload
	add	sp, sp, #144
	ret
LBB3_2:
	mov	x17, x2
	mov	x12, #0                         ; =0x0
	ldr	d0, [x6]
	ldr	x13, [sp, #72]                  ; 8-byte Folded Reload
	sub	x8, x9, x13
	add	x24, x8, #1
	and	x14, x10, #0x7ffffffffffffffe
	and	x8, x9, #0x7ffffffffffffffe
	str	x8, [sp]                        ; 8-byte Folded Spill
	lsl	x16, x10, #3
	ldr	x22, [sp, #24]                  ; 8-byte Folded Reload
	add	x8, x22, x16
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	add	x5, x2, x16
	lsl	x15, x9, #3
	sub	x8, x15, x13, lsl #3
	ldr	x23, [sp, #56]                  ; 8-byte Folded Reload
	add	x8, x8, x23
	add	x7, x8, #40
	add	x8, x15, #8
	stp	x8, x15, [sp, #32]              ; 16-byte Folded Spill
	mov	x20, #-4503599627370496         ; =0xfff0000000000000
	dup.2d	v1, x20
	mov	x21, #18874                     ; =0x49ba
	movk	x21, #524, lsl #16
	movk	x21, #9003, lsl #32
	movk	x21, #49286, lsl #48
	mov	x8, #33534                      ; =0x82fe
	movk	x8, #25899, lsl #16
	movk	x8, #5447, lsl #32
	movk	x8, #16375, lsl #48
	dup.2d	v2, x8
	mov	x8, #4276092928                 ; =0xfee00000
	movk	x8, #11842, lsl #32
	movk	x8, #49126, lsl #48
	dup.2d	v3, x8
	mov	x8, #15478                      ; =0x3c76
	movk	x8, #13689, lsl #16
	movk	x8, #14831, lsl #32
	movk	x8, #48618, lsl #48
	dup.2d	v4, x8
	mov	x8, #40986                      ; =0xa01a
	movk	x8, #6657, lsl #16
	movk	x8, #416, lsl #32
	movk	x8, #16122, lsl #48
	dup.2d	v5, x8
	mov	x8, #40986                      ; =0xa01a
	movk	x8, #6657, lsl #16
	movk	x8, #416, lsl #32
	movk	x8, #16170, lsl #48
	dup.2d	v6, x8
	mov	x8, #27671                      ; =0x6c17
	movk	x8, #5825, lsl #16
	movk	x8, #49516, lsl #32
	movk	x8, #16214, lsl #48
	dup.2d	v7, x8
	mov	x8, #1229782938247303441        ; =0x1111111111111111
	movk	x8, #16257, lsl #48
	dup.2d	v16, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16293, lsl #48
	dup.2d	v17, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16325, lsl #48
	dup.2d	v18, x8
	fmov.2d	v19, #0.50000000
	fmov	d20, #1.00000000
	movi.2d	v21, #0000000000000000
	str	x24, [sp, #48]                  ; 8-byte Folded Spill
	b	LBB3_4
LBB3_3:                                 ;   in Loop: Header=BB3_4 Depth=1
	add	x12, x12, #1
	add	x24, x24, #1
	add	x0, x0, x16
	sub	x11, x11, #1
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	add	x7, x7, x8
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x23, x23, x8
	add	x22, x22, x16
	ldr	x8, [sp, #72]                   ; 8-byte Folded Reload
	cmp	x12, x8
	b.eq	LBB3_1
LBB3_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_7 Depth 2
                                        ;       Child Loop BB3_10 Depth 3
                                        ;       Child Loop BB3_15 Depth 3
                                        ;       Child Loop BB3_17 Depth 3
                                        ;     Child Loop BB3_21 Depth 2
                                        ;     Child Loop BB3_24 Depth 2
                                        ;     Child Loop BB3_28 Depth 2
                                        ;     Child Loop BB3_30 Depth 2
                                        ;     Child Loop BB3_34 Depth 2
                                        ;     Child Loop BB3_36 Depth 2
                                        ;     Child Loop BB3_40 Depth 2
                                        ;     Child Loop BB3_45 Depth 2
                                        ;     Child Loop BB3_47 Depth 2
                                        ;     Child Loop BB3_51 Depth 2
                                        ;     Child Loop BB3_56 Depth 2
                                        ;     Child Loop BB3_58 Depth 2
                                        ;     Child Loop BB3_62 Depth 2
                                        ;       Child Loop BB3_66 Depth 3
                                        ;       Child Loop BB3_72 Depth 3
                                        ;       Child Loop BB3_74 Depth 3
	mul	x8, x12, x9
	ldp	x15, x13, [sp, #48]             ; 16-byte Folded Reload
	add	x30, x12, x15
	add	x25, x13, x8, lsl #3
	cmp	x30, #1
	b.lt	LBB3_18
; %bb.5:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x15, #0                         ; =0x0
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	b	LBB3_7
LBB3_6:                                 ;   in Loop: Header=BB3_7 Depth=2
	fmul	d22, d0, d22
	str	d22, [x25, x15, lsl #3]
	add	x15, x15, #1
	add	x1, x1, x16
	cmp	x15, x24
	b.eq	LBB3_18
LBB3_7:                                 ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_10 Depth 3
                                        ;       Child Loop BB3_15 Depth 3
                                        ;       Child Loop BB3_17 Depth 3
	cmp	x10, #2
	b.hs	LBB3_9
; %bb.8:                                ;   in Loop: Header=BB3_7 Depth=2
	mov	x8, #0                          ; =0x0
	movi.2d	v22, #0000000000000000
	faddp.2d	d22, v22
	subs	x4, x10, x8
	b.le	LBB3_6
	b	LBB3_12
LBB3_9:                                 ;   in Loop: Header=BB3_7 Depth=2
	movi.2d	v22, #0000000000000000
	mov	x8, x1
	mov	x13, x0
	mov	w2, #2                          ; =0x2
LBB3_10:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q23, [x13], #16
	ldr	q24, [x8], #16
	fmla.2d	v22, v24, v23
	add	x2, x2, #2
	cmp	x2, x10
	b.le	LBB3_10
; %bb.11:                               ;   in Loop: Header=BB3_7 Depth=2
	mov	x8, x14
	faddp.2d	d22, v22
	subs	x4, x10, x14
	b.le	LBB3_6
LBB3_12:                                ;   in Loop: Header=BB3_7 Depth=2
	cmp	x4, #8
	b.hs	LBB3_14
; %bb.13:                               ;   in Loop: Header=BB3_7 Depth=2
	mov	x2, x8
	b	LBB3_17
LBB3_14:                                ;   in Loop: Header=BB3_7 Depth=2
	and	x6, x4, #0xfffffffffffffff8
	add	x2, x8, x6
	lsl	x13, x8, #3
	mov	x19, x6
LBB3_15:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x8, x0, x13
	ldp	q23, q24, [x8]
	ldp	q25, q26, [x8, #32]
	add	x8, x1, x13
	ldp	q27, q28, [x8]
	ldp	q29, q30, [x8, #32]
	fmul.2d	v23, v23, v27
	mov	d27, v23[1]
	fmul.2d	v24, v24, v28
	mov	d28, v24[1]
	fmul.2d	v25, v25, v29
	mov	d29, v25[1]
	fmul.2d	v26, v26, v30
	mov	d30, v26[1]
	fadd	d22, d22, d23
	fadd	d22, d22, d27
	fadd	d22, d22, d24
	fadd	d22, d22, d28
	fadd	d22, d22, d25
	fadd	d22, d22, d29
	fadd	d22, d22, d26
	fadd	d22, d22, d30
	add	x13, x13, #64
	subs	x19, x19, #8
	b.ne	LBB3_15
; %bb.16:                               ;   in Loop: Header=BB3_7 Depth=2
	cmp	x4, x6
	b.eq	LBB3_6
LBB3_17:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d23, [x0, x2, lsl #3]
	ldr	d24, [x1, x2, lsl #3]
	fmadd	d22, d23, d24, d22
	add	x2, x2, #1
	cmp	x10, x2
	b.ne	LBB3_17
	b	LBB3_6
LBB3_18:                                ;   in Loop: Header=BB3_4 Depth=1
	cmp	x30, x9
	b.ge	LBB3_25
; %bb.19:                               ;   in Loop: Header=BB3_4 Depth=1
	mvn	x8, x12
	ldr	x13, [sp, #72]                  ; 8-byte Folded Reload
	add	x13, x13, x8
	mov	x8, x30
	cmp	x13, #8
	b.lo	LBB3_23
; %bb.20:                               ;   in Loop: Header=BB3_4 Depth=1
	and	x15, x11, #0xfffffffffffffff8
	and	x1, x13, #0xfffffffffffffff8
	add	x8, x30, x1
	mov	x2, x7
LBB3_21:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	q1, q1, [x2, #-32]
	stp	q1, q1, [x2], #64
	subs	x15, x15, #8
	b.ne	LBB3_21
; %bb.22:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x13, x1
	b.eq	LBB3_25
LBB3_23:                                ;   in Loop: Header=BB3_4 Depth=1
	sub	x13, x9, x8
	add	x8, x23, x8, lsl #3
LBB3_24:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	x20, [x8], #8
	subs	x13, x13, #1
	b.ne	LBB3_24
LBB3_25:                                ;   in Loop: Header=BB3_4 Depth=1
	ld1r.2d	{ v22 }, [x25]
	cmp	x9, #2
	b.hs	LBB3_27
; %bb.26:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x8, #0                          ; =0x0
	fmaxp.2d	d22, v22
	cmp	x8, x9
	b.lt	LBB3_30
	b	LBB3_31
LBB3_27:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x8, x23
	mov	w13, #2                         ; =0x2
LBB3_28:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q23, [x8], #16
	fmax.2d	v22, v22, v23
	add	x13, x13, #2
	cmp	x13, x9
	b.le	LBB3_28
; %bb.29:                               ;   in Loop: Header=BB3_4 Depth=1
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	fmaxp.2d	d22, v22
	cmp	x8, x9
	b.ge	LBB3_31
LBB3_30:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d23, [x23, x8, lsl #3]
	fcmp	d23, d22
	fcsel	d22, d23, d22, gt
	add	x8, x8, #1
	cmp	x9, x8
	b.ne	LBB3_30
LBB3_31:                                ;   in Loop: Header=BB3_4 Depth=1
	fmov.2d	v23, #1.00000000
	cmp	x9, #2
	b.hs	LBB3_33
; %bb.32:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x15, #0                         ; =0x0
	movi.2d	v24, #0000000000000000
	b	LBB3_35
LBB3_33:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x1, #0                          ; =0x0
	dup.2d	v25, v22[0]
	movi.2d	v24, #0000000000000000
	mov	x2, x23
LBB3_34:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q26, [x2]
	dup.2d	v27, x21
	fsub.2d	v26, v26, v25
	fmax.2d	v26, v26, v27
	fmul.2d	v27, v26, v2
	frintn.2d	v27, v27
	fmul.2d	v28, v27, v3
	fadd.2d	v26, v26, v28
	fmul.2d	v28, v27, v4
	fadd.2d	v26, v26, v28
	mov.16b	v28, v6
	fmla.2d	v28, v5, v26
	mov.16b	v29, v7
	fmla.2d	v29, v26, v28
	mov.16b	v28, v16
	fmla.2d	v28, v26, v29
	mov.16b	v29, v17
	fmla.2d	v29, v26, v28
	mov.16b	v28, v18
	fmla.2d	v28, v26, v29
	mov.16b	v29, v19
	fmla.2d	v29, v26, v28
	mov.16b	v28, v23
	fmla.2d	v28, v26, v29
	mov.16b	v29, v23
	fmla.2d	v29, v26, v28
	fcvtzs.2d	v26, v27
	shl.2d	v26, v26, #52
	add.2d	v26, v26, v23
	fmul.2d	v26, v29, v26
	str	q26, [x2], #16
	fadd.2d	v24, v24, v26
	add	x15, x1, #2
	add	x8, x1, #4
	mov	x1, x15
	cmp	x8, x9
	b.le	LBB3_34
LBB3_35:                                ;   in Loop: Header=BB3_4 Depth=1
	faddp.2d	d24, v24
	cmp	x15, x9
	b.ge	LBB3_37
LBB3_36:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d25, [x23, x15, lsl #3]
	fsub	d25, d25, d22
	fmov	d26, x21
	fcmp	d25, d26
	fcsel	d25, d26, d25, mi
	dup.2d	v26, v25[0]
	fmul.2d	v25, v2, v25[0]
	frintn.2d	v25, v25
	fmul.2d	v27, v25, v3
	fadd.2d	v26, v26, v27
	fmul.2d	v27, v25, v4
	fadd.2d	v26, v26, v27
	mov.16b	v27, v6
	fmla.2d	v27, v5, v26
	mov.16b	v28, v7
	fmla.2d	v28, v26, v27
	mov.16b	v27, v16
	fmla.2d	v27, v26, v28
	mov.16b	v28, v17
	fmla.2d	v28, v26, v27
	mov.16b	v27, v18
	fmla.2d	v27, v26, v28
	mov.16b	v28, v19
	fmla.2d	v28, v26, v27
	mov.16b	v27, v23
	fmla.2d	v27, v26, v28
	mov.16b	v28, v23
	fmla.2d	v28, v26, v27
	fcvtzs.2d	v25, v25
	shl.2d	v25, v25, #52
	add.2d	v25, v25, v23
	fmul.2d	v25, v28, v25
	str	d25, [x23, x15, lsl #3]
	fadd	d24, d24, d25
	add	x15, x15, #1
	cmp	x9, x15
	b.ne	LBB3_36
LBB3_37:                                ;   in Loop: Header=BB3_4 Depth=1
	fdiv	d22, d20, d24
	cmp	x9, #2
	b.hs	LBB3_39
; %bb.38:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x1, #0                          ; =0x0
	b	LBB3_41
LBB3_39:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x13, #0                         ; =0x0
	mov	x8, x23
LBB3_40:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q23, [x8]
	fmul.2d	v23, v23, v22[0]
	str	q23, [x8], #16
	add	x1, x13, #2
	add	x15, x13, #4
	mov	x13, x1
	cmp	x15, x9
	b.le	LBB3_40
LBB3_41:                                ;   in Loop: Header=BB3_4 Depth=1
	subs	x15, x9, x1
	b.le	LBB3_48
; %bb.42:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x15, #8
	b.hs	LBB3_44
; %bb.43:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x13, x1
	b	LBB3_47
LBB3_44:                                ;   in Loop: Header=BB3_4 Depth=1
	and	x8, x15, #0xfffffffffffffff8
	add	x13, x1, x8
	add	x1, x23, x1, lsl #3
	mov	x2, x8
LBB3_45:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q23, q24, [x1]
	ldp	q25, q26, [x1, #32]
	fmul.2d	v23, v23, v22[0]
	fmul.2d	v24, v24, v22[0]
	fmul.2d	v25, v25, v22[0]
	fmul.2d	v26, v26, v22[0]
	stp	q23, q24, [x1]
	stp	q25, q26, [x1, #32]
	add	x1, x1, #64
	subs	x2, x2, #8
	b.ne	LBB3_45
; %bb.46:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x15, x8
	b.eq	LBB3_48
LBB3_47:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d23, [x23, x13, lsl #3]
	fmul	d23, d22, d23
	str	d23, [x23, x13, lsl #3]
	add	x13, x13, #1
	cmp	x9, x13
	b.ne	LBB3_47
LBB3_48:                                ;   in Loop: Header=BB3_4 Depth=1
	cmp	x10, #2
	b.hs	LBB3_50
; %bb.49:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x15, #0                         ; =0x0
	b	LBB3_52
LBB3_50:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x13, #0                         ; =0x0
	mov	x8, x22
LBB3_51:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	xzr, xzr, [x8], #16
	add	x15, x13, #2
	add	x1, x13, #4
	mov	x13, x15
	cmp	x1, x10
	b.le	LBB3_51
LBB3_52:                                ;   in Loop: Header=BB3_4 Depth=1
	subs	x8, x10, x15
	b.le	LBB3_59
; %bb.53:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x8, #8
	b.hs	LBB3_55
; %bb.54:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x13, x15
	b	LBB3_58
LBB3_55:                                ;   in Loop: Header=BB3_4 Depth=1
	and	x1, x8, #0xfffffffffffffff8
	add	x13, x15, x1
	add	x15, x22, x15, lsl #3
	mov	x2, x1
LBB3_56:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	stp	q21, q21, [x15]
	stp	q21, q21, [x15, #32]
	add	x15, x15, #64
	subs	x2, x2, #8
	b.ne	LBB3_56
; %bb.57:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x8, x1
	b.eq	LBB3_59
LBB3_58:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	xzr, [x22, x13, lsl #3]
	add	x13, x13, #1
	cmp	x10, x13
	b.ne	LBB3_58
LBB3_59:                                ;   in Loop: Header=BB3_4 Depth=1
	cmp	x30, #1
	b.lt	LBB3_3
; %bb.60:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x15, #0                         ; =0x0
	mul	x8, x16, x12
	ldr	x13, [sp, #24]                  ; 8-byte Folded Reload
	add	x1, x13, x8
	ldr	x13, [sp, #8]                   ; 8-byte Folded Reload
	add	x30, x13, x8
	mov	x2, x17
	b	LBB3_62
LBB3_61:                                ;   in Loop: Header=BB3_62 Depth=2
	add	x15, x15, #1
	add	x2, x2, x16
	cmp	x15, x24
	b.eq	LBB3_3
LBB3_62:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_66 Depth 3
                                        ;       Child Loop BB3_72 Depth 3
                                        ;       Child Loop BB3_74 Depth 3
	ldr	d22, [x25, x15, lsl #3]
	fcmp	d22, #0.0
	b.eq	LBB3_61
; %bb.63:                               ;   in Loop: Header=BB3_62 Depth=2
	cmp	x10, #2
	b.hs	LBB3_65
; %bb.64:                               ;   in Loop: Header=BB3_62 Depth=2
	mov	x19, #0                         ; =0x0
	b	LBB3_67
LBB3_65:                                ;   in Loop: Header=BB3_62 Depth=2
	mov	x8, #0                          ; =0x0
	mov	x13, #0                         ; =0x0
LBB3_66:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_62 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q23, [x22, x8]
	ldr	q24, [x2, x8]
	fmla.2d	v23, v24, v22[0]
	str	q23, [x22, x8]
	add	x19, x13, #2
	add	x8, x8, #16
	add	x3, x13, #4
	mov	x13, x19
	cmp	x3, x10
	b.le	LBB3_66
LBB3_67:                                ;   in Loop: Header=BB3_62 Depth=2
	subs	x4, x10, x19
	b.le	LBB3_61
; %bb.68:                               ;   in Loop: Header=BB3_62 Depth=2
	cmp	x4, #8
	b.lo	LBB3_74
; %bb.69:                               ;   in Loop: Header=BB3_62 Depth=2
	mul	x8, x16, x15
	add	x6, x5, x8
	lsl	x13, x19, #3
	add	x3, x1, x13
	cmp	x3, x6
	b.hs	LBB3_71
; %bb.70:                               ;   in Loop: Header=BB3_62 Depth=2
	add	x8, x17, x8
	add	x8, x8, x13
	cmp	x8, x30
	b.lo	LBB3_74
LBB3_71:                                ;   in Loop: Header=BB3_62 Depth=2
	and	x8, x4, #0xfffffffffffffff8
	add	x19, x19, x8
	mov	x6, x8
LBB3_72:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_62 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x3, x2, x13
	ldp	q23, q24, [x3]
	ldp	q25, q26, [x3, #32]
	add	x3, x22, x13
	ldp	q27, q28, [x3]
	ldp	q29, q30, [x3, #32]
	fmla.2d	v27, v23, v22[0]
	fmla.2d	v28, v24, v22[0]
	fmla.2d	v29, v25, v22[0]
	fmla.2d	v30, v26, v22[0]
	stp	q27, q28, [x3]
	stp	q29, q30, [x3, #32]
	add	x13, x13, #64
	subs	x6, x6, #8
	b.ne	LBB3_72
; %bb.73:                               ;   in Loop: Header=BB3_62 Depth=2
	cmp	x4, x8
	b.eq	LBB3_61
LBB3_74:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_62 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d23, [x2, x19, lsl #3]
	ldr	d24, [x22, x19, lsl #3]
	fmadd	d23, d22, d23, d24
	str	d23, [x22, x19, lsl #3]
	add	x19, x19, #1
	cmp	x10, x19
	b.ne	LBB3_74
	b	LBB3_61
                                        ; -- End function
.subsections_via_symbols
