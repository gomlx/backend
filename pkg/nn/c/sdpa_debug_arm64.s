	.build_version macos, 15, 0	sdk_version 15, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_sdpa_debug_scores_f32          ; -- Begin function sdpa_debug_scores_f32
	.p2align	2
_sdpa_debug_scores_f32:                 ; @sdpa_debug_scores_f32
; %bb.0:
	sub	sp, sp, #432
	str	x25, [sp, #352]                 ; 8-byte Folded Spill
	stp	x24, x23, [sp, #368]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #384]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #400]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #416]            ; 16-byte Folded Spill
	str	x1, [sp, #24]                   ; 8-byte Folded Spill
	ldp	x8, x9, [x3]
	ldr	x16, [x3, #16]
	cmp	x8, #1
	ccmp	x9, #1, #8, ge
	ccmp	x16, #1, #8, ge
	b.ge	LBB0_2
LBB0_1:
	ldp	x29, x30, [sp, #416]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #400]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #384]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #368]            ; 16-byte Folded Reload
	ldr	x25, [sp, #352]                 ; 8-byte Folded Reload
	add	sp, sp, #432
	ret
LBB0_2:
	mov	x17, #0                         ; =0x0
	lsl	x12, x9, #2
	mov	w10, #60                        ; =0x3c
	madd	x10, x16, x10, x0
	str	x10, [sp, #200]                 ; 8-byte Folded Spill
	lsl	x10, x16, #6
	str	x10, [sp, #16]                  ; 8-byte Folded Spill
	mov	w10, #56                        ; =0x38
	madd	x4, x16, x10, x0
	mov	w10, #52                        ; =0x34
	madd	x21, x16, x10, x0
	mov	w10, #48                        ; =0x30
	mov	w11, #44                        ; =0x2c
	mov	w13, #40                        ; =0x28
	madd	x23, x16, x10, x0
	mov	w10, #36                        ; =0x24
	add	x25, x0, x16, lsl #5
	madd	x30, x16, x11, x0
	mov	w11, #28                        ; =0x1c
	mov	w14, #24                        ; =0x18
	mov	w15, #20                        ; =0x14
	madd	x1, x16, x13, x0
	add	x5, x0, x16, lsl #4
	mov	w13, #12                        ; =0xc
	madd	x10, x16, x10, x0
	add	x6, x0, x16, lsl #3
	add	x2, x2, #32
	madd	x11, x16, x11, x0
	str	x11, [sp, #160]                 ; 8-byte Folded Spill
	mov	x11, x1
	lsl	x1, x9, #6
	str	x1, [sp, #8]                    ; 8-byte Folded Spill
	madd	x14, x16, x14, x0
	str	x14, [sp, #152]                 ; 8-byte Folded Spill
	mov	x14, x10
	madd	x10, x16, x15, x0
	str	x10, [sp, #144]                 ; 8-byte Folded Spill
	mov	x15, x6
	ptrue	p0.s
	str	x8, [sp, #208]                  ; 8-byte Folded Spill
	add	x10, x0, x16, lsl #2
	madd	x13, x16, x13, x0
	str	x13, [sp, #192]                 ; 8-byte Folded Spill
	mov	x13, x5
	mov	x5, x10
	str	x16, [sp, #48]                  ; 8-byte Folded Spill
	b	LBB0_4
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	ldr	x17, [sp, #40]                  ; 8-byte Folded Reload
	add	x17, x17, #16
	ldp	x1, x10, [sp, #200]             ; 16-byte Folded Reload
	sub	x10, x10, #16
	str	x10, [sp, #208]                 ; 8-byte Folded Spill
	ldr	x10, [sp, #16]                  ; 8-byte Folded Reload
	add	x1, x1, x10
	str	x1, [sp, #200]                  ; 8-byte Folded Spill
	add	x4, x4, x10
	add	x21, x21, x10
	add	x23, x23, x10
	add	x30, x30, x10
	add	x11, x11, x10
	add	x14, x14, x10
	add	x25, x25, x10
	ldr	x1, [sp, #160]                  ; 8-byte Folded Reload
	add	x1, x1, x10
	str	x1, [sp, #160]                  ; 8-byte Folded Spill
	ldr	x1, [sp, #152]                  ; 8-byte Folded Reload
	add	x1, x1, x10
	str	x1, [sp, #152]                  ; 8-byte Folded Spill
	ldr	x1, [sp, #144]                  ; 8-byte Folded Reload
	add	x1, x1, x10
	str	x1, [sp, #144]                  ; 8-byte Folded Spill
	add	x13, x13, x10
	ldr	x1, [sp, #192]                  ; 8-byte Folded Reload
	add	x1, x1, x10
	str	x1, [sp, #192]                  ; 8-byte Folded Spill
	add	x15, x15, x10
	add	x5, x5, x10
	add	x0, x0, x10
	ldr	x2, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	add	x2, x2, x10
	cmp	x17, x8
	b.ge	LBB0_1
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_6 Depth 2
                                        ;       Child Loop BB0_8 Depth 3
                                        ;       Child Loop BB0_40 Depth 3
	str	xzr, [sp, #184]                 ; 8-byte Folded Spill
	orr	x10, x17, #0x1
	str	x10, [sp, #360]                 ; 8-byte Folded Spill
	orr	x10, x17, #0x2
	str	x10, [sp, #280]                 ; 8-byte Folded Spill
	orr	x10, x17, #0x3
	str	x10, [sp, #272]                 ; 8-byte Folded Spill
	orr	x10, x17, #0x4
	str	x10, [sp, #264]                 ; 8-byte Folded Spill
	mov	w10, #5                         ; =0x5
	orr	x10, x17, x10
	str	x10, [sp, #256]                 ; 8-byte Folded Spill
	orr	x10, x17, #0x6
	str	x10, [sp, #248]                 ; 8-byte Folded Spill
	orr	x10, x17, #0x7
	str	x10, [sp, #240]                 ; 8-byte Folded Spill
	orr	x10, x17, #0x8
	str	x10, [sp, #232]                 ; 8-byte Folded Spill
	mov	w10, #9                         ; =0x9
	orr	x10, x17, x10
	str	x10, [sp, #224]                 ; 8-byte Folded Spill
	mov	w10, #10                        ; =0xa
	orr	x10, x17, x10
	str	x10, [sp, #216]                 ; 8-byte Folded Spill
	mov	w10, #11                        ; =0xb
	orr	x6, x17, x10
	orr	x7, x17, #0xc
	mov	w10, #13                        ; =0xd
	orr	x19, x17, x10
	orr	x20, x17, #0xe
	stp	x2, x17, [sp, #32]              ; 16-byte Folded Spill
	orr	x24, x17, #0xf
	str	x2, [sp, #176]                  ; 8-byte Folded Spill
	ldr	x22, [sp, #24]                  ; 8-byte Folded Reload
	stp	x4, x0, [sp, #128]              ; 16-byte Folded Spill
	stp	x23, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x30, x25, [sp, #96]             ; 16-byte Folded Spill
	stp	x13, x11, [sp, #80]             ; 16-byte Folded Spill
	stp	x15, x14, [sp, #64]             ; 16-byte Folded Spill
	str	x5, [sp, #56]                   ; 8-byte Folded Spill
	b	LBB0_6
LBB0_5:                                 ;   in Loop: Header=BB0_6 Depth=2
	ldp	x11, x10, [sp, #176]            ; 16-byte Folded Reload
	add	x10, x10, #16
	ldr	x22, [sp, #168]                 ; 8-byte Folded Reload
	add	x22, x22, #64
	add	x11, x11, #64
	stp	x11, x10, [sp, #176]            ; 16-byte Folded Spill
	cmp	x10, x9
	ldp	x4, x0, [sp, #128]              ; 16-byte Folded Reload
	ldp	x16, x5, [sp, #48]              ; 16-byte Folded Reload
	ldp	x23, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x30, x25, [sp, #96]             ; 16-byte Folded Reload
	ldp	x13, x11, [sp, #80]             ; 16-byte Folded Reload
	ldp	x15, x14, [sp, #64]             ; 16-byte Folded Reload
	b.ge	LBB0_3
LBB0_6:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_8 Depth 3
                                        ;       Child Loop BB0_40 Depth 3
	mov	x1, #0                          ; =0x0
	zero	{za}
	str	x22, [sp, #168]                 ; 8-byte Folded Spill
	ldp	x17, x10, [sp, #152]            ; 16-byte Folded Reload
	ldr	x2, [sp, #144]                  ; 8-byte Folded Reload
	b	LBB0_8
LBB0_7:                                 ;   in Loop: Header=BB0_8 Depth=3
	str	s0, [sp, #348]
	add	x3, sp, #288
	ldr	z0, [x3]
	ldr	z1, [x22]
	fmopa	za0.s, p0/m, p0/m, z0.s, z1.s
	add	x1, x1, #1
	add	x22, x22, x12
	cmp	x16, x1
	b.eq	LBB0_38
LBB0_8:                                 ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s0, [x0, x1, lsl #2]
	str	s0, [sp, #288]
	fmov	s0, wzr
	fmov	s1, wzr
	ldr	x3, [sp, #360]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_23
; %bb.9:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s1, [sp, #292]
	ldr	x3, [sp, #280]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_24
LBB0_10:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s0, [sp, #296]
	fmov	s0, wzr
	fmov	s1, wzr
	ldr	x3, [sp, #272]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_25
LBB0_11:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s1, [sp, #300]
	ldr	x3, [sp, #264]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_26
LBB0_12:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s0, [sp, #304]
	fmov	s0, wzr
	fmov	s1, wzr
	ldr	x3, [sp, #256]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_27
LBB0_13:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s1, [sp, #308]
	ldr	x3, [sp, #248]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_28
LBB0_14:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s0, [sp, #312]
	fmov	s0, wzr
	fmov	s1, wzr
	ldr	x3, [sp, #240]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_29
LBB0_15:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s1, [sp, #316]
	ldr	x3, [sp, #232]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_30
LBB0_16:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s0, [sp, #320]
	fmov	s0, wzr
	fmov	s1, wzr
	ldr	x3, [sp, #224]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_31
LBB0_17:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s1, [sp, #324]
	ldr	x3, [sp, #216]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.lt	LBB0_32
LBB0_18:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s0, [sp, #328]
	fmov	s0, wzr
	fmov	s1, wzr
	cmp	x6, x8
	b.lt	LBB0_33
LBB0_19:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s1, [sp, #332]
	cmp	x7, x8
	b.lt	LBB0_34
LBB0_20:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s0, [sp, #336]
	fmov	s0, wzr
	fmov	s1, wzr
	cmp	x19, x8
	b.lt	LBB0_35
LBB0_21:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s1, [sp, #340]
	cmp	x20, x8
	b.lt	LBB0_36
LBB0_22:                                ;   in Loop: Header=BB0_8 Depth=3
	str	s0, [sp, #344]
	fmov	s0, wzr
	cmp	x24, x8
	b.ge	LBB0_7
	b	LBB0_37
LBB0_23:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s1, [x5, x1, lsl #2]
	str	s1, [sp, #292]
	ldr	x3, [sp, #280]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.ge	LBB0_10
LBB0_24:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s0, [x15, x1, lsl #2]
	str	s0, [sp, #296]
	fmov	s0, wzr
	fmov	s1, wzr
	ldr	x3, [sp, #272]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.ge	LBB0_11
LBB0_25:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	x3, [sp, #192]                  ; 8-byte Folded Reload
	ldr	s1, [x3, x1, lsl #2]
	str	s1, [sp, #300]
	ldr	x3, [sp, #264]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.ge	LBB0_12
LBB0_26:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s0, [x13, x1, lsl #2]
	str	s0, [sp, #304]
	fmov	s0, wzr
	fmov	s1, wzr
	ldr	x3, [sp, #256]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.ge	LBB0_13
LBB0_27:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s1, [x2, x1, lsl #2]
	str	s1, [sp, #308]
	ldr	x3, [sp, #248]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.ge	LBB0_14
LBB0_28:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s0, [x17, x1, lsl #2]
	str	s0, [sp, #312]
	fmov	s0, wzr
	fmov	s1, wzr
	ldr	x3, [sp, #240]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.ge	LBB0_15
LBB0_29:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s1, [x10, x1, lsl #2]
	str	s1, [sp, #316]
	ldr	x3, [sp, #232]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.ge	LBB0_16
LBB0_30:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s0, [x25, x1, lsl #2]
	str	s0, [sp, #320]
	fmov	s0, wzr
	fmov	s1, wzr
	ldr	x3, [sp, #224]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.ge	LBB0_17
LBB0_31:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s1, [x14, x1, lsl #2]
	str	s1, [sp, #324]
	ldr	x3, [sp, #216]                  ; 8-byte Folded Reload
	cmp	x3, x8
	b.ge	LBB0_18
LBB0_32:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s0, [x11, x1, lsl #2]
	str	s0, [sp, #328]
	fmov	s0, wzr
	fmov	s1, wzr
	cmp	x6, x8
	b.ge	LBB0_19
LBB0_33:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s1, [x30, x1, lsl #2]
	str	s1, [sp, #332]
	cmp	x7, x8
	b.ge	LBB0_20
LBB0_34:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s0, [x23, x1, lsl #2]
	str	s0, [sp, #336]
	fmov	s0, wzr
	fmov	s1, wzr
	cmp	x19, x8
	b.ge	LBB0_21
LBB0_35:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s1, [x21, x1, lsl #2]
	str	s1, [sp, #340]
	cmp	x20, x8
	b.ge	LBB0_22
LBB0_36:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	s0, [x4, x1, lsl #2]
	str	s0, [sp, #344]
	fmov	s0, wzr
	cmp	x24, x8
	b.ge	LBB0_7
LBB0_37:                                ;   in Loop: Header=BB0_8 Depth=3
	ldr	x3, [sp, #200]                  ; 8-byte Folded Reload
	ldr	s0, [x3, x1, lsl #2]
	b	LBB0_7
LBB0_38:                                ;   in Loop: Header=BB0_6 Depth=2
	mov	x14, #0                         ; =0x0
	ldr	x3, [sp, #184]                  ; 8-byte Folded Reload
	orr	x1, x3, #0x1
	orr	x22, x3, #0x2
	orr	x23, x3, #0x3
	orr	x2, x3, #0x4
	mov	w10, #5                         ; =0x5
	orr	x25, x3, x10
	orr	x10, x3, #0x6
	orr	x30, x3, #0x7
	orr	x0, x3, #0x8
	mov	w11, #9                         ; =0x9
	orr	x21, x3, x11
	mov	w11, #10                        ; =0xa
	orr	x11, x3, x11
	mov	w13, #11                        ; =0xb
	orr	x13, x3, x13
	orr	x15, x3, #0xc
	mov	w16, #13                        ; =0xd
	orr	x16, x3, x16
	orr	x17, x3, #0xe
	orr	x3, x3, #0xf
	ldr	x4, [sp, #176]                  ; 8-byte Folded Reload
	b	LBB0_40
LBB0_39:                                ;   in Loop: Header=BB0_40 Depth=3
	add	x14, x14, #1
	add	x4, x4, x12
	cmp	x14, #16
	b.eq	LBB0_5
LBB0_40:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	x5, [sp, #208]                  ; 8-byte Folded Reload
	cmp	x5, x14
	b.eq	LBB0_5
; %bb.41:                               ;   in Loop: Header=BB0_40 Depth=3
	mov	z0.s, p0/m, za0h.s[w14, 0]
	add	x5, sp, #288
	str	z0, [x5]
	ldr	s0, [sp, #288]
	stur	s0, [x4, #-32]
	cmp	x1, x9
	b.lt	LBB0_56
; %bb.42:                               ;   in Loop: Header=BB0_40 Depth=3
	cmp	x22, x9
	b.lt	LBB0_57
LBB0_43:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x23, x9
	b.lt	LBB0_58
LBB0_44:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x2, x9
	b.lt	LBB0_59
LBB0_45:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x25, x9
	b.lt	LBB0_60
LBB0_46:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x10, x9
	b.lt	LBB0_61
LBB0_47:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x30, x9
	b.lt	LBB0_62
LBB0_48:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x0, x9
	b.lt	LBB0_63
LBB0_49:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x21, x9
	b.lt	LBB0_64
LBB0_50:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x11, x9
	b.lt	LBB0_65
LBB0_51:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x13, x9
	b.lt	LBB0_66
LBB0_52:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x15, x9
	b.lt	LBB0_67
LBB0_53:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x16, x9
	b.lt	LBB0_68
LBB0_54:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x17, x9
	b.lt	LBB0_69
LBB0_55:                                ;   in Loop: Header=BB0_40 Depth=3
	cmp	x3, x9
	b.ge	LBB0_39
	b	LBB0_70
LBB0_56:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #292]
	stur	s0, [x4, #-28]
	cmp	x22, x9
	b.ge	LBB0_43
LBB0_57:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #296]
	stur	s0, [x4, #-24]
	cmp	x23, x9
	b.ge	LBB0_44
LBB0_58:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #300]
	stur	s0, [x4, #-20]
	cmp	x2, x9
	b.ge	LBB0_45
LBB0_59:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #304]
	stur	s0, [x4, #-16]
	cmp	x25, x9
	b.ge	LBB0_46
LBB0_60:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #308]
	stur	s0, [x4, #-12]
	cmp	x10, x9
	b.ge	LBB0_47
LBB0_61:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #312]
	stur	s0, [x4, #-8]
	cmp	x30, x9
	b.ge	LBB0_48
LBB0_62:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #316]
	stur	s0, [x4, #-4]
	cmp	x0, x9
	b.ge	LBB0_49
LBB0_63:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #320]
	str	s0, [x4]
	cmp	x21, x9
	b.ge	LBB0_50
LBB0_64:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #324]
	str	s0, [x4, #4]
	cmp	x11, x9
	b.ge	LBB0_51
LBB0_65:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #328]
	str	s0, [x4, #8]
	cmp	x13, x9
	b.ge	LBB0_52
LBB0_66:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #332]
	str	s0, [x4, #12]
	cmp	x15, x9
	b.ge	LBB0_53
LBB0_67:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #336]
	str	s0, [x4, #16]
	cmp	x16, x9
	b.ge	LBB0_54
LBB0_68:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #340]
	str	s0, [x4, #20]
	cmp	x17, x9
	b.ge	LBB0_55
LBB0_69:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #344]
	str	s0, [x4, #24]
	cmp	x3, x9
	b.ge	LBB0_39
LBB0_70:                                ;   in Loop: Header=BB0_40 Depth=3
	ldr	s0, [sp, #348]
	str	s0, [x4, #28]
	b	LBB0_39
                                        ; -- End function
	.globl	_sdpa_debug_full_f32            ; -- Begin function sdpa_debug_full_f32
	.p2align	2
_sdpa_debug_full_f32:                   ; @sdpa_debug_full_f32
; %bb.0:
	sub	sp, sp, #1104
	str	x25, [sp, #1024]                ; 8-byte Folded Spill
	str	x24, [sp, #1032]                ; 8-byte Folded Spill
	str	x23, [sp, #1040]                ; 8-byte Folded Spill
	str	x22, [sp, #1048]                ; 8-byte Folded Spill
	str	x21, [sp, #1056]                ; 8-byte Folded Spill
	str	x20, [sp, #1064]                ; 8-byte Folded Spill
	str	x19, [sp, #1072]                ; 8-byte Folded Spill
	str	x29, [sp, #1080]                ; 8-byte Folded Spill
	str	x30, [sp, #1088]                ; 8-byte Folded Spill
	sub	sp, sp, #2016
	str	x4, [sp, #208]                  ; 8-byte Folded Spill
	stp	x1, x2, [sp, #136]              ; 16-byte Folded Spill
	ldp	x8, x9, [x5]
	ldr	x10, [x5, #16]
	cmp	x8, #1
	ccmp	x9, #1, #8, ge
	ccmp	x10, #1, #8, ge
	b.ge	LBB1_2
LBB1_1:
	add	sp, sp, #2016
	ldr	x30, [sp, #1088]                ; 8-byte Folded Reload
	ldr	x29, [sp, #1080]                ; 8-byte Folded Reload
	ldr	x19, [sp, #1072]                ; 8-byte Folded Reload
	ldr	x20, [sp, #1064]                ; 8-byte Folded Reload
	ldr	x21, [sp, #1056]                ; 8-byte Folded Reload
	ldr	x22, [sp, #1048]                ; 8-byte Folded Reload
	ldr	x23, [sp, #1040]                ; 8-byte Folded Reload
	ldr	x24, [sp, #1032]                ; 8-byte Folded Reload
	ldr	x25, [sp, #1024]                ; 8-byte Folded Reload
	add	sp, sp, #1104
	ret
LBB1_2:
	mov	x24, x0
	mov	x23, #0                         ; =0x0
	add	x15, x10, x10, lsl #1
	lsl	x19, x10, #6
	lsl	x20, x10, #2
	lsl	x11, x10, #3
	mov	w12, #52                        ; =0x34
	mul	x12, x10, x12
	add	x0, x0, x12
	lsl	x13, x15, #4
	add	x14, x24, x13
	str	x14, [sp, #440]                 ; 8-byte Folded Spill
	ldr	s0, [x6]
	mov	w14, #44                        ; =0x2c
	mul	x14, x10, x14
	add	x16, x24, x14
	str	x16, [sp, #192]                 ; 8-byte Folded Spill
	add	x16, x20, x10
	lsl	x17, x16, #3
	add	x1, x24, x17
	str	x1, [sp, #432]                  ; 8-byte Folded Spill
	add	x1, x11, x10
	lsl	x7, x1, #2
	add	x1, x24, x7
	str	x1, [sp, #424]                  ; 8-byte Folded Spill
	lsl	x1, x10, #5
	add	x2, x24, x1
	str	x2, [sp, #416]                  ; 8-byte Folded Spill
	sub	x2, x1, x20
	add	x4, x24, x2
	str	x4, [sp, #408]                  ; 8-byte Folded Spill
	lsl	x4, x15, #3
	add	x5, x24, x4
	str	x5, [sp, #400]                  ; 8-byte Folded Spill
	lsl	x16, x16, #2
	add	x5, x24, x16
	str	x5, [sp, #392]                  ; 8-byte Folded Spill
	lsl	x5, x10, #4
	add	x6, x24, x5
	str	x6, [sp, #384]                  ; 8-byte Folded Spill
	lsl	x15, x15, #2
	add	x6, x24, x15
	str	x6, [sp, #376]                  ; 8-byte Folded Spill
	add	x6, x24, x11
	str	x6, [sp, #368]                  ; 8-byte Folded Spill
	ldr	x6, [sp, #144]                  ; 8-byte Folded Reload
	add	x21, x6, x11
	add	x15, x6, x15
	stp	x15, x21, [sp, #120]            ; 16-byte Folded Spill
	add	x15, x6, x5
	str	x15, [sp, #112]                 ; 8-byte Folded Spill
	add	x15, x6, x16
	str	x15, [sp, #104]                 ; 8-byte Folded Spill
	add	x15, x6, x4
	str	x15, [sp, #96]                  ; 8-byte Folded Spill
	add	x15, x6, x2
	str	x15, [sp, #88]                  ; 8-byte Folded Spill
	add	x15, x6, x1
	str	x15, [sp, #80]                  ; 8-byte Folded Spill
	add	x15, x6, x7
	str	x15, [sp, #72]                  ; 8-byte Folded Spill
	add	x15, x6, x17
	add	x14, x6, x14
	stp	x14, x15, [sp, #56]             ; 16-byte Folded Spill
	add	x13, x6, x13
	add	x12, x6, x12
	stp	x12, x13, [sp, #40]             ; 16-byte Folded Spill
	sub	x11, x19, x11
	add	x12, x24, x11
	str	x12, [sp, #360]                 ; 8-byte Folded Spill
	add	x11, x6, x11
	str	x11, [sp, #32]                  ; 8-byte Folded Spill
	str	x19, [sp, #184]                 ; 8-byte Folded Spill
	sub	x11, x19, x20
	add	x12, x24, x11
	add	x11, x6, x11
	str	x11, [sp, #24]                  ; 8-byte Folded Spill
	ptrue	p0.s
	fmov	s1, #1.00000000
	fmov	s2, #-0.50000000
	fmov	s3, #0.50000000
	and	x11, x10, #0x7ffffffffffffffc
	str	x11, [sp, #456]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #208]                 ; 8-byte Folded Reload
	add	x11, x11, #8
	str	x11, [sp, #200]                 ; 8-byte Folded Spill
	lsl	x11, x9, #2
	str	x11, [sp, #600]                 ; 8-byte Folded Spill
	add	x11, x24, x20
	stp	x11, x12, [sp, #344]            ; 16-byte Folded Spill
	str	x20, [sp, #544]                 ; 8-byte Folded Spill
	add	x11, x6, x20
	str	x11, [sp, #16]                  ; 8-byte Folded Spill
	add	x4, sp, #1824
	mov	w14, #-8388608                  ; =0xff800000
	mov	w15, #44106                     ; =0xac4a
	movk	w15, #49838, lsl #16
	mov	w16, #43579                     ; =0xaa3b
	movk	w16, #16312, lsl #16
	mov	w17, #32768                     ; =0x8000
	movk	w17, #48945, lsl #16
	mov	w5, #32899                      ; =0x8083
	movk	w5, #14686, lsl #16
	mov	w6, #34953                      ; =0x8889
	movk	w6, #15368, lsl #16
	mov	w7, #2913                       ; =0xb61
	movk	w7, #15030, lsl #16
	mov	w19, #43691                     ; =0xaaab
	movk	w19, #15658, lsl #16
	mov	w20, #43691                     ; =0xaaab
	movk	w20, #15914, lsl #16
	mov	w21, #1065353216                ; =0x3f800000
	add	x22, sp, #1760
	str	x8, [sp, #448]                  ; 8-byte Folded Spill
	b	LBB1_4
LBB1_3:                                 ;   in Loop: Header=BB1_4 Depth=1
	ldr	x11, [sp, #448]                 ; 8-byte Folded Reload
	sub	x11, x11, #16
	str	x11, [sp, #448]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #184]                 ; 8-byte Folded Reload
	ldr	x11, [sp, #200]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #200]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #208]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #208]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #352]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #352]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #360]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #360]                 ; 8-byte Folded Spill
	add	x0, x0, x12
	ldr	x11, [sp, #440]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #440]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #192]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #192]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #432]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #432]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #424]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #424]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #416]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #416]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #408]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #408]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #400]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #400]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #392]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #392]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #384]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #384]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #376]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #376]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #368]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #368]                 ; 8-byte Folded Spill
	ldr	x11, [sp, #344]                 ; 8-byte Folded Reload
	add	x11, x11, x12
	str	x11, [sp, #344]                 ; 8-byte Folded Spill
	add	x24, x24, x12
	ldr	x11, [sp, #160]                 ; 8-byte Folded Reload
	mov	x23, x11
	cmp	x11, x8
	b.ge	LBB1_1
LBB1_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_7 Depth 2
                                        ;       Child Loop BB1_10 Depth 3
                                        ;       Child Loop BB1_13 Depth 3
                                        ;     Child Loop BB1_16 Depth 2
                                        ;       Child Loop BB1_18 Depth 3
                                        ;       Child Loop BB1_50 Depth 3
                                        ;         Child Loop BB1_148 Depth 4
                                        ;         Child Loop BB1_151 Depth 4
                                        ;         Child Loop BB1_154 Depth 4
                                        ;         Child Loop BB1_158 Depth 4
                                        ;         Child Loop BB1_162 Depth 4
                                        ;         Child Loop BB1_166 Depth 4
                                        ;         Child Loop BB1_170 Depth 4
                                        ;         Child Loop BB1_174 Depth 4
                                        ;         Child Loop BB1_178 Depth 4
                                        ;         Child Loop BB1_182 Depth 4
                                        ;         Child Loop BB1_186 Depth 4
                                        ;         Child Loop BB1_190 Depth 4
                                        ;         Child Loop BB1_194 Depth 4
                                        ;         Child Loop BB1_198 Depth 4
                                        ;         Child Loop BB1_202 Depth 4
                                        ;         Child Loop BB1_206 Depth 4
                                        ;         Child Loop BB1_210 Depth 4
                                        ;         Child Loop BB1_214 Depth 4
                                        ;         Child Loop BB1_218 Depth 4
                                        ;     Child Loop BB1_222 Depth 2
                                        ;       Child Loop BB1_226 Depth 3
                                        ;       Child Loop BB1_229 Depth 3
	add	x11, sp, #1888
	stur	xzr, [x11, #4]
	mov	x12, #-36028792732385280        ; =0xff800000ff800000
	str	x12, [sp, #1952]
	str	x12, [sp, #1960]
	stur	xzr, [x11, #12]
	stur	xzr, [x11, #20]
	str	x12, [sp, #1968]
	str	x12, [sp, #1976]
	stur	xzr, [x11, #28]
	stur	xzr, [x11, #36]
	str	x12, [sp, #1984]
	str	x12, [sp, #1992]
	stur	xzr, [x11, #44]
	stur	xzr, [x11, #52]
	str	x12, [sp, #2000]
	str	x12, [sp, #2008]
	add	x12, x23, #16
	sub	x11, x8, x23
	str	x12, [sp, #160]                 ; 8-byte Folded Spill
	cmp	x12, x8
	mov	w12, #16                        ; =0x10
	csel	x25, x11, x12, gt
	str	wzr, [sp, #1888]
	str	wzr, [sp, #1948]
	cmp	x25, #1
	b.lt	LBB1_14
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x11, #0                         ; =0x0
	ldp	x13, x12, [sp, #200]            ; 16-byte Folded Reload
	b	LBB1_7
LBB1_6:                                 ;   in Loop: Header=BB1_7 Depth=2
	add	x11, x11, #1
	ldr	x1, [sp, #544]                  ; 8-byte Folded Reload
	add	x13, x13, x1
	add	x12, x12, x1
	cmp	x11, x25
	b.ge	LBB1_14
LBB1_7:                                 ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_10 Depth 3
                                        ;       Child Loop BB1_13 Depth 3
	cmp	x10, #4
	b.hs	LBB1_9
; %bb.8:                                ;   in Loop: Header=BB1_7 Depth=2
	mov	x1, #0                          ; =0x0
	b	LBB1_12
LBB1_9:                                 ;   in Loop: Header=BB1_7 Depth=2
	mov	x2, x13
	ldr	x1, [sp, #456]                  ; 8-byte Folded Reload
LBB1_10:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stp	xzr, xzr, [x2, #-8]
	add	x2, x2, #16
	subs	x1, x1, #4
	b.ne	LBB1_10
; %bb.11:                               ;   in Loop: Header=BB1_7 Depth=2
	ldr	x2, [sp, #456]                  ; 8-byte Folded Reload
	mov	x1, x2
	cmp	x10, x2
	b.eq	LBB1_6
LBB1_12:                                ;   in Loop: Header=BB1_7 Depth=2
	sub	x2, x10, x1
	add	x1, x12, x1, lsl #2
LBB1_13:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	str	wzr, [x1], #4
	subs	x2, x2, #1
	b.ne	LBB1_13
	b	LBB1_6
LBB1_14:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x13, x0
	str	x25, [sp, #152]                 ; 8-byte Folded Spill
	mov	x25, #0                         ; =0x0
	orr	x11, x23, #0x1
	str	x11, [sp, #720]                 ; 8-byte Folded Spill
	orr	x11, x23, #0x2
	str	x11, [sp, #712]                 ; 8-byte Folded Spill
	orr	x11, x23, #0x3
	str	x11, [sp, #704]                 ; 8-byte Folded Spill
	orr	x11, x23, #0x4
	str	x11, [sp, #696]                 ; 8-byte Folded Spill
	mov	w11, #5                         ; =0x5
	orr	x11, x23, x11
	str	x11, [sp, #688]                 ; 8-byte Folded Spill
	orr	x11, x23, #0x6
	str	x11, [sp, #680]                 ; 8-byte Folded Spill
	orr	x11, x23, #0x7
	str	x11, [sp, #672]                 ; 8-byte Folded Spill
	orr	x11, x23, #0x8
	str	x11, [sp, #664]                 ; 8-byte Folded Spill
	mov	w11, #9                         ; =0x9
	orr	x11, x23, x11
	str	x11, [sp, #656]                 ; 8-byte Folded Spill
	mov	w11, #10                        ; =0xa
	orr	x11, x23, x11
	str	x11, [sp, #648]                 ; 8-byte Folded Spill
	mov	w11, #11                        ; =0xb
	orr	x11, x23, x11
	str	x11, [sp, #640]                 ; 8-byte Folded Spill
	orr	x11, x23, #0xc
	str	x11, [sp, #632]                 ; 8-byte Folded Spill
	mov	w11, #13                        ; =0xd
	orr	x11, x23, x11
	str	x11, [sp, #624]                 ; 8-byte Folded Spill
	orr	x11, x23, #0xe
	str	x11, [sp, #616]                 ; 8-byte Folded Spill
	str	x23, [sp, #336]                 ; 8-byte Folded Spill
	orr	x11, x23, #0xf
	str	x11, [sp, #608]                 ; 8-byte Folded Spill
	ldp	x11, x2, [sp, #24]              ; 16-byte Folded Reload
	ldp	x23, x12, [sp, #40]             ; 16-byte Folded Reload
	str	x12, [sp, #568]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #56]                  ; 8-byte Folded Reload
	str	x12, [sp, #272]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #64]                  ; 8-byte Folded Reload
	str	x12, [sp, #288]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #72]                  ; 8-byte Folded Reload
	str	x12, [sp, #256]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #80]                  ; 8-byte Folded Reload
	str	x12, [sp, #264]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #88]                  ; 8-byte Folded Reload
	str	x12, [sp, #280]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #96]                  ; 8-byte Folded Reload
	str	x12, [sp, #296]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #104]                 ; 8-byte Folded Reload
	str	x12, [sp, #304]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #112]                 ; 8-byte Folded Reload
	str	x12, [sp, #312]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #120]                 ; 8-byte Folded Reload
	str	x12, [sp, #320]                 ; 8-byte Folded Spill
	ldp	x12, x0, [sp, #128]             ; 16-byte Folded Reload
	str	x12, [sp, #248]                 ; 8-byte Folded Spill
	ldr	x30, [sp, #16]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #144]                  ; 8-byte Folded Reload
	stp	x13, x24, [sp, #168]            ; 16-byte Folded Spill
	b	LBB1_16
LBB1_15:                                ;   in Loop: Header=BB1_16 Depth=2
	add	x0, x0, #64
	ldr	x11, [sp, #184]                 ; 8-byte Folded Reload
	add	x1, x1, x11
	add	x30, x30, x11
	add	x13, x13, x11
	str	x13, [sp, #248]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #320]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #320]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #312]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #312]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #304]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #304]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #296]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #296]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #280]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #280]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #264]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #264]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #256]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #256]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #288]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #288]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #272]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #272]                 ; 8-byte Folded Spill
	ldr	x12, [sp, #568]                 ; 8-byte Folded Reload
	add	x12, x12, x11
	str	x12, [sp, #568]                 ; 8-byte Folded Spill
	ldp	x2, x23, [sp, #224]             ; 16-byte Folded Reload
	add	x23, x23, x11
	add	x2, x2, x11
	ldr	x12, [sp, #240]                 ; 8-byte Folded Reload
	add	x11, x12, x11
	ldr	x25, [sp, #216]                 ; 8-byte Folded Reload
	cmp	x25, x9
	ldp	x13, x24, [sp, #168]            ; 16-byte Folded Reload
	b.ge	LBB1_219
LBB1_16:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_18 Depth 3
                                        ;       Child Loop BB1_50 Depth 3
                                        ;         Child Loop BB1_148 Depth 4
                                        ;         Child Loop BB1_151 Depth 4
                                        ;         Child Loop BB1_154 Depth 4
                                        ;         Child Loop BB1_158 Depth 4
                                        ;         Child Loop BB1_162 Depth 4
                                        ;         Child Loop BB1_166 Depth 4
                                        ;         Child Loop BB1_170 Depth 4
                                        ;         Child Loop BB1_174 Depth 4
                                        ;         Child Loop BB1_178 Depth 4
                                        ;         Child Loop BB1_182 Depth 4
                                        ;         Child Loop BB1_186 Depth 4
                                        ;         Child Loop BB1_190 Depth 4
                                        ;         Child Loop BB1_194 Depth 4
                                        ;         Child Loop BB1_198 Depth 4
                                        ;         Child Loop BB1_202 Depth 4
                                        ;         Child Loop BB1_206 Depth 4
                                        ;         Child Loop BB1_210 Depth 4
                                        ;         Child Loop BB1_214 Depth 4
                                        ;         Child Loop BB1_218 Depth 4
	stp	x2, x23, [sp, #224]             ; 16-byte Folded Spill
	str	x11, [sp, #240]                 ; 8-byte Folded Spill
	mov	x12, #0                         ; =0x0
	add	x11, x25, #16
	str	x11, [sp, #216]                 ; 8-byte Folded Spill
	zero	{za}
	str	x0, [sp, #328]                  ; 8-byte Folded Spill
	mov	x2, x0
	ldr	x11, [sp, #192]                 ; 8-byte Folded Reload
	mov	x0, x13
	ldr	x13, [sp, #248]                 ; 8-byte Folded Reload
	b	LBB1_18
LBB1_17:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s4, [sp, #1884]
	ldr	z4, [x4]
	ldr	z5, [x2]
	fmopa	za0.s, p0/m, p0/m, z4.s, z5.s
	add	x12, x12, #1
	ldr	x23, [sp, #600]                 ; 8-byte Folded Reload
	add	x2, x2, x23
	cmp	x10, x12
	b.eq	LBB1_48
LBB1_18:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s4, [x24, x12, lsl #2]
	str	s4, [sp, #1824]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #720]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_33
; %bb.19:                               ;   in Loop: Header=BB1_18 Depth=3
	str	s5, [sp, #1828]
	ldr	x23, [sp, #712]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_34
LBB1_20:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s4, [sp, #1832]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #704]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_35
LBB1_21:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s5, [sp, #1836]
	ldr	x23, [sp, #696]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_36
LBB1_22:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s4, [sp, #1840]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #688]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_37
LBB1_23:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s5, [sp, #1844]
	ldr	x23, [sp, #680]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_38
LBB1_24:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s4, [sp, #1848]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #672]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_39
LBB1_25:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s5, [sp, #1852]
	ldr	x23, [sp, #664]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_40
LBB1_26:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s4, [sp, #1856]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #656]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_41
LBB1_27:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s5, [sp, #1860]
	ldr	x23, [sp, #648]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_42
LBB1_28:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s4, [sp, #1864]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #640]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_43
LBB1_29:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s5, [sp, #1868]
	ldr	x23, [sp, #632]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_44
LBB1_30:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s4, [sp, #1872]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #624]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_45
LBB1_31:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s5, [sp, #1876]
	ldr	x23, [sp, #616]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.lt	LBB1_46
LBB1_32:                                ;   in Loop: Header=BB1_18 Depth=3
	str	s4, [sp, #1880]
	fmov	s4, wzr
	ldr	x23, [sp, #608]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_17
	b	LBB1_47
LBB1_33:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #344]                 ; 8-byte Folded Reload
	ldr	s5, [x23, x12, lsl #2]
	str	s5, [sp, #1828]
	ldr	x23, [sp, #712]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_20
LBB1_34:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #368]                 ; 8-byte Folded Reload
	ldr	s4, [x23, x12, lsl #2]
	str	s4, [sp, #1832]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #704]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_21
LBB1_35:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #376]                 ; 8-byte Folded Reload
	ldr	s5, [x23, x12, lsl #2]
	str	s5, [sp, #1836]
	ldr	x23, [sp, #696]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_22
LBB1_36:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #384]                 ; 8-byte Folded Reload
	ldr	s4, [x23, x12, lsl #2]
	str	s4, [sp, #1840]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #688]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_23
LBB1_37:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #392]                 ; 8-byte Folded Reload
	ldr	s5, [x23, x12, lsl #2]
	str	s5, [sp, #1844]
	ldr	x23, [sp, #680]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_24
LBB1_38:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #400]                 ; 8-byte Folded Reload
	ldr	s4, [x23, x12, lsl #2]
	str	s4, [sp, #1848]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #672]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_25
LBB1_39:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #408]                 ; 8-byte Folded Reload
	ldr	s5, [x23, x12, lsl #2]
	str	s5, [sp, #1852]
	ldr	x23, [sp, #664]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_26
LBB1_40:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #416]                 ; 8-byte Folded Reload
	ldr	s4, [x23, x12, lsl #2]
	str	s4, [sp, #1856]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #656]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_27
LBB1_41:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #424]                 ; 8-byte Folded Reload
	ldr	s5, [x23, x12, lsl #2]
	str	s5, [sp, #1860]
	ldr	x23, [sp, #648]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_28
LBB1_42:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #432]                 ; 8-byte Folded Reload
	ldr	s4, [x23, x12, lsl #2]
	str	s4, [sp, #1864]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #640]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_29
LBB1_43:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	s5, [x11, x12, lsl #2]
	str	s5, [sp, #1868]
	ldr	x23, [sp, #632]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_30
LBB1_44:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #440]                 ; 8-byte Folded Reload
	ldr	s4, [x23, x12, lsl #2]
	str	s4, [sp, #1872]
	fmov	s4, wzr
	fmov	s5, wzr
	ldr	x23, [sp, #624]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_31
LBB1_45:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	s5, [x0, x12, lsl #2]
	str	s5, [sp, #1876]
	ldr	x23, [sp, #616]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_32
LBB1_46:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #360]                 ; 8-byte Folded Reload
	ldr	s4, [x23, x12, lsl #2]
	str	s4, [sp, #1880]
	fmov	s4, wzr
	ldr	x23, [sp, #608]                 ; 8-byte Folded Reload
	cmp	x23, x8
	b.ge	LBB1_17
LBB1_47:                                ;   in Loop: Header=BB1_18 Depth=3
	ldr	x23, [sp, #352]                 ; 8-byte Folded Reload
	ldr	s4, [x23, x12, lsl #2]
	b	LBB1_17
LBB1_48:                                ;   in Loop: Header=BB1_16 Depth=2
	mov	x12, #0                         ; =0x0
	orr	x11, x25, #0x1
	str	x11, [sp, #728]                 ; 8-byte Folded Spill
	orr	x11, x25, #0x2
	str	x11, [sp, #592]                 ; 8-byte Folded Spill
	orr	x11, x25, #0x3
	str	x11, [sp, #584]                 ; 8-byte Folded Spill
	orr	x11, x25, #0x4
	str	x11, [sp, #576]                 ; 8-byte Folded Spill
	mov	w11, #5                         ; =0x5
	orr	x11, x25, x11
	str	x11, [sp, #560]                 ; 8-byte Folded Spill
	orr	x11, x25, #0x6
	str	x11, [sp, #552]                 ; 8-byte Folded Spill
	orr	x11, x25, #0x7
	str	x11, [sp, #536]                 ; 8-byte Folded Spill
	orr	x11, x25, #0x8
	str	x11, [sp, #528]                 ; 8-byte Folded Spill
	mov	w11, #9                         ; =0x9
	orr	x11, x25, x11
	str	x11, [sp, #520]                 ; 8-byte Folded Spill
	mov	w11, #10                        ; =0xa
	orr	x11, x25, x11
	str	x11, [sp, #512]                 ; 8-byte Folded Spill
	mov	w11, #11                        ; =0xb
	orr	x11, x25, x11
	str	x11, [sp, #504]                 ; 8-byte Folded Spill
	orr	x11, x25, #0xc
	str	x11, [sp, #496]                 ; 8-byte Folded Spill
	mov	w11, #13                        ; =0xd
	orr	x11, x25, x11
	str	x11, [sp, #488]                 ; 8-byte Folded Spill
	orr	x11, x25, #0xe
	str	x11, [sp, #480]                 ; 8-byte Folded Spill
	orr	x11, x25, #0xf
	str	x11, [sp, #472]                 ; 8-byte Folded Spill
	ldp	x24, x23, [sp, #200]            ; 16-byte Folded Reload
	add	x11, x3, x25, lsl #2
	str	x11, [sp, #464]                 ; 8-byte Folded Spill
	ldr	x0, [sp, #328]                  ; 8-byte Folded Reload
	b	LBB1_50
LBB1_49:                                ;   in Loop: Header=BB1_50 Depth=3
	add	x12, x12, #1
	ldr	x11, [sp, #544]                 ; 8-byte Folded Reload
	add	x24, x24, x11
	add	x23, x23, x11
	cmp	x12, #16
	b.eq	LBB1_15
LBB1_50:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_148 Depth 4
                                        ;         Child Loop BB1_151 Depth 4
                                        ;         Child Loop BB1_154 Depth 4
                                        ;         Child Loop BB1_158 Depth 4
                                        ;         Child Loop BB1_162 Depth 4
                                        ;         Child Loop BB1_166 Depth 4
                                        ;         Child Loop BB1_170 Depth 4
                                        ;         Child Loop BB1_174 Depth 4
                                        ;         Child Loop BB1_178 Depth 4
                                        ;         Child Loop BB1_182 Depth 4
                                        ;         Child Loop BB1_186 Depth 4
                                        ;         Child Loop BB1_190 Depth 4
                                        ;         Child Loop BB1_194 Depth 4
                                        ;         Child Loop BB1_198 Depth 4
                                        ;         Child Loop BB1_202 Depth 4
                                        ;         Child Loop BB1_206 Depth 4
                                        ;         Child Loop BB1_210 Depth 4
                                        ;         Child Loop BB1_214 Depth 4
                                        ;         Child Loop BB1_218 Depth 4
	ldr	x11, [sp, #448]                 ; 8-byte Folded Reload
	cmp	x12, x11
	b.eq	LBB1_15
; %bb.51:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #336]                 ; 8-byte Folded Reload
	orr	x11, x11, x12
	mov	z4.s, p0/m, za0h.s[w12, 0]
	add	x2, sp, #1952
	ldr	s5, [x2, x12, lsl #2]
	str	z4, [x4]
	mul	x11, x11, x9
	ldr	x2, [sp, #464]                  ; 8-byte Folded Reload
	add	x2, x2, x11, lsl #2
	ldr	s4, [sp, #1824]
	fmul	s4, s0, s4
	str	s4, [sp, #1824]
	cbz	x3, LBB1_53
; %bb.52:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [x2]
	fadd	s4, s4, s6
	str	s4, [sp, #1824]
LBB1_53:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s4, s5
	fcsel	s4, s4, s5, gt
	ldr	x11, [sp, #728]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_131
; %bb.54:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1828]
	fmul	s6, s0, s6
	str	s6, [sp, #1828]
	cbz	x3, LBB1_56
; %bb.55:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #4]
	fadd	s6, s6, s7
	str	s6, [sp, #1828]
LBB1_56:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_58
; %bb.57:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_58:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #592]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_132
LBB1_59:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1832]
	fmul	s6, s0, s6
	str	s6, [sp, #1832]
	cbz	x3, LBB1_61
; %bb.60:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #8]
	fadd	s6, s6, s7
	str	s6, [sp, #1832]
LBB1_61:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_63
; %bb.62:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_63:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #584]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_133
LBB1_64:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1836]
	fmul	s6, s0, s6
	str	s6, [sp, #1836]
	cbz	x3, LBB1_66
; %bb.65:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #12]
	fadd	s6, s6, s7
	str	s6, [sp, #1836]
LBB1_66:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_68
; %bb.67:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_68:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #576]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_134
LBB1_69:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1840]
	fmul	s6, s0, s6
	str	s6, [sp, #1840]
	cbz	x3, LBB1_71
; %bb.70:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #16]
	fadd	s6, s6, s7
	str	s6, [sp, #1840]
LBB1_71:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_73
; %bb.72:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_73:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #560]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_135
LBB1_74:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1844]
	fmul	s6, s0, s6
	str	s6, [sp, #1844]
	cbz	x3, LBB1_76
; %bb.75:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #20]
	fadd	s6, s6, s7
	str	s6, [sp, #1844]
LBB1_76:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_78
; %bb.77:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_78:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #552]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_136
LBB1_79:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1848]
	fmul	s6, s0, s6
	str	s6, [sp, #1848]
	cbz	x3, LBB1_81
; %bb.80:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #24]
	fadd	s6, s6, s7
	str	s6, [sp, #1848]
LBB1_81:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_83
; %bb.82:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_83:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #536]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_137
LBB1_84:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1852]
	fmul	s6, s0, s6
	str	s6, [sp, #1852]
	cbz	x3, LBB1_86
; %bb.85:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #28]
	fadd	s6, s6, s7
	str	s6, [sp, #1852]
LBB1_86:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_88
; %bb.87:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_88:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #528]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_138
LBB1_89:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1856]
	fmul	s6, s0, s6
	str	s6, [sp, #1856]
	cbz	x3, LBB1_91
; %bb.90:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #32]
	fadd	s6, s6, s7
	str	s6, [sp, #1856]
LBB1_91:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_93
; %bb.92:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_93:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #520]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_139
LBB1_94:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1860]
	fmul	s6, s0, s6
	str	s6, [sp, #1860]
	cbz	x3, LBB1_96
; %bb.95:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #36]
	fadd	s6, s6, s7
	str	s6, [sp, #1860]
LBB1_96:                                ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_98
; %bb.97:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_98:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #512]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_140
LBB1_99:                                ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1864]
	fmul	s6, s0, s6
	str	s6, [sp, #1864]
	cbz	x3, LBB1_101
; %bb.100:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #40]
	fadd	s6, s6, s7
	str	s6, [sp, #1864]
LBB1_101:                               ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_103
; %bb.102:                              ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_103:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #504]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_141
LBB1_104:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1868]
	fmul	s6, s0, s6
	str	s6, [sp, #1868]
	cbz	x3, LBB1_106
; %bb.105:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #44]
	fadd	s6, s6, s7
	str	s6, [sp, #1868]
LBB1_106:                               ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_108
; %bb.107:                              ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_108:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #496]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_142
LBB1_109:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1872]
	fmul	s6, s0, s6
	str	s6, [sp, #1872]
	cbz	x3, LBB1_111
; %bb.110:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #48]
	fadd	s6, s6, s7
	str	s6, [sp, #1872]
LBB1_111:                               ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_113
; %bb.112:                              ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_113:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #488]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_143
LBB1_114:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1876]
	fmul	s6, s0, s6
	str	s6, [sp, #1876]
	cbz	x3, LBB1_116
; %bb.115:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #52]
	fadd	s6, s6, s7
	str	s6, [sp, #1876]
LBB1_116:                               ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_118
; %bb.117:                              ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_118:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #480]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_144
LBB1_119:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1880]
	fmul	s6, s0, s6
	str	s6, [sp, #1880]
	cbz	x3, LBB1_121
; %bb.120:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #56]
	fadd	s6, s6, s7
	str	s6, [sp, #1880]
LBB1_121:                               ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_123
; %bb.122:                              ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_123:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #472]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_145
LBB1_124:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	s6, [sp, #1884]
	fmul	s6, s0, s6
	str	s6, [sp, #1884]
	cbz	x3, LBB1_126
; %bb.125:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s7, [x2, #60]
	fadd	s6, s6, s7
	str	s6, [sp, #1884]
LBB1_126:                               ;   in Loop: Header=BB1_50 Depth=3
	fcmp	s6, s4
	b.le	LBB1_128
; %bb.127:                              ;   in Loop: Header=BB1_50 Depth=3
	fmov	d4, d6
LBB1_128:                               ;   in Loop: Header=BB1_50 Depth=3
	add	x11, sp, #1952
	str	s4, [x11, x12, lsl #2]
	fmov	s6, w14
	fcmp	s5, s6
	b.eq	LBB1_146
LBB1_129:                               ;   in Loop: Header=BB1_50 Depth=3
	fsub	s5, s5, s4
	fmov	s6, w15
	fcmp	s5, s6
	fcsel	s5, s6, s5, mi
	fmov	s6, w16
	fmul	s6, s5, s6
	fcmp	s6, #0.0
	fcsel	s7, s3, s2, ge
	fadd	s6, s6, s7
	fcvtzs	z6.s, p0/m, z6.s
	movprfx	z7, z6
	scvtf	z7.s, p0/m, z6.s
	fmov	w11, s6
	fmov	s6, w17
	fmadd	s5, s7, s6, s5
	fmov	s6, w5
	fmadd	s5, s7, s6, s5
	fmov	s6, w6
	fmov	s7, w7
	fmadd	s6, s5, s7, s6
	fmov	s7, w19
	fmadd	s6, s6, s5, s7
	fmov	s7, w20
	fmadd	s6, s6, s5, s7
	fmadd	s6, s6, s5, s3
	fmadd	s6, s6, s5, s1
	fmadd	s5, s6, s5, s1
	add	w11, w21, w11, lsl #23
	fmov	s6, w11
	fmul	s5, s5, s6
	add	x11, sp, #1888
	ldr	s6, [x11, x12, lsl #2]
	cmp	x10, #4
	b.hs	LBB1_147
LBB1_130:                               ;   in Loop: Header=BB1_50 Depth=3
	mov	x2, #0                          ; =0x0
	b	LBB1_150
LBB1_131:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1828]
	ldr	x11, [sp, #592]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_59
LBB1_132:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1832]
	ldr	x11, [sp, #584]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_64
LBB1_133:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1836]
	ldr	x11, [sp, #576]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_69
LBB1_134:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1840]
	ldr	x11, [sp, #560]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_74
LBB1_135:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1844]
	ldr	x11, [sp, #552]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_79
LBB1_136:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1848]
	ldr	x11, [sp, #536]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_84
LBB1_137:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1852]
	ldr	x11, [sp, #528]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_89
LBB1_138:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1856]
	ldr	x11, [sp, #520]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_94
LBB1_139:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1860]
	ldr	x11, [sp, #512]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_99
LBB1_140:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1864]
	ldr	x11, [sp, #504]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_104
LBB1_141:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1868]
	ldr	x11, [sp, #496]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_109
LBB1_142:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1872]
	ldr	x11, [sp, #488]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_114
LBB1_143:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1876]
	ldr	x11, [sp, #480]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_119
LBB1_144:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1880]
	ldr	x11, [sp, #472]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.lt	LBB1_124
LBB1_145:                               ;   in Loop: Header=BB1_50 Depth=3
	str	w14, [sp, #1884]
	add	x11, sp, #1952
	str	s4, [x11, x12, lsl #2]
	fmov	s6, w14
	fcmp	s5, s6
	b.ne	LBB1_129
LBB1_146:                               ;   in Loop: Header=BB1_50 Depth=3
	fmov	s5, #1.00000000
	add	x11, sp, #1888
	ldr	s6, [x11, x12, lsl #2]
	cmp	x10, #4
	b.lo	LBB1_130
LBB1_147:                               ;   in Loop: Header=BB1_50 Depth=3
	mov	x2, x24
	ldr	x11, [sp, #456]                 ; 8-byte Folded Reload
LBB1_148:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldp	s7, s16, [x2, #-8]
	ldp	s17, s18, [x2]
	fmul	s7, s5, s7
	fmul	s16, s5, s16
	fmul	s17, s5, s17
	fmul	s18, s5, s18
	stp	s7, s16, [x2, #-8]
	stp	s17, s18, [x2], #16
	subs	x11, x11, #4
	b.ne	LBB1_148
; %bb.149:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #456]                 ; 8-byte Folded Reload
	mov	x2, x11
	cmp	x10, x11
	b.eq	LBB1_152
LBB1_150:                               ;   in Loop: Header=BB1_50 Depth=3
	sub	x11, x10, x2
	add	x2, x23, x2, lsl #2
LBB1_151:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s7, [x2]
	fmul	s7, s5, s7
	str	s7, [x2], #4
	subs	x11, x11, #1
	b.ne	LBB1_151
LBB1_152:                               ;   in Loop: Header=BB1_50 Depth=3
	mov	x2, #0                          ; =0x0
	fmul	s5, s5, s6
	fmov	s6, wzr
	b	LBB1_154
LBB1_153:                               ;   in Loop: Header=BB1_154 Depth=4
	ldr	s7, [x4, x2, lsl #2]
	fsub	s7, s7, s4
	fmov	s16, w15
	fcmp	s7, s16
	fcsel	s7, s16, s7, mi
	fmov	s16, w16
	fmul	s16, s7, s16
	fcmp	s16, #0.0
	fcsel	s17, s3, s2, ge
	fadd	s16, s16, s17
	fcvtzs	z16.s, p0/m, z16.s
	movprfx	z17, z16
	scvtf	z17.s, p0/m, z16.s
	fmov	w11, s16
	fmov	s16, w17
	fmadd	s7, s17, s16, s7
	fmov	s16, w5
	fmadd	s7, s17, s16, s7
	fmov	s16, w6
	fmov	s17, w7
	fmadd	s16, s7, s17, s16
	fmov	s17, w19
	fmadd	s16, s16, s7, s17
	fmov	s17, w20
	fmadd	s16, s16, s7, s17
	fmadd	s16, s16, s7, s3
	fmadd	s16, s16, s7, s1
	fmadd	s7, s16, s7, s1
	add	w11, w21, w11, lsl #23
	fmov	s16, w11
	fmul	s7, s7, s16
	fadd	s6, s6, s7
	str	s7, [x22, x2, lsl #2]
	add	x2, x2, #1
	cmp	x2, #16
	b.eq	LBB1_156
LBB1_154:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	add	x11, x25, x2
	cmp	x11, x9
	b.lt	LBB1_153
; %bb.155:                              ;   in Loop: Header=BB1_154 Depth=4
	fmov	s7, wzr
	str	s7, [x22, x2, lsl #2]
	add	x2, x2, #1
	cmp	x2, #16
	b.ne	LBB1_154
LBB1_156:                               ;   in Loop: Header=BB1_50 Depth=3
	fadd	s4, s5, s6
	add	x11, sp, #1888
	str	s4, [x11, x12, lsl #2]
	ldr	s4, [sp, #1760]
	fcmp	s4, #0.0
	b.eq	LBB1_159
; %bb.157:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_158:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x1, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_158
LBB1_159:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #728]                 ; 8-byte Folded Reload
	cmp	x11, x9
	ldr	x2, [sp, #568]                  ; 8-byte Folded Reload
	b.ge	LBB1_49
; %bb.160:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1764]
	fcmp	s4, #0.0
	b.eq	LBB1_163
; %bb.161:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_162:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x30, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_162
LBB1_163:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #592]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_49
; %bb.164:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1768]
	fcmp	s4, #0.0
	b.eq	LBB1_167
; %bb.165:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_166:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x13, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_166
LBB1_167:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #584]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_49
; %bb.168:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1772]
	fcmp	s4, #0.0
	ldr	x0, [sp, #320]                  ; 8-byte Folded Reload
	b.eq	LBB1_171
; %bb.169:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_170:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x0, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_170
LBB1_171:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #576]                 ; 8-byte Folded Reload
	cmp	x11, x9
	ldr	x0, [sp, #328]                  ; 8-byte Folded Reload
	b.ge	LBB1_49
; %bb.172:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x14, x13
	ldr	s4, [sp, #1776]
	fcmp	s4, #0.0
	ldr	x13, [sp, #312]                 ; 8-byte Folded Reload
	b.eq	LBB1_175
; %bb.173:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_174:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x13, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_174
LBB1_175:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #560]                 ; 8-byte Folded Reload
	cmp	x11, x9
	mov	x13, x14
	mov	w14, #-8388608                  ; =0xff800000
	b.ge	LBB1_49
; %bb.176:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1780]
	fcmp	s4, #0.0
	ldr	x0, [sp, #304]                  ; 8-byte Folded Reload
	b.eq	LBB1_179
; %bb.177:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_178:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x0, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_178
LBB1_179:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #552]                 ; 8-byte Folded Reload
	cmp	x11, x9
	ldr	x0, [sp, #328]                  ; 8-byte Folded Reload
	b.ge	LBB1_49
; %bb.180:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1784]
	fcmp	s4, #0.0
	ldr	x0, [sp, #296]                  ; 8-byte Folded Reload
	b.eq	LBB1_183
; %bb.181:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_182:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x0, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_182
LBB1_183:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #536]                 ; 8-byte Folded Reload
	cmp	x11, x9
	ldr	x0, [sp, #328]                  ; 8-byte Folded Reload
	b.ge	LBB1_49
; %bb.184:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1788]
	fcmp	s4, #0.0
	ldr	x0, [sp, #280]                  ; 8-byte Folded Reload
	b.eq	LBB1_187
; %bb.185:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_186:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x0, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_186
LBB1_187:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #528]                 ; 8-byte Folded Reload
	cmp	x11, x9
	ldr	x0, [sp, #328]                  ; 8-byte Folded Reload
	b.ge	LBB1_49
; %bb.188:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1792]
	fcmp	s4, #0.0
	ldr	x0, [sp, #264]                  ; 8-byte Folded Reload
	b.eq	LBB1_191
; %bb.189:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_190:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x0, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_190
LBB1_191:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #520]                 ; 8-byte Folded Reload
	cmp	x11, x9
	ldr	x0, [sp, #328]                  ; 8-byte Folded Reload
	b.ge	LBB1_49
; %bb.192:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1796]
	fcmp	s4, #0.0
	ldr	x0, [sp, #256]                  ; 8-byte Folded Reload
	b.eq	LBB1_195
; %bb.193:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_194:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x0, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_194
LBB1_195:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #512]                 ; 8-byte Folded Reload
	cmp	x11, x9
	ldr	x0, [sp, #328]                  ; 8-byte Folded Reload
	b.ge	LBB1_49
; %bb.196:                              ;   in Loop: Header=BB1_50 Depth=3
	str	x13, [sp, #248]                 ; 8-byte Folded Spill
	ldr	s4, [sp, #1800]
	fcmp	s4, #0.0
	b.eq	LBB1_199
; %bb.197:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_198:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	x13, [sp, #288]                 ; 8-byte Folded Reload
	ldr	s5, [x13, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_198
LBB1_199:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #504]                 ; 8-byte Folded Reload
	cmp	x11, x9
	ldr	x13, [sp, #248]                 ; 8-byte Folded Reload
	b.ge	LBB1_49
; %bb.200:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1804]
	fcmp	s4, #0.0
	b.eq	LBB1_203
; %bb.201:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x0, #0                          ; =0x0
LBB1_202:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	x11, [sp, #272]                 ; 8-byte Folded Reload
	ldr	s5, [x11, x0, lsl #2]
	ldr	s6, [x23, x0, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x0, lsl #2]
	add	x0, x0, #1
	cmp	x10, x0
	b.ne	LBB1_202
LBB1_203:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #496]                 ; 8-byte Folded Reload
	cmp	x11, x9
	ldr	x0, [sp, #328]                  ; 8-byte Folded Reload
	b.ge	LBB1_49
; %bb.204:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1808]
	fcmp	s4, #0.0
	b.eq	LBB1_207
; %bb.205:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_206:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x2, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_206
LBB1_207:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #488]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_49
; %bb.208:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1812]
	fcmp	s4, #0.0
	ldr	x2, [sp, #232]                  ; 8-byte Folded Reload
	b.eq	LBB1_211
; %bb.209:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_210:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x2, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_210
LBB1_211:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #480]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_49
; %bb.212:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1816]
	fcmp	s4, #0.0
	ldr	x2, [sp, #224]                  ; 8-byte Folded Reload
	b.eq	LBB1_215
; %bb.213:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_214:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	s5, [x2, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_214
LBB1_215:                               ;   in Loop: Header=BB1_50 Depth=3
	ldr	x11, [sp, #472]                 ; 8-byte Folded Reload
	cmp	x11, x9
	b.ge	LBB1_49
; %bb.216:                              ;   in Loop: Header=BB1_50 Depth=3
	ldr	s4, [sp, #1820]
	fcmp	s4, #0.0
	b.eq	LBB1_49
; %bb.217:                              ;   in Loop: Header=BB1_50 Depth=3
	mov	x11, #0                         ; =0x0
LBB1_218:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_50 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	x2, [sp, #240]                  ; 8-byte Folded Reload
	ldr	s5, [x2, x11, lsl #2]
	ldr	s6, [x23, x11, lsl #2]
	fmadd	s5, s4, s5, s6
	str	s5, [x23, x11, lsl #2]
	add	x11, x11, #1
	cmp	x10, x11
	b.ne	LBB1_218
	b	LBB1_49
LBB1_219:                               ;   in Loop: Header=BB1_4 Depth=1
	ldr	x23, [sp, #152]                 ; 8-byte Folded Reload
	cmp	x23, #1
	mov	x0, x13
	b.lt	LBB1_3
; %bb.220:                              ;   in Loop: Header=BB1_4 Depth=1
	mov	x11, #0                         ; =0x0
	ldp	x13, x12, [sp, #200]            ; 16-byte Folded Reload
	b	LBB1_222
LBB1_221:                               ;   in Loop: Header=BB1_222 Depth=2
	add	x11, x11, #1
	ldr	x1, [sp, #544]                  ; 8-byte Folded Reload
	add	x13, x13, x1
	add	x12, x12, x1
	cmp	x11, x23
	b.ge	LBB1_3
LBB1_222:                               ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_226 Depth 3
                                        ;       Child Loop BB1_229 Depth 3
	add	x1, sp, #1888
	ldr	s4, [x1, x11, lsl #2]
	fcmp	s4, #0.0
	b.eq	LBB1_221
; %bb.223:                              ;   in Loop: Header=BB1_222 Depth=2
	fdiv	s4, s1, s4
	cmp	x10, #4
	b.hs	LBB1_225
; %bb.224:                              ;   in Loop: Header=BB1_222 Depth=2
	mov	x1, #0                          ; =0x0
	b	LBB1_228
LBB1_225:                               ;   in Loop: Header=BB1_222 Depth=2
	mov	x2, x13
	ldr	x1, [sp, #456]                  ; 8-byte Folded Reload
LBB1_226:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_222 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	s5, s6, [x2, #-8]
	ldp	s7, s16, [x2]
	fmul	s5, s4, s5
	fmul	s6, s4, s6
	fmul	s7, s4, s7
	fmul	s16, s4, s16
	stp	s5, s6, [x2, #-8]
	stp	s7, s16, [x2], #16
	subs	x1, x1, #4
	b.ne	LBB1_226
; %bb.227:                              ;   in Loop: Header=BB1_222 Depth=2
	ldr	x2, [sp, #456]                  ; 8-byte Folded Reload
	mov	x1, x2
	cmp	x10, x2
	b.eq	LBB1_221
LBB1_228:                               ;   in Loop: Header=BB1_222 Depth=2
	sub	x2, x10, x1
	add	x1, x12, x1, lsl #2
LBB1_229:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_222 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	s5, [x1]
	fmul	s5, s4, s5
	str	s5, [x1], #4
	subs	x2, x2, #1
	b.ne	LBB1_229
	b	LBB1_221
                                        ; -- End function
.subsections_via_symbols
