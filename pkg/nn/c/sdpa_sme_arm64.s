	.build_version macos, 15, 0	sdk_version 15, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_sdpa_fmopa_f32                 ; -- Begin function sdpa_fmopa_f32
	.p2align	2
_sdpa_fmopa_f32:                        ; @sdpa_fmopa_f32
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
	sub	sp, sp, #2, lsl #12             ; =8192
	sub	sp, sp, #2464
	str	x4, [sp, #1040]                 ; 8-byte Folded Spill
	str	x3, [sp, #1048]                 ; 8-byte Folded Spill
	stp	x1, x2, [sp, #88]               ; 16-byte Folded Spill
	str	x0, [sp, #712]                  ; 8-byte Folded Spill
	ldp	x14, x21, [x5]
	ldr	x10, [x5, #16]
	cmp	x14, #1
	ccmp	x21, #1, #8, ge
	ccmp	x10, #1, #8, ge
	b.ge	LBB0_2
LBB0_1:
	add	sp, sp, #2, lsl #12             ; =8192
	add	sp, sp, #2464
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
LBB0_2:
	mov	x13, #0                         ; =0x0
	mov	x24, #0                         ; =0x0
	add	x12, sp, #2, lsl #12            ; =8192
	add	x12, x12, #2208
	add	x8, sp, #1, lsl #12             ; =4096
	add	x8, x8, #2208
	add	x9, x8, #64
	ptrue	p0.s
	ld1rw	{ z0.s }, p0/z, [x6]
	ldr	x8, [sp, #1048]                 ; 8-byte Folded Reload
	add	x8, x8, #64
	str	x8, [sp, #904]                  ; 8-byte Folded Spill
	add	x8, x9, #1984
	str	x8, [sp, #696]                  ; 8-byte Folded Spill
	add	x8, x9, #2048
	str	x8, [sp, #424]                  ; 8-byte Folded Spill
	add	x8, x9, #64
	str	x8, [sp, #896]                  ; 8-byte Folded Spill
	add	x8, x9, #192
	str	x8, [sp, #888]                  ; 8-byte Folded Spill
	add	x8, x9, #320
	str	x8, [sp, #880]                  ; 8-byte Folded Spill
	add	x8, x9, #448
	str	x8, [sp, #872]                  ; 8-byte Folded Spill
	add	x8, x9, #576
	str	x8, [sp, #864]                  ; 8-byte Folded Spill
	add	x8, x9, #704
	str	x8, [sp, #856]                  ; 8-byte Folded Spill
	add	x8, x9, #832
	str	x8, [sp, #848]                  ; 8-byte Folded Spill
	add	x8, x9, #960
	str	x8, [sp, #840]                  ; 8-byte Folded Spill
	add	x8, x9, #1088
	str	x8, [sp, #832]                  ; 8-byte Folded Spill
	add	x8, x9, #1216
	str	x8, [sp, #824]                  ; 8-byte Folded Spill
	add	x8, x9, #1344
	str	x8, [sp, #816]                  ; 8-byte Folded Spill
	add	x8, x9, #1472
	str	x8, [sp, #808]                  ; 8-byte Folded Spill
	add	x8, x9, #1600
	str	x8, [sp, #800]                  ; 8-byte Folded Spill
	add	x8, x9, #1728
	str	x8, [sp, #792]                  ; 8-byte Folded Spill
	add	x8, x9, #1856
	str	x8, [sp, #784]                  ; 8-byte Folded Spill
	add	x8, x9, #128
	str	x8, [sp, #688]                  ; 8-byte Folded Spill
	fmov	s1, #1.00000000
	ptrue	p1.b
	mov	w11, #44106                     ; =0xac4a
	movk	w11, #49838, lsl #16
	mov	w15, #43579                     ; =0xaa3b
	movk	w15, #16312, lsl #16
	fmov	s2, #-0.50000000
	fmov	s3, #0.50000000
	mov	w16, #34953                     ; =0x8889
	movk	w16, #15368, lsl #16
	mov	w8, #32768                      ; =0x8000
	movk	w8, #16177, lsl #16
	mov	z4.s, w8
	mov	w8, #32899                      ; =0x8083
	movk	w8, #47454, lsl #16
	mov	z5.s, w8
	mov	w8, #2913                       ; =0xb61
	movk	w8, #15030, lsl #16
	mov	z6.s, w11
	mov	z7.s, w15
	mov	z16.s, w16
	mov	z17.s, w8
	fmov	z18.s, #0.50000000
	fmov	z19.s, #1.00000000
	add	x8, x9, #256
	str	x8, [sp, #680]                  ; 8-byte Folded Spill
	add	x8, x9, #384
	str	x8, [sp, #672]                  ; 8-byte Folded Spill
	add	x8, x9, #512
	str	x8, [sp, #664]                  ; 8-byte Folded Spill
	add	x8, x9, #640
	str	x8, [sp, #656]                  ; 8-byte Folded Spill
	add	x8, x9, #768
	str	x8, [sp, #648]                  ; 8-byte Folded Spill
	add	x8, x9, #896
	str	x8, [sp, #640]                  ; 8-byte Folded Spill
	add	x8, x9, #1024
	str	x8, [sp, #632]                  ; 8-byte Folded Spill
	add	x8, x9, #1152
	str	x8, [sp, #624]                  ; 8-byte Folded Spill
	add	x8, x9, #1280
	str	x8, [sp, #616]                  ; 8-byte Folded Spill
	add	x8, x9, #1408
	str	x8, [sp, #608]                  ; 8-byte Folded Spill
	add	x8, x9, #1536
	str	x8, [sp, #600]                  ; 8-byte Folded Spill
	add	x8, x9, #1664
	str	x8, [sp, #592]                  ; 8-byte Folded Spill
	add	x8, x9, #1792
	str	x8, [sp, #584]                  ; 8-byte Folded Spill
	add	x8, x9, #1920
	str	x8, [sp, #576]                  ; 8-byte Folded Spill
	add	x8, x9, #2112
	str	x8, [sp, #568]                  ; 8-byte Folded Spill
	add	x8, x9, #2240
	str	x8, [sp, #560]                  ; 8-byte Folded Spill
	add	x8, x9, #2368
	str	x8, [sp, #552]                  ; 8-byte Folded Spill
	add	x8, x9, #2496
	str	x8, [sp, #544]                  ; 8-byte Folded Spill
	add	x8, x9, #2624
	str	x8, [sp, #536]                  ; 8-byte Folded Spill
	add	x8, x9, #2752
	str	x8, [sp, #528]                  ; 8-byte Folded Spill
	add	x8, x9, #2880
	str	x8, [sp, #520]                  ; 8-byte Folded Spill
	add	x11, x9, #3008
	add	x8, x9, #3136
	stp	x8, x11, [sp, #504]             ; 16-byte Folded Spill
	add	x11, x9, #3264
	add	x8, x9, #3392
	stp	x8, x11, [sp, #488]             ; 16-byte Folded Spill
	add	x11, x9, #3520
	add	x8, x9, #3648
	stp	x8, x11, [sp, #472]             ; 16-byte Folded Spill
	add	x11, x9, #3776
	add	x8, x9, #3904
	stp	x8, x11, [sp, #456]             ; 16-byte Folded Spill
	add	x11, x9, #2176
	add	x8, x9, #2304
	stp	x8, x11, [sp, #408]             ; 16-byte Folded Spill
	add	x11, x9, #2432
	add	x8, x9, #2560
	stp	x8, x11, [sp, #392]             ; 16-byte Folded Spill
	add	x11, x9, #2688
	add	x8, x9, #2816
	stp	x8, x11, [sp, #376]             ; 16-byte Folded Spill
	add	x11, x9, #2944
	add	x8, x9, #3072
	stp	x8, x11, [sp, #360]             ; 16-byte Folded Spill
	add	x11, x9, #3200
	add	x8, x9, #3328
	stp	x8, x11, [sp, #344]             ; 16-byte Folded Spill
	add	x11, x9, #3456
	add	x8, x9, #3584
	stp	x8, x11, [sp, #328]             ; 16-byte Folded Spill
	add	x11, x9, #3712
	add	x8, x9, #3840
	stp	x8, x11, [sp, #312]             ; 16-byte Folded Spill
	str	x9, [sp, #704]                  ; 8-byte Folded Spill
	add	x8, x9, #3968
	str	x8, [sp, #304]                  ; 8-byte Folded Spill
	and	x1, x10, #0x7ffffffffffffffc
	ldr	x8, [sp, #1040]                 ; 8-byte Folded Reload
	add	x2, x8, #8
	lsl	x9, x10, #7
	str	x9, [sp, #912]                  ; 8-byte Folded Spill
	lsl	x19, x10, #2
	lsl	x4, x21, #2
	lsl	x20, x14, #2
	add	x9, sp, #2208
	add	x9, x9, #64
	str	x9, [sp, #760]                  ; 8-byte Folded Spill
	mov	x25, #16                        ; =0x10
	add	x30, sp, #2, lsl #12            ; =8192
	add	x30, x30, #2336
	str	x8, [sp, #936]                  ; 8-byte Folded Spill
	mov	x8, x14
	mov	w15, #32                        ; =0x20
	str	x1, [sp, #56]                   ; 8-byte Folded Spill
	str	x4, [sp, #776]                  ; 8-byte Folded Spill
	str	x20, [sp, #768]                 ; 8-byte Folded Spill
	b	LBB0_4
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	ldr	x15, [sp, #208]                 ; 8-byte Folded Reload
	add	x15, x15, #32
	sub	x13, x13, #32
	sub	x8, x8, #32
	ldr	x9, [sp, #912]                  ; 8-byte Folded Reload
	add	x2, x2, x9
	ldr	x11, [sp, #936]                 ; 8-byte Folded Reload
	add	x11, x11, x9
	str	x11, [sp, #936]                 ; 8-byte Folded Spill
	ldr	x9, [sp, #712]                  ; 8-byte Folded Reload
	add	x9, x9, #128
	str	x9, [sp, #712]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #200]                  ; 8-byte Folded Reload
	mov	x24, x9
	cmp	x9, x14
	b.ge	LBB0_1
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
                                        ;       Child Loop BB0_10 Depth 3
                                        ;       Child Loop BB0_13 Depth 3
                                        ;     Child Loop BB0_16 Depth 2
                                        ;       Child Loop BB0_21 Depth 3
                                        ;       Child Loop BB0_27 Depth 3
                                        ;       Child Loop BB0_25 Depth 3
                                        ;       Child Loop BB0_29 Depth 3
                                        ;       Child Loop BB0_37 Depth 3
                                        ;         Child Loop BB0_49 Depth 4
                                        ;       Child Loop BB0_55 Depth 3
                                        ;       Child Loop BB0_57 Depth 3
                                        ;       Child Loop BB0_100 Depth 3
                                        ;         Child Loop BB0_102 Depth 4
                                        ;       Child Loop BB0_63 Depth 3
                                        ;     Child Loop BB0_140 Depth 2
                                        ;       Child Loop BB0_142 Depth 3
	stur	xzr, [x12, #4]
	cmp	x14, x15
	str	x15, [sp, #208]                 ; 8-byte Folded Spill
	csel	x9, x14, x15, lt
	add	w11, w13, w9
	sxtw	x15, w11
	sub	x15, x15, #1
	str	x15, [sp, #728]                 ; 8-byte Folded Spill
	mov	x16, #-36028792732385280        ; =0xff800000ff800000
	str	x16, [sp, #10528]
	str	x16, [sp, #10536]
	add	x15, sp, #2208
	add	x11, x15, w11, sxtw #2
	str	x11, [sp, #720]                 ; 8-byte Folded Spill
	stur	xzr, [x12, #12]
	str	x13, [sp, #224]                 ; 8-byte Folded Spill
	add	x9, x9, x13
	stur	xzr, [x12, #20]
	str	x16, [sp, #10544]
	str	x16, [sp, #10552]
	stur	xzr, [x12, #28]
	stur	xzr, [x12, #36]
	str	x16, [sp, #10560]
	str	x16, [sp, #10568]
	stur	xzr, [x12, #44]
	stur	xzr, [x12, #52]
	str	x16, [sp, #10576]
	str	x16, [sp, #10584]
	str	wzr, [sp, #10400]
	str	wzr, [sp, #10460]
	mov	w11, #-8388608                  ; =0xff800000
	str	w11, [sp, #10592]
	str	w11, [sp, #10596]
	str	xzr, [sp, #10464]
	str	w11, [sp, #10600]
	str	w11, [sp, #10604]
	str	xzr, [sp, #10472]
	str	w11, [sp, #10608]
	str	w11, [sp, #10612]
	str	xzr, [sp, #10480]
	str	w11, [sp, #10616]
	str	w11, [sp, #10620]
	str	xzr, [sp, #10488]
	str	w11, [sp, #10624]
	str	w11, [sp, #10628]
	str	xzr, [sp, #10496]
	str	w11, [sp, #10632]
	str	w11, [sp, #10636]
	str	xzr, [sp, #10504]
	str	w11, [sp, #10640]
	str	w11, [sp, #10644]
	str	xzr, [sp, #10512]
	str	w11, [sp, #10648]
	str	w11, [sp, #10652]
	add	x13, x24, #32
	sub	x11, x14, x24
	str	x13, [sp, #200]                 ; 8-byte Folded Spill
	cmp	x13, x14
	mov	w13, #32                        ; =0x20
	csel	x5, x11, x13, gt
	str	xzr, [sp, #10520]
	cmp	x5, #1
	b.lt	LBB0_14
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x11, #0                         ; =0x0
	ldr	x15, [sp, #936]                 ; 8-byte Folded Reload
	mov	x16, x2
	b	LBB0_7
LBB0_6:                                 ;   in Loop: Header=BB0_7 Depth=2
	add	x11, x11, #1
	add	x16, x16, x19
	add	x15, x15, x19
	cmp	x11, x5
	b.ge	LBB0_14
LBB0_7:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_10 Depth 3
                                        ;       Child Loop BB0_13 Depth 3
	cmp	x10, #4
	b.hs	LBB0_9
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=2
	mov	x0, #0                          ; =0x0
	b	LBB0_12
LBB0_9:                                 ;   in Loop: Header=BB0_7 Depth=2
	mov	x17, x16
	mov	x0, x1
LBB0_10:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stp	xzr, xzr, [x17, #-8]
	add	x17, x17, #16
	subs	x0, x0, #4
	b.ne	LBB0_10
; %bb.11:                               ;   in Loop: Header=BB0_7 Depth=2
	mov	x0, x1
	cmp	x10, x1
	b.eq	LBB0_6
LBB0_12:                                ;   in Loop: Header=BB0_7 Depth=2
	sub	x17, x10, x0
	add	x0, x15, x0, lsl #2
LBB0_13:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	str	wzr, [x0], #4
	subs	x17, x17, #1
	b.ne	LBB0_13
	b	LBB0_6
LBB0_14:                                ;   in Loop: Header=BB0_4 Depth=1
	str	x2, [sp, #216]                  ; 8-byte Folded Spill
	str	wzr, [sp, #1020]                ; 4-byte Folded Spill
	mov	x15, #0                         ; =0x0
	mul	x6, x24, x10
	bic	x7, x9, x9, asr #63
	orr	x9, x24, #0x1
	mul	x2, x9, x10
	orr	x9, x24, #0x2
	mul	x9, x9, x10
	str	x9, [sp, #1000]                 ; 8-byte Folded Spill
	orr	x9, x24, #0x3
	mul	x9, x9, x10
	str	x9, [sp, #944]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x4
	mul	x9, x9, x10
	str	x9, [sp, #752]                  ; 8-byte Folded Spill
	mov	w13, #5                         ; =0x5
	orr	x9, x24, x13
	mul	x9, x9, x10
	str	x9, [sp, #448]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x6
	mul	x9, x9, x10
	str	x9, [sp, #296]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x7
	mul	x9, x9, x10
	str	x9, [sp, #272]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x8
	mul	x9, x9, x10
	str	x9, [sp, #248]                  ; 8-byte Folded Spill
	mov	w13, #9                         ; =0x9
	orr	x9, x24, x13
	mul	x9, x9, x10
	str	x9, [sp, #192]                  ; 8-byte Folded Spill
	mov	w13, #10                        ; =0xa
	orr	x9, x24, x13
	mul	x9, x9, x10
	str	x9, [sp, #168]                  ; 8-byte Folded Spill
	mov	w13, #11                        ; =0xb
	orr	x9, x24, x13
	mul	x9, x9, x10
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	orr	x9, x24, #0xc
	mul	x9, x9, x10
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	mov	w13, #13                        ; =0xd
	orr	x9, x24, x13
	mul	x9, x9, x10
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	orr	x9, x24, #0xe
	mul	x9, x9, x10
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	orr	x9, x24, #0xf
	mul	x9, x9, x10
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	orr	x0, x24, #0x10
	mul	x22, x0, x10
	mov	w9, #17                         ; =0x11
	orr	x9, x24, x9
	str	x9, [sp, #1032]                 ; 8-byte Folded Spill
	mul	x3, x9, x10
	mov	w9, #18                         ; =0x12
	orr	x9, x24, x9
	str	x9, [sp, #1024]                 ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #992]                  ; 8-byte Folded Spill
	mov	w9, #19                         ; =0x13
	orr	x9, x24, x9
	str	x9, [sp, #984]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #928]                  ; 8-byte Folded Spill
	mov	w9, #20                         ; =0x14
	orr	x9, x24, x9
	str	x9, [sp, #920]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #744]                  ; 8-byte Folded Spill
	mov	w9, #21                         ; =0x15
	orr	x9, x24, x9
	str	x9, [sp, #736]                  ; 8-byte Folded Spill
	mul	x11, x9, x10
	mov	w9, #22                         ; =0x16
	orr	x9, x24, x9
	stp	x9, x11, [sp, #432]             ; 16-byte Folded Spill
	mul	x11, x9, x10
	mov	w9, #23                         ; =0x17
	orr	x9, x24, x9
	stp	x9, x11, [sp, #280]             ; 16-byte Folded Spill
	mul	x11, x9, x10
	orr	x9, x24, #0x18
	stp	x9, x11, [sp, #256]             ; 16-byte Folded Spill
	mul	x11, x9, x10
	mov	w9, #25                         ; =0x19
	orr	x9, x24, x9
	stp	x9, x11, [sp, #232]             ; 16-byte Folded Spill
	mul	x11, x9, x10
	mov	w9, #26                         ; =0x1a
	orr	x9, x24, x9
	stp	x9, x11, [sp, #176]             ; 16-byte Folded Spill
	mul	x11, x9, x10
	mov	w9, #27                         ; =0x1b
	orr	x9, x24, x9
	stp	x9, x11, [sp, #152]             ; 16-byte Folded Spill
	mul	x11, x9, x10
	orr	x9, x24, #0x1c
	stp	x9, x11, [sp, #128]             ; 16-byte Folded Spill
	mul	x11, x9, x10
	mov	w9, #29                         ; =0x1d
	orr	x9, x24, x9
	stp	x9, x11, [sp, #104]             ; 16-byte Folded Spill
	mul	x11, x9, x10
	orr	x9, x24, #0x1e
	stp	x9, x11, [sp, #64]              ; 16-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	orr	x9, x24, #0x1f
	ldp	x13, x11, [sp, #88]             ; 16-byte Folded Reload
	str	x11, [sp, #1008]                ; 8-byte Folded Spill
	mov	w16, #32                        ; =0x20
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	str	x5, [sp, #976]                  ; 8-byte Folded Spill
	b	LBB0_16
LBB0_15:                                ;   in Loop: Header=BB0_16 Depth=2
	ldr	w9, [sp, #1020]                 ; 4-byte Folded Reload
	sub	w9, w9, #32
	str	w9, [sp, #1020]                 ; 4-byte Folded Spill
	ldr	x16, [sp, #952]                 ; 8-byte Folded Reload
	add	x16, x16, #32
	ldr	x13, [sp, #960]                 ; 8-byte Folded Reload
	add	x13, x13, #128
	ldr	x9, [sp, #912]                  ; 8-byte Folded Reload
	ldr	x11, [sp, #1008]                ; 8-byte Folded Reload
	add	x11, x11, x9
	str	x11, [sp, #1008]                ; 8-byte Folded Spill
	ldr	x15, [sp, #968]                 ; 8-byte Folded Reload
	cmp	x15, x21
	b.ge	LBB0_137
LBB0_16:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_21 Depth 3
                                        ;       Child Loop BB0_27 Depth 3
                                        ;       Child Loop BB0_25 Depth 3
                                        ;       Child Loop BB0_29 Depth 3
                                        ;       Child Loop BB0_37 Depth 3
                                        ;         Child Loop BB0_49 Depth 4
                                        ;       Child Loop BB0_55 Depth 3
                                        ;       Child Loop BB0_57 Depth 3
                                        ;       Child Loop BB0_100 Depth 3
                                        ;         Child Loop BB0_102 Depth 4
                                        ;       Child Loop BB0_63 Depth 3
	cmp	x21, x16
	str	x16, [sp, #952]                 ; 8-byte Folded Spill
	csel	x16, x21, x16, lt
	add	x11, x15, #32
	sub	x9, x21, x15
	str	x11, [sp, #968]                 ; 8-byte Folded Spill
	cmp	x11, x21
	mov	w11, #32                        ; =0x20
	csel	x11, x9, x11, gt
	zero	{za}
	cmp	x5, #16
	b.eq	LBB0_22
; %bb.17:                               ;   in Loop: Header=BB0_16 Depth=2
	cmp	x5, #32
	b.ne	LBB0_30
; %bb.18:                               ;   in Loop: Header=BB0_16 Depth=2
	cmp	x11, #16
	b.eq	LBB0_26
; %bb.19:                               ;   in Loop: Header=BB0_16 Depth=2
	cmp	x11, #32
	b.ne	LBB0_30
; %bb.20:                               ;   in Loop: Header=BB0_16 Depth=2
	ldr	x9, [sp, #712]                  ; 8-byte Folded Reload
	mov	x17, x13
	mov	x1, x10
LBB0_21:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z20, [x9]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	ldr	z22, [x17]
	ld1w	{ z23.s }, p0/z, [x17, x25, lsl #2]
	fmopa	za0.s, p0/m, p0/m, z20.s, z22.s
	fmopa	za1.s, p0/m, p0/m, z21.s, z22.s
	fmopa	za2.s, p0/m, p0/m, z20.s, z23.s
	fmopa	za3.s, p0/m, p0/m, z21.s, z23.s
	add	x17, x17, x4
	add	x9, x9, x20
	subs	x1, x1, #1
	b.ne	LBB0_21
	b	LBB0_30
LBB0_22:                                ;   in Loop: Header=BB0_16 Depth=2
	cmp	x11, #16
	b.eq	LBB0_28
; %bb.23:                               ;   in Loop: Header=BB0_16 Depth=2
	cmp	x11, #32
	b.ne	LBB0_30
; %bb.24:                               ;   in Loop: Header=BB0_16 Depth=2
	ldr	x9, [sp, #712]                  ; 8-byte Folded Reload
	mov	x17, x13
	mov	x1, x10
LBB0_25:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z20, [x9]
	ldr	z21, [x17]
	ld1w	{ z22.s }, p0/z, [x17, x25, lsl #2]
	fmopa	za0.s, p0/m, p0/m, z20.s, z21.s
	fmopa	za2.s, p0/m, p0/m, z20.s, z22.s
	add	x17, x17, x4
	add	x9, x9, x20
	subs	x1, x1, #1
	b.ne	LBB0_25
	b	LBB0_30
LBB0_26:                                ;   in Loop: Header=BB0_16 Depth=2
	ldr	x9, [sp, #712]                  ; 8-byte Folded Reload
	mov	x17, x13
	mov	x1, x10
LBB0_27:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z20, [x9]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	ldr	z22, [x17]
	fmopa	za0.s, p0/m, p0/m, z20.s, z22.s
	fmopa	za1.s, p0/m, p0/m, z21.s, z22.s
	add	x17, x17, x4
	add	x9, x9, x20
	subs	x1, x1, #1
	b.ne	LBB0_27
	b	LBB0_30
LBB0_28:                                ;   in Loop: Header=BB0_16 Depth=2
	ldr	x9, [sp, #712]                  ; 8-byte Folded Reload
	mov	x17, x13
	mov	x1, x10
LBB0_29:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z20, [x9]
	ldr	z21, [x17]
	fmopa	za0.s, p0/m, p0/m, z20.s, z21.s
	add	x17, x17, x4
	add	x9, x9, x20
	subs	x1, x1, #1
	b.ne	LBB0_29
LBB0_30:                                ;   in Loop: Header=BB0_16 Depth=2
	str	x13, [sp, #960]                 ; 8-byte Folded Spill
	mov	w13, #0                         ; =0x0
	mov	z20.s, p0/m, za0h.s[w13, 0]
	add	x9, sp, #1, lsl #12             ; =4096
	add	x9, x9, #2208
	str	z20, [x9]
	mov	w13, #1                         ; =0x1
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #896]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #2                         ; =0x2
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #888]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #3                         ; =0x3
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #880]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #4                         ; =0x4
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #872]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #5                         ; =0x5
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #864]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #6                         ; =0x6
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #856]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #7                         ; =0x7
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #848]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #8                         ; =0x8
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #840]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #9                         ; =0x9
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #832]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #10                        ; =0xa
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #824]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #11                        ; =0xb
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #816]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #12                        ; =0xc
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #808]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #13                        ; =0xd
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #800]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #14                        ; =0xe
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #792]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #15                        ; =0xf
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #784]                  ; 8-byte Folded Reload
	str	z20, [x9]
	cmp	x11, #17
	b.lt	LBB0_32
; %bb.31:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #0                         ; =0x0
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #704]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #1                         ; =0x1
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #688]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #2                         ; =0x2
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #680]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #3                         ; =0x3
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #672]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #4                         ; =0x4
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #664]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #5                         ; =0x5
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #656]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #6                         ; =0x6
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #648]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #7                         ; =0x7
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #640]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #8                         ; =0x8
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #632]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #9                         ; =0x9
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #624]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #10                        ; =0xa
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #616]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #11                        ; =0xb
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #608]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #12                        ; =0xc
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #600]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #13                        ; =0xd
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #592]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #14                        ; =0xe
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #584]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #15                        ; =0xf
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ldr	x9, [sp, #576]                  ; 8-byte Folded Reload
	str	z20, [x9]
LBB0_32:                                ;   in Loop: Header=BB0_16 Depth=2
	cmp	x5, #17
	b.lt	LBB0_35
; %bb.33:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #0                         ; =0x0
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #696]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #1                         ; =0x1
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #568]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #2                         ; =0x2
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #560]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #3                         ; =0x3
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #552]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #4                         ; =0x4
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #544]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #5                         ; =0x5
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #536]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #6                         ; =0x6
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #528]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #7                         ; =0x7
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #520]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #8                         ; =0x8
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #512]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #9                         ; =0x9
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #504]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #10                        ; =0xa
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #496]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #11                        ; =0xb
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #488]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #12                        ; =0xc
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #480]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #13                        ; =0xd
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #472]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #14                        ; =0xe
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #464]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #15                        ; =0xf
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #456]                  ; 8-byte Folded Reload
	str	z20, [x9]
	cmp	x11, #17
	b.lt	LBB0_35
; %bb.34:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #0                         ; =0x0
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #424]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #1                         ; =0x1
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #416]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #2                         ; =0x2
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #408]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #3                         ; =0x3
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #400]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #4                         ; =0x4
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #392]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #5                         ; =0x5
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #384]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #6                         ; =0x6
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #376]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #7                         ; =0x7
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #368]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #8                         ; =0x8
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #360]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #9                         ; =0x9
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #352]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #10                        ; =0xa
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #344]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #11                        ; =0xb
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #336]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #12                        ; =0xc
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #328]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #13                        ; =0xd
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #320]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #14                        ; =0xe
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #312]                  ; 8-byte Folded Reload
	str	z20, [x9]
	mov	w13, #15                        ; =0xf
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ldr	x9, [sp, #304]                  ; 8-byte Folded Reload
	str	z20, [x9]
LBB0_35:                                ;   in Loop: Header=BB0_16 Depth=2
	mov	x23, #0                         ; =0x0
	ldr	w9, [sp, #1020]                 ; 4-byte Folded Reload
	add	w9, w9, w16
	sxtw	x9, w9
	sub	x16, x9, #1
	ldr	x13, [sp, #760]                 ; 8-byte Folded Reload
	add	x5, x13, x9, lsl #7
	lsl	x9, x15, #2
	ldr	x13, [sp, #1048]                ; 8-byte Folded Reload
	add	x15, x13, x9
	ldr	x13, [sp, #904]                 ; 8-byte Folded Reload
	add	x1, x13, x9
	ldr	x17, [sp, #936]                 ; 8-byte Folded Reload
	b	LBB0_37
LBB0_36:                                ;   in Loop: Header=BB0_37 Depth=3
	fadd	s20, s20, s21
	str	s20, [x12, x23, lsl #2]
	add	x23, x23, #1
	add	x17, x17, x19
	cmp	x23, #32
	b.eq	LBB0_53
LBB0_37:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_49 Depth 4
	cmp	x23, x7
	b.eq	LBB0_53
; %bb.38:                               ;   in Loop: Header=BB0_37 Depth=3
	lsl	x13, x23, #7
	add	x20, sp, #1, lsl #12            ; =4096
	add	x20, x20, #2208
	add	x9, x20, x13
	ld1b	{ z20.b }, p1/z, [x20, x13]
	fmul	z20.s, z0.s, z20.s
	ldr	x13, [sp, #1048]                ; 8-byte Folded Reload
	cbz	x13, LBB0_41
; %bb.39:                               ;   in Loop: Header=BB0_37 Depth=3
	mov	x4, x24
	add	x13, x24, x23
	mov	x24, x21
	mul	x21, x13, x21
	ld1w	{ z21.s }, p0/z, [x15, x21, lsl #2]
	fadd	z20.s, z20.s, z21.s
	str	z20, [x9]
	cmp	x11, #16
	b.le	LBB0_44
; %bb.40:                               ;   in Loop: Header=BB0_37 Depth=3
	add	x20, x9, #64
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fmul	z21.s, z0.s, z21.s
	ld1w	{ z22.s }, p0/z, [x1, x21, lsl #2]
	fadd	z21.s, z21.s, z22.s
	mov	x21, x24
	mov	x24, x4
	b	LBB0_43
LBB0_41:                                ;   in Loop: Header=BB0_37 Depth=3
	str	z20, [x9]
	cmp	x11, #16
	b.le	LBB0_45
; %bb.42:                               ;   in Loop: Header=BB0_37 Depth=3
	add	x20, x9, #64
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fmul	z21.s, z0.s, z21.s
LBB0_43:                                ;   in Loop: Header=BB0_37 Depth=3
	str	z21, [x20]
	fmax	z20.s, p0/m, z20.s, z21.s
	b	LBB0_45
LBB0_44:                                ;   in Loop: Header=BB0_37 Depth=3
	mov	x21, x24
	mov	x24, x4
LBB0_45:                                ;   in Loop: Header=BB0_37 Depth=3
	fmaxv	s21, p0, z20.s
	ldr	s20, [x30, x23, lsl #2]
	fcmp	s20, s21
	fcsel	s21, s20, s21, gt
	str	s21, [x30, x23, lsl #2]
	mov	w13, #-8388608                  ; =0xff800000
	fmov	s22, w13
	fcmp	s20, s22
	b.eq	LBB0_50
; %bb.46:                               ;   in Loop: Header=BB0_37 Depth=3
	fcmp	s20, s21
	b.eq	LBB0_50
; %bb.47:                               ;   in Loop: Header=BB0_37 Depth=3
	fsub	s20, s20, s21
	mov	w13, #44106                     ; =0xac4a
	movk	w13, #49838, lsl #16
	fmov	s22, w13
	fcmp	s20, s22
	fcsel	s20, s22, s20, mi
	mov	w13, #43579                     ; =0xaa3b
	movk	w13, #16312, lsl #16
	fmov	s22, w13
	fmul	s22, s20, s22
	fcmp	s22, #0.0
	fcsel	s23, s3, s2, ge
	fadd	s22, s22, s23
	fcvtzs	z22.s, p0/m, z22.s
	movprfx	z23, z22
	scvtf	z23.s, p0/m, z22.s
	fmov	w13, s22
	mov	w4, #32768                      ; =0x8000
	movk	w4, #48945, lsl #16
	fmov	s22, w4
	fmadd	s20, s23, s22, s20
	mov	w4, #32899                      ; =0x8083
	movk	w4, #14686, lsl #16
	fmov	s22, w4
	fmadd	s20, s23, s22, s20
	mov	w4, #34953                      ; =0x8889
	movk	w4, #15368, lsl #16
	fmov	s22, w4
	mov	w4, #2913                       ; =0xb61
	movk	w4, #15030, lsl #16
	fmov	s23, w4
	fmadd	s22, s20, s23, s22
	mov	w4, #43691                      ; =0xaaab
	movk	w4, #15658, lsl #16
	fmov	s23, w4
	fmadd	s22, s22, s20, s23
	mov	w4, #43691                      ; =0xaaab
	movk	w4, #15914, lsl #16
	fmov	s23, w4
	fmadd	s22, s22, s20, s23
	fmadd	s22, s22, s20, s3
	fmadd	s22, s22, s20, s1
	fmadd	s20, s22, s20, s1
	mov	w4, #1065353216                 ; =0x3f800000
	add	w13, w4, w13, lsl #23
	fmov	s22, w13
	fmul	s22, s20, s22
	ldr	s20, [x12, x23, lsl #2]
	fmul	s20, s22, s20
	str	s20, [x12, x23, lsl #2]
	fcmp	s22, s1
	b.eq	LBB0_51
; %bb.48:                               ;   in Loop: Header=BB0_37 Depth=3
	mov	x20, #0                         ; =0x0
	mov	z22.s, s22
LBB0_49:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ;       Parent Loop BB0_37 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ld1w	{ z23.s }, p0/z, [x17, x20, lsl #2]
	fmul	z23.s, z22.s, z23.s
	st1w	{ z23.s }, p0, [x17, x20, lsl #2]
	add	x20, x20, #16
	cmp	x20, x10
	b.lt	LBB0_49
	b	LBB0_51
LBB0_50:                                ;   in Loop: Header=BB0_37 Depth=3
	ldr	s20, [x12, x23, lsl #2]
LBB0_51:                                ;   in Loop: Header=BB0_37 Depth=3
	mov	z22.s, s21
	ldr	z21, [x9]
	fsub	z21.s, z21.s, z22.s
	fmax	z21.s, p0/m, z21.s, z6.s
	fmul	z23.s, z21.s, z7.s
	movprfx	z25, z23
	fcvtzs	z25.s, p0/m, z23.s
	movprfx	z26, z25
	scvtf	z26.s, p0/m, z25.s
	mov	z23.d, z26.d
	fmsb	z23.s, p0/m, z4.s, z21.s
	fmsb	z26.s, p0/m, z5.s, z23.s
	mov	z21.d, z17.d
	fmad	z21.s, p0/m, z26.s, z16.s
	mov	w13, #43691                     ; =0xaaab
	movk	w13, #15658, lsl #16
	mov	z23.s, w13
	fmad	z21.s, p0/m, z26.s, z23.s
	mov	w13, #43691                     ; =0xaaab
	movk	w13, #15914, lsl #16
	mov	z24.s, w13
	fmad	z21.s, p0/m, z26.s, z24.s
	fmad	z21.s, p0/m, z26.s, z18.s
	fmad	z21.s, p0/m, z26.s, z19.s
	fmad	z21.s, p0/m, z26.s, z19.s
	add	z25.s, z25.s, #127              ; =0x7f
	lsl	z25.s, z25.s, #23
	fmul	z21.s, z21.s, z25.s
	add	x13, sp, #2144
	str	z21, [x13]
	ldr	s25, [sp, #2144]
	ldr	s26, [sp, #2148]
	add	x13, sp, #2208
	add	x20, x13, x23, lsl #2
	str	s25, [x20]
	str	s26, [x20, #128]
	ldr	s25, [sp, #2152]
	ldr	s26, [sp, #2156]
	str	s25, [x20, #256]
	str	s26, [x20, #384]
	ldr	s25, [sp, #2160]
	ldr	s26, [sp, #2164]
	str	s25, [x20, #512]
	str	s26, [x20, #640]
	ldr	s25, [sp, #2168]
	ldr	s26, [sp, #2172]
	str	s25, [x20, #768]
	str	s26, [x20, #896]
	ldr	s25, [sp, #2176]
	ldr	s26, [sp, #2180]
	str	s25, [x20, #1024]
	str	s26, [x20, #1152]
	ldr	s25, [sp, #2184]
	ldr	s26, [sp, #2188]
	str	s25, [x20, #1280]
	str	s26, [x20, #1408]
	ldr	s25, [sp, #2192]
	ldr	s26, [sp, #2196]
	str	s25, [x20, #1536]
	str	s26, [x20, #1664]
	ldr	s25, [sp, #2200]
	ldr	s26, [sp, #2204]
	str	s25, [x20, #1792]
	str	s26, [x20, #1920]
	faddv	s21, p0, z21.s
	cmp	x11, #17
	b.lt	LBB0_36
; %bb.52:                               ;   in Loop: Header=BB0_37 Depth=3
	ld1w	{ z25.s }, p0/z, [x9, x25, lsl #2]
	fsub	z22.s, z25.s, z22.s
	fmax	z22.s, p0/m, z22.s, z6.s
	fmul	z25.s, z22.s, z7.s
	fcvtzs	z25.s, p0/m, z25.s
	movprfx	z26, z25
	scvtf	z26.s, p0/m, z25.s
	mov	z27.d, z26.d
	fmsb	z27.s, p0/m, z4.s, z22.s
	fmsb	z26.s, p0/m, z5.s, z27.s
	mov	z22.d, z17.d
	fmad	z22.s, p0/m, z26.s, z16.s
	fmad	z22.s, p0/m, z26.s, z23.s
	fmad	z22.s, p0/m, z26.s, z24.s
	fmad	z22.s, p0/m, z26.s, z18.s
	fmad	z22.s, p0/m, z26.s, z19.s
	fmad	z22.s, p0/m, z26.s, z19.s
	add	z25.s, z25.s, #127              ; =0x7f
	lsl	z23.s, z25.s, #23
	fmul	z22.s, z22.s, z23.s
	add	x9, sp, #2080
	str	z22, [x9]
	ldr	s23, [sp, #2080]
	ldr	s24, [sp, #2084]
	str	s23, [x20, #2048]
	str	s24, [x20, #2176]
	ldr	s23, [sp, #2088]
	ldr	s24, [sp, #2092]
	str	s23, [x20, #2304]
	str	s24, [x20, #2432]
	ldr	s23, [sp, #2096]
	ldr	s24, [sp, #2100]
	str	s23, [x20, #2560]
	str	s24, [x20, #2688]
	ldr	s23, [sp, #2104]
	ldr	s24, [sp, #2108]
	str	s23, [x20, #2816]
	str	s24, [x20, #2944]
	ldr	s23, [sp, #2112]
	ldr	s24, [sp, #2116]
	str	s23, [x20, #3072]
	str	s24, [x20, #3200]
	ldr	s23, [sp, #2120]
	ldr	s24, [sp, #2124]
	str	s23, [x20, #3328]
	str	s24, [x20, #3456]
	ldr	s23, [sp, #2128]
	ldr	s24, [sp, #2132]
	str	s23, [x20, #3584]
	str	s24, [x20, #3712]
	ldr	s23, [sp, #2136]
	ldr	s24, [sp, #2140]
	str	s23, [x20, #3840]
	str	s24, [x20, #3968]
	faddv	s22, p0, z22.s
	fadd	s21, s21, s22
	b	LBB0_36
LBB0_53:                                ;   in Loop: Header=BB0_16 Depth=2
	ldr	x9, [sp, #976]                  ; 8-byte Folded Reload
	cmp	w9, #31
	b.gt	LBB0_56
; %bb.54:                               ;   in Loop: Header=BB0_16 Depth=2
	ldr	x9, [sp, #720]                  ; 8-byte Folded Reload
	ldr	x15, [sp, #728]                 ; 8-byte Folded Reload
LBB0_55:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	str	wzr, [x9]
	str	wzr, [x9, #128]
	str	wzr, [x9, #256]
	str	wzr, [x9, #384]
	str	wzr, [x9, #512]
	str	wzr, [x9, #640]
	str	wzr, [x9, #768]
	str	wzr, [x9, #896]
	str	wzr, [x9, #1024]
	str	wzr, [x9, #1152]
	str	wzr, [x9, #1280]
	str	wzr, [x9, #1408]
	str	wzr, [x9, #1536]
	str	wzr, [x9, #1664]
	str	wzr, [x9, #1792]
	str	wzr, [x9, #1920]
	str	wzr, [x9, #2048]
	str	wzr, [x9, #2176]
	str	wzr, [x9, #2304]
	str	wzr, [x9, #2432]
	str	wzr, [x9, #2560]
	str	wzr, [x9, #2688]
	str	wzr, [x9, #2816]
	str	wzr, [x9, #2944]
	str	wzr, [x9, #3072]
	str	wzr, [x9, #3200]
	str	wzr, [x9, #3328]
	str	wzr, [x9, #3456]
	str	wzr, [x9, #3584]
	str	wzr, [x9, #3712]
	add	x15, x15, #1
	str	wzr, [x9, #3840]
	str	wzr, [x9, #3968]
	add	x9, x9, #4
	cmp	x15, #31
	b.lt	LBB0_55
LBB0_56:                                ;   in Loop: Header=BB0_16 Depth=2
	cmp	w11, #31
	b.gt	LBB0_58
LBB0_57:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stp	xzr, xzr, [x5, #-64]
	stp	xzr, xzr, [x5, #-48]
	stp	xzr, xzr, [x5, #-32]
	stp	xzr, xzr, [x5, #-16]
	stp	xzr, xzr, [x5]
	stp	xzr, xzr, [x5, #16]
	stp	xzr, xzr, [x5, #32]
	add	x16, x16, #1
	stp	xzr, xzr, [x5, #48]
	add	x5, x5, #128
	cmp	x16, #31
	b.lt	LBB0_57
LBB0_58:                                ;   in Loop: Header=BB0_16 Depth=2
	cmp	x10, #32
	b.hs	LBB0_98
; %bb.59:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	x16, #0                         ; =0x0
	ldr	x4, [sp, #776]                  ; 8-byte Folded Reload
	ldr	x20, [sp, #768]                 ; 8-byte Folded Reload
LBB0_60:                                ;   in Loop: Header=BB0_16 Depth=2
	cmp	x16, x10
	ldr	x5, [sp, #976]                  ; 8-byte Folded Reload
	b.ge	LBB0_15
; %bb.61:                               ;   in Loop: Header=BB0_16 Depth=2
	zero	{za}
	cmp	x11, #1
	b.lt	LBB0_64
; %bb.62:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	x9, #0                          ; =0x0
	ldr	x13, [sp, #1008]                ; 8-byte Folded Reload
	add	x15, x13, x16, lsl #2
	add	x17, sp, #2208
LBB0_63:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z20, [x17]
	ld1w	{ z21.s }, p0/z, [x17, x25, lsl #2]
	ldr	z22, [x15]
	fmopa	za0.s, p0/m, p0/m, z20.s, z22.s
	fmopa	za1.s, p0/m, p0/m, z21.s, z22.s
	add	x9, x9, #1
	add	x17, x17, #128
	add	x15, x15, x19
	cmp	x11, x9
	b.gt	LBB0_63
LBB0_64:                                ;   in Loop: Header=BB0_16 Depth=2
	ldr	x9, [sp, #1040]                 ; 8-byte Folded Reload
	add	x11, x9, x16, lsl #2
	cbz	x8, LBB0_81
; %bb.65:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #0                         ; =0x0
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x11, x6, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x6, lsl #2]
	cmp	x8, #1
	b.eq	LBB0_81
; %bb.66:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #1                         ; =0x1
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x11, x2, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x2, lsl #2]
	cmp	x8, #2
	b.eq	LBB0_81
; %bb.67:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #2                         ; =0x2
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #1000]                 ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #3
	b.eq	LBB0_81
; %bb.68:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #3                         ; =0x3
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #944]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #4
	b.eq	LBB0_81
; %bb.69:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #4                         ; =0x4
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #752]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #5
	b.eq	LBB0_81
; %bb.70:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #5                         ; =0x5
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #448]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #6
	b.eq	LBB0_81
; %bb.71:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #6                         ; =0x6
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #296]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #7
	b.eq	LBB0_81
; %bb.72:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #7                         ; =0x7
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #272]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #8
	b.eq	LBB0_81
; %bb.73:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #8                         ; =0x8
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #248]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #9
	b.eq	LBB0_81
; %bb.74:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #9                         ; =0x9
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #192]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #10
	b.eq	LBB0_81
; %bb.75:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #10                        ; =0xa
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #168]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #11
	b.eq	LBB0_81
; %bb.76:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #11                        ; =0xb
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #12
	b.eq	LBB0_81
; %bb.77:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #12                        ; =0xc
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #120]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #13
	b.eq	LBB0_81
; %bb.78:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #13                        ; =0xd
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #14
	b.eq	LBB0_81
; %bb.79:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #14                        ; =0xe
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	cmp	x8, #15
	b.eq	LBB0_81
; %bb.80:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #15                        ; =0xf
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
LBB0_81:                                ;   in Loop: Header=BB0_16 Depth=2
	cmp	x0, x14
	b.ge	LBB0_15
; %bb.82:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #0                         ; =0x0
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x11, x22, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x22, lsl #2]
	ldr	x9, [sp, #1032]                 ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.83:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #1                         ; =0x1
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x11, x3, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x3, lsl #2]
	ldr	x9, [sp, #1024]                 ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.84:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #2                         ; =0x2
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #992]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #984]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.85:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #3                         ; =0x3
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #928]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #920]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.86:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #4                         ; =0x4
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #744]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #736]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.87:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #5                         ; =0x5
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #440]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #432]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.88:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #6                         ; =0x6
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #288]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #280]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.89:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #7                         ; =0x7
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #264]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.90:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #8                         ; =0x8
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #240]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #232]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.91:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #9                         ; =0x9
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #184]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #176]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.92:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #10                        ; =0xa
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #160]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #152]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.93:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #11                        ; =0xb
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #136]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.94:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #12                        ; =0xc
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.95:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #13                        ; =0xd
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #64]                   ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.96:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #14                        ; =0xe
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_15
; %bb.97:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	w13, #15                        ; =0xf
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ld1w	{ z21.s }, p0/z, [x11, x9, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x11, x9, lsl #2]
	b	LBB0_15
LBB0_98:                                ;   in Loop: Header=BB0_16 Depth=2
	mov	x16, #0                         ; =0x0
	ldr	x5, [sp, #1008]                 ; 8-byte Folded Reload
	mov	w15, #32                        ; =0x20
	ldr	x4, [sp, #776]                  ; 8-byte Folded Reload
	ldr	x20, [sp, #768]                 ; 8-byte Folded Reload
	b	LBB0_100
LBB0_99:                                ;   in Loop: Header=BB0_100 Depth=3
	add	x15, x16, #32
	add	x5, x5, #128
	cmp	x15, x10
	b.gt	LBB0_60
LBB0_100:                               ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_102 Depth 4
	mov	x9, x16
	mov	x16, x15
	zero	{za}
	cmp	x11, #1
	b.lt	LBB0_103
; %bb.101:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	x15, #0                         ; =0x0
	add	x17, sp, #2208
	mov	x1, x5
LBB0_102:                               ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ;       Parent Loop BB0_100 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	z20, [x17]
	ld1w	{ z21.s }, p0/z, [x17, x25, lsl #2]
	ldr	z22, [x1]
	ld1w	{ z23.s }, p0/z, [x1, x25, lsl #2]
	fmopa	za0.s, p0/m, p0/m, z20.s, z22.s
	fmopa	za1.s, p0/m, p0/m, z21.s, z22.s
	fmopa	za2.s, p0/m, p0/m, z20.s, z23.s
	fmopa	za3.s, p0/m, p0/m, z21.s, z23.s
	add	x15, x15, #1
	add	x17, x17, #128
	add	x1, x1, x19
	cmp	x11, x15
	b.gt	LBB0_102
LBB0_103:                               ;   in Loop: Header=BB0_100 Depth=3
	ldr	x13, [sp, #1040]                ; 8-byte Folded Reload
	add	x23, x13, x9, lsl #2
	cbz	x8, LBB0_120
; %bb.104:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #0                         ; =0x0
	mov	z20.s, p0/m, za0h.s[w13, 0]
	add	x9, x23, x6, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x6, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x6, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #1
	b.eq	LBB0_120
; %bb.105:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #1                         ; =0x1
	mov	z20.s, p0/m, za0h.s[w13, 0]
	add	x9, x23, x2, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x2, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x2, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #2
	b.eq	LBB0_120
; %bb.106:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #2                         ; =0x2
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #1000]                ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #3
	b.eq	LBB0_120
; %bb.107:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #3                         ; =0x3
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #944]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #4
	b.eq	LBB0_120
; %bb.108:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #4                         ; =0x4
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #752]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #5
	b.eq	LBB0_120
; %bb.109:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #5                         ; =0x5
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #448]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #6
	b.eq	LBB0_120
; %bb.110:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #6                         ; =0x6
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #296]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #7
	b.eq	LBB0_120
; %bb.111:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #7                         ; =0x7
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #272]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #8
	b.eq	LBB0_120
; %bb.112:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #8                         ; =0x8
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #248]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #9
	b.eq	LBB0_120
; %bb.113:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #9                         ; =0x9
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #192]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #10
	b.eq	LBB0_120
; %bb.114:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #10                        ; =0xa
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #168]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #11
	b.eq	LBB0_120
; %bb.115:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #11                        ; =0xb
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #144]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #12
	b.eq	LBB0_120
; %bb.116:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #12                        ; =0xc
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #120]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #13
	b.eq	LBB0_120
; %bb.117:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #13                        ; =0xd
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #80]                  ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #14
	b.eq	LBB0_120
; %bb.118:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #14                        ; =0xe
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #48]                  ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	cmp	x8, #15
	b.eq	LBB0_120
; %bb.119:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #15                        ; =0xf
	mov	z20.s, p0/m, za0h.s[w13, 0]
	ldr	x15, [sp, #24]                  ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za2h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
LBB0_120:                               ;   in Loop: Header=BB0_100 Depth=3
	cmp	x0, x14
	b.ge	LBB0_99
; %bb.121:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #0                         ; =0x0
	mov	z20.s, p0/m, za1h.s[w13, 0]
	add	x9, x23, x22, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x22, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x22, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #1032]                 ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.122:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #1                         ; =0x1
	mov	z20.s, p0/m, za1h.s[w13, 0]
	add	x9, x23, x3, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x3, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x3, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #1024]                 ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.123:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #2                         ; =0x2
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #992]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #984]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.124:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #3                         ; =0x3
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #928]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #920]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.125:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #4                         ; =0x4
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #744]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #736]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.126:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #5                         ; =0x5
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #440]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #432]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.127:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #6                         ; =0x6
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #288]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #280]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.128:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #7                         ; =0x7
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #264]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.129:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #8                         ; =0x8
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #240]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #232]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.130:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #9                         ; =0x9
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #184]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #176]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.131:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #10                        ; =0xa
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #160]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #152]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.132:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #11                        ; =0xb
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #136]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.133:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #12                        ; =0xc
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #112]                 ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.134:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #13                        ; =0xd
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #72]                  ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #64]                   ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.135:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #14                        ; =0xe
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #40]                  ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	cmp	x9, x14
	b.ge	LBB0_99
; %bb.136:                              ;   in Loop: Header=BB0_100 Depth=3
	mov	w13, #15                        ; =0xf
	mov	z20.s, p0/m, za1h.s[w13, 0]
	ldr	x15, [sp, #16]                  ; 8-byte Folded Reload
	add	x9, x23, x15, lsl #2
	ld1w	{ z21.s }, p0/z, [x23, x15, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x23, x15, lsl #2]
	mov	z20.s, p0/m, za3h.s[w13, 0]
	ld1w	{ z21.s }, p0/z, [x9, x25, lsl #2]
	fadd	z20.s, z20.s, z21.s
	st1w	{ z20.s }, p0, [x9, x25, lsl #2]
	b	LBB0_99
LBB0_137:                               ;   in Loop: Header=BB0_4 Depth=1
	cmp	x5, #1
	ldp	x2, x13, [sp, #216]             ; 16-byte Folded Reload
	ldr	x1, [sp, #56]                   ; 8-byte Folded Reload
	b.lt	LBB0_3
; %bb.138:                              ;   in Loop: Header=BB0_4 Depth=1
	mov	x9, #0                          ; =0x0
	ldr	x11, [sp, #936]                 ; 8-byte Folded Reload
	b	LBB0_140
LBB0_139:                               ;   in Loop: Header=BB0_140 Depth=2
	add	x9, x9, #1
	add	x11, x11, x19
	cmp	x9, x5
	b.ge	LBB0_3
LBB0_140:                               ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_142 Depth 3
	ldr	s20, [x12, x9, lsl #2]
	fcmp	s20, #0.0
	b.eq	LBB0_139
; %bb.141:                              ;   in Loop: Header=BB0_140 Depth=2
	mov	x15, #0                         ; =0x0
	fdiv	s20, s1, s20
	mov	z20.s, s20
LBB0_142:                               ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_140 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ld1w	{ z21.s }, p0/z, [x11, x15, lsl #2]
	fmul	z21.s, z20.s, z21.s
	st1w	{ z21.s }, p0, [x11, x15, lsl #2]
	add	x15, x15, #16
	cmp	x15, x10
	b.lt	LBB0_142
	b	LBB0_139
                                        ; -- End function
	.globl	_sdpa_fmopa_f64                 ; -- Begin function sdpa_fmopa_f64
	.p2align	2
_sdpa_fmopa_f64:                        ; @sdpa_fmopa_f64
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
	sub	sp, sp, #1, lsl #12             ; =4096
	sub	sp, sp, #2016
	str	x3, [sp, #600]                  ; 8-byte Folded Spill
	stp	x1, x2, [sp, #24]               ; 16-byte Folded Spill
	str	x0, [sp, #328]                  ; 8-byte Folded Spill
	ldp	x24, x1, [x5]
	ldr	x10, [x5, #16]
	cmp	x24, #1
	ccmp	x1, #1, #8, ge
	ccmp	x10, #1, #8, ge
	b.ge	LBB1_2
LBB1_1:
	add	sp, sp, #1, lsl #12             ; =4096
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
	mov	x12, #0                         ; =0x0
	mov	x0, #0                          ; =0x0
	add	x8, sp, #736
	add	x9, x8, #64
	ptrue	p0.d
	ld1rd	{ z0.d }, p0/z, [x6]
	ldr	x8, [sp, #600]                  ; 8-byte Folded Reload
	add	x11, x8, #64
	add	x8, x9, #960
	str	x8, [sp, #312]                  ; 8-byte Folded Spill
	add	x8, x9, #1024
	str	x8, [sp, #168]                  ; 8-byte Folded Spill
	add	x8, x9, #64
	stp	x8, x11, [sp, #456]             ; 16-byte Folded Spill
	add	x11, x9, #192
	add	x8, x9, #320
	stp	x8, x11, [sp, #440]             ; 16-byte Folded Spill
	add	x11, x9, #448
	add	x8, x9, #576
	stp	x8, x11, [sp, #424]             ; 16-byte Folded Spill
	add	x11, x9, #704
	add	x8, x9, #832
	stp	x8, x11, [sp, #408]             ; 16-byte Folded Spill
	add	x11, x9, #128
	add	x8, x9, #256
	stp	x8, x11, [sp, #296]             ; 16-byte Folded Spill
	add	x11, x9, #384
	add	x8, x9, #512
	stp	x8, x11, [sp, #280]             ; 16-byte Folded Spill
	add	x11, x9, #640
	add	x8, x9, #768
	stp	x8, x11, [sp, #264]             ; 16-byte Folded Spill
	add	x11, x9, #896
	add	x8, x9, #1088
	stp	x8, x11, [sp, #248]             ; 16-byte Folded Spill
	add	x11, x9, #1216
	add	x8, x9, #1344
	stp	x8, x11, [sp, #232]             ; 16-byte Folded Spill
	fmov	d1, #1.00000000
	ptrue	p1.b
	mov	x11, #18874                     ; =0x49ba
	movk	x11, #524, lsl #16
	movk	x11, #9003, lsl #32
	movk	x11, #49286, lsl #48
	mov	x13, #33534                     ; =0x82fe
	movk	x13, #25899, lsl #16
	movk	x13, #5447, lsl #32
	movk	x13, #16375, lsl #48
	fmov	d2, #-0.50000000
	fmov	d3, #0.50000000
	mov	x14, #40986                     ; =0xa01a
	movk	x14, #6657, lsl #16
	movk	x14, #416, lsl #32
	movk	x14, #16170, lsl #48
	mov	x8, #4276092928                 ; =0xfee00000
	movk	x8, #11842, lsl #32
	movk	x8, #16358, lsl #48
	mov	z4.d, x8
	mov	x8, #15478                      ; =0x3c76
	movk	x8, #13689, lsl #16
	movk	x8, #14831, lsl #32
	movk	x8, #15850, lsl #48
	mov	z5.d, x8
	mov	x8, #40986                      ; =0xa01a
	movk	x8, #6657, lsl #16
	movk	x8, #416, lsl #32
	movk	x8, #16122, lsl #48
	mov	z6.d, x11
	mov	z7.d, x13
	mov	z16.d, x14
	mov	z17.d, x8
	fmov	z18.d, #0.50000000
	fmov	z19.d, #1.00000000
	mov	z20.d, #1023                    ; =0x3ff
	add	x11, x9, #1472
	add	x8, x9, #1600
	stp	x8, x11, [sp, #216]             ; 16-byte Folded Spill
	add	x11, x9, #1728
	add	x8, x9, #1856
	stp	x8, x11, [sp, #200]             ; 16-byte Folded Spill
	add	x11, x9, #1152
	add	x8, x9, #1280
	stp	x8, x11, [sp, #152]             ; 16-byte Folded Spill
	add	x11, x9, #1408
	add	x8, x9, #1536
	stp	x8, x11, [sp, #136]             ; 16-byte Folded Spill
	add	x11, x9, #1664
	add	x8, x9, #1792
	stp	x8, x11, [sp, #120]             ; 16-byte Folded Spill
	str	x9, [sp, #320]                  ; 8-byte Folded Spill
	add	x8, x9, #1920
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
	and	x2, x10, #0x7ffffffffffffffc
	add	x3, x4, #16
	lsl	x8, x10, #7
	str	x8, [sp, #472]                  ; 8-byte Folded Spill
	lsl	x11, x10, #3
	lsl	x22, x1, #3
	lsl	x21, x24, #3
	add	x8, sp, #4064
	add	x8, x8, #64
	stp	x8, x21, [sp, #384]             ; 16-byte Folded Spill
	mov	x5, #8                          ; =0x8
	add	x19, sp, #2784
	add	x20, sp, #2912
	str	x4, [sp, #496]                  ; 8-byte Folded Spill
	mov	x8, x24
	mov	w14, #16                        ; =0x10
	str	x2, [sp, #16]                   ; 8-byte Folded Spill
	str	x22, [sp, #400]                 ; 8-byte Folded Spill
	str	x4, [sp, #376]                  ; 8-byte Folded Spill
	b	LBB1_4
LBB1_3:                                 ;   in Loop: Header=BB1_4 Depth=1
	ldr	x14, [sp, #48]                  ; 8-byte Folded Reload
	add	x14, x14, #16
	sub	x12, x12, #16
	sub	x8, x8, #16
	ldr	x9, [sp, #472]                  ; 8-byte Folded Reload
	add	x3, x3, x9
	ldr	x13, [sp, #496]                 ; 8-byte Folded Reload
	add	x13, x13, x9
	str	x13, [sp, #496]                 ; 8-byte Folded Spill
	ldr	x9, [sp, #328]                  ; 8-byte Folded Reload
	add	x9, x9, #128
	str	x9, [sp, #328]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	mov	x0, x9
	cmp	x9, x24
	b.ge	LBB1_1
LBB1_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_7 Depth 2
                                        ;       Child Loop BB1_10 Depth 3
                                        ;       Child Loop BB1_13 Depth 3
                                        ;     Child Loop BB1_16 Depth 2
                                        ;       Child Loop BB1_21 Depth 3
                                        ;       Child Loop BB1_27 Depth 3
                                        ;       Child Loop BB1_25 Depth 3
                                        ;       Child Loop BB1_29 Depth 3
                                        ;       Child Loop BB1_37 Depth 3
                                        ;         Child Loop BB1_49 Depth 4
                                        ;       Child Loop BB1_55 Depth 3
                                        ;       Child Loop BB1_57 Depth 3
                                        ;       Child Loop BB1_84 Depth 3
                                        ;         Child Loop BB1_86 Depth 4
                                        ;       Child Loop BB1_63 Depth 3
                                        ;     Child Loop BB1_108 Depth 2
                                        ;       Child Loop BB1_110 Depth 3
	cmp	x24, x14
	str	x14, [sp, #48]                  ; 8-byte Folded Spill
	csel	x9, x24, x14, lt
	add	w13, w12, w9
	mov	x15, #-4503599627370496         ; =0xfff0000000000000
	str	x15, [sp, #2912]
	str	x15, [sp, #2920]
	sxtw	x14, w13
	sub	x14, x14, #1
	str	x14, [sp, #344]                 ; 8-byte Folded Spill
	add	x14, sp, #4064
	add	x13, x14, w13, sxtw #3
	str	x13, [sp, #336]                 ; 8-byte Folded Spill
	str	xzr, [sp, #2784]
	str	xzr, [sp, #2792]
	str	x12, [sp, #64]                  ; 8-byte Folded Spill
	add	x9, x9, x12
	str	x15, [sp, #2928]
	str	x15, [sp, #2936]
	str	xzr, [sp, #2800]
	str	xzr, [sp, #2808]
	str	x15, [sp, #2944]
	str	x15, [sp, #2952]
	str	xzr, [sp, #2816]
	str	xzr, [sp, #2824]
	str	x15, [sp, #2960]
	str	x15, [sp, #2968]
	str	xzr, [sp, #2832]
	str	xzr, [sp, #2840]
	str	x15, [sp, #2976]
	str	x15, [sp, #2984]
	str	xzr, [sp, #2848]
	str	xzr, [sp, #2856]
	str	x15, [sp, #2992]
	str	x15, [sp, #3000]
	str	xzr, [sp, #2864]
	str	xzr, [sp, #2872]
	str	x15, [sp, #3008]
	str	x15, [sp, #3016]
	str	xzr, [sp, #2880]
	str	xzr, [sp, #2888]
	str	x15, [sp, #3024]
	str	x15, [sp, #3032]
	add	x12, x0, #16
	sub	x13, x24, x0
	str	x12, [sp, #40]                  ; 8-byte Folded Spill
	cmp	x12, x24
	mov	w12, #16                        ; =0x10
	csel	x23, x13, x12, gt
	str	xzr, [sp, #2896]
	str	xzr, [sp, #2904]
	cmp	x23, #1
	b.lt	LBB1_14
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x13, #0                         ; =0x0
	ldr	x14, [sp, #496]                 ; 8-byte Folded Reload
	mov	x15, x3
	b	LBB1_7
LBB1_6:                                 ;   in Loop: Header=BB1_7 Depth=2
	add	x13, x13, #1
	add	x15, x15, x11
	add	x14, x14, x11
	cmp	x13, x23
	b.ge	LBB1_14
LBB1_7:                                 ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_10 Depth 3
                                        ;       Child Loop BB1_13 Depth 3
	cmp	x10, #4
	b.hs	LBB1_9
; %bb.8:                                ;   in Loop: Header=BB1_7 Depth=2
	mov	x17, #0                         ; =0x0
	b	LBB1_12
LBB1_9:                                 ;   in Loop: Header=BB1_7 Depth=2
	mov	x16, x15
	mov	x17, x2
LBB1_10:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stp	xzr, xzr, [x16, #-16]
	stp	xzr, xzr, [x16], #32
	subs	x17, x17, #4
	b.ne	LBB1_10
; %bb.11:                               ;   in Loop: Header=BB1_7 Depth=2
	mov	x17, x2
	cmp	x10, x2
	b.eq	LBB1_6
LBB1_12:                                ;   in Loop: Header=BB1_7 Depth=2
	sub	x16, x10, x17
	add	x17, x14, x17, lsl #3
LBB1_13:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	str	xzr, [x17], #8
	subs	x16, x16, #1
	b.ne	LBB1_13
	b	LBB1_6
LBB1_14:                                ;   in Loop: Header=BB1_4 Depth=1
	str	x3, [sp, #56]                   ; 8-byte Folded Spill
	str	wzr, [sp, #572]                 ; 4-byte Folded Spill
	mov	x15, #0                         ; =0x0
	mul	x17, x0, x10
	bic	x30, x9, x9, asr #63
	orr	x9, x0, #0x1
	mul	x13, x9, x10
	orr	x9, x0, #0x2
	mul	x9, x9, x10
	str	x9, [sp, #552]                  ; 8-byte Folded Spill
	orr	x9, x0, #0x3
	mul	x9, x9, x10
	str	x9, [sp, #504]                  ; 8-byte Folded Spill
	orr	x9, x0, #0x4
	mul	x9, x9, x10
	str	x9, [sp, #368]                  ; 8-byte Folded Spill
	mov	w12, #5                         ; =0x5
	orr	x9, x0, x12
	mul	x9, x9, x10
	str	x9, [sp, #192]                  ; 8-byte Folded Spill
	orr	x9, x0, #0x6
	mul	x9, x9, x10
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	orr	x9, x0, #0x7
	mul	x9, x9, x10
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	orr	x25, x0, #0x8
	mov	x9, x0
	mul	x0, x25, x10
	mov	w12, #9                         ; =0x9
	orr	x12, x9, x12
	str	x12, [sp, #584]                 ; 8-byte Folded Spill
	mul	x3, x12, x10
	mov	w12, #10                        ; =0xa
	orr	x12, x9, x12
	str	x12, [sp, #576]                 ; 8-byte Folded Spill
	mul	x12, x12, x10
	str	x12, [sp, #536]                 ; 8-byte Folded Spill
	mov	w12, #11                        ; =0xb
	orr	x12, x9, x12
	str	x12, [sp, #528]                 ; 8-byte Folded Spill
	mul	x14, x12, x10
	orr	x12, x9, #0xc
	stp	x12, x14, [sp, #480]            ; 16-byte Folded Spill
	mul	x14, x12, x10
	mov	w12, #13                        ; =0xd
	orr	x12, x9, x12
	stp	x12, x14, [sp, #352]            ; 16-byte Folded Spill
	mul	x14, x12, x10
	orr	x12, x9, #0xe
	stp	x12, x14, [sp, #176]            ; 16-byte Folded Spill
	mul	x12, x12, x10
	str	x12, [sp, #96]                  ; 8-byte Folded Spill
	str	x9, [sp, #592]                  ; 8-byte Folded Spill
	orr	x9, x9, #0xf
	ldp	x12, x14, [sp, #24]             ; 16-byte Folded Reload
	str	x14, [sp, #560]                 ; 8-byte Folded Spill
	str	x12, [sp, #544]                 ; 8-byte Folded Spill
	mov	w14, #16                        ; =0x10
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	b	LBB1_16
LBB1_15:                                ;   in Loop: Header=BB1_16 Depth=2
	ldr	w9, [sp, #572]                  ; 4-byte Folded Reload
	sub	w9, w9, #16
	str	w9, [sp, #572]                  ; 4-byte Folded Spill
	ldr	x14, [sp, #512]                 ; 8-byte Folded Reload
	add	x14, x14, #16
	ldr	x9, [sp, #544]                  ; 8-byte Folded Reload
	add	x9, x9, #128
	str	x9, [sp, #544]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #472]                  ; 8-byte Folded Reload
	ldr	x12, [sp, #560]                 ; 8-byte Folded Reload
	add	x12, x12, x9
	str	x12, [sp, #560]                 ; 8-byte Folded Spill
	ldr	x15, [sp, #520]                 ; 8-byte Folded Reload
	cmp	x15, x1
	ldr	x21, [sp, #392]                 ; 8-byte Folded Reload
	b.ge	LBB1_105
LBB1_16:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_21 Depth 3
                                        ;       Child Loop BB1_27 Depth 3
                                        ;       Child Loop BB1_25 Depth 3
                                        ;       Child Loop BB1_29 Depth 3
                                        ;       Child Loop BB1_37 Depth 3
                                        ;         Child Loop BB1_49 Depth 4
                                        ;       Child Loop BB1_55 Depth 3
                                        ;       Child Loop BB1_57 Depth 3
                                        ;       Child Loop BB1_84 Depth 3
                                        ;         Child Loop BB1_86 Depth 4
                                        ;       Child Loop BB1_63 Depth 3
	cmp	x1, x14
	str	x14, [sp, #512]                 ; 8-byte Folded Spill
	csel	x7, x1, x14, lt
	add	x12, x15, #16
	sub	x9, x1, x15
	str	x12, [sp, #520]                 ; 8-byte Folded Spill
	cmp	x12, x1
	mov	w12, #16                        ; =0x10
	csel	x14, x9, x12, gt
	zero	{za}
	cmp	x23, #8
	b.eq	LBB1_22
; %bb.17:                               ;   in Loop: Header=BB1_16 Depth=2
	cmp	x23, #16
	b.ne	LBB1_30
; %bb.18:                               ;   in Loop: Header=BB1_16 Depth=2
	cmp	x14, #8
	b.eq	LBB1_26
; %bb.19:                               ;   in Loop: Header=BB1_16 Depth=2
	cmp	x14, #16
	b.ne	LBB1_30
; %bb.20:                               ;   in Loop: Header=BB1_16 Depth=2
	ldr	x9, [sp, #328]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #544]                  ; 8-byte Folded Reload
	mov	x6, x10
LBB1_21:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z21, [x9]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	ldr	z23, [x2]
	ld1d	{ z24.d }, p0/z, [x2, x5, lsl #3]
	fmopa	za0.d, p0/m, p0/m, z21.d, z23.d
	fmopa	za1.d, p0/m, p0/m, z22.d, z23.d
	fmopa	za2.d, p0/m, p0/m, z21.d, z24.d
	fmopa	za3.d, p0/m, p0/m, z22.d, z24.d
	add	x2, x2, x22
	add	x9, x9, x21
	subs	x6, x6, #1
	b.ne	LBB1_21
	b	LBB1_30
LBB1_22:                                ;   in Loop: Header=BB1_16 Depth=2
	cmp	x14, #8
	b.eq	LBB1_28
; %bb.23:                               ;   in Loop: Header=BB1_16 Depth=2
	cmp	x14, #16
	b.ne	LBB1_30
; %bb.24:                               ;   in Loop: Header=BB1_16 Depth=2
	ldr	x9, [sp, #328]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #544]                  ; 8-byte Folded Reload
	mov	x6, x10
LBB1_25:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z21, [x9]
	ldr	z22, [x2]
	ld1d	{ z23.d }, p0/z, [x2, x5, lsl #3]
	fmopa	za0.d, p0/m, p0/m, z21.d, z22.d
	fmopa	za2.d, p0/m, p0/m, z21.d, z23.d
	add	x2, x2, x22
	add	x9, x9, x21
	subs	x6, x6, #1
	b.ne	LBB1_25
	b	LBB1_30
LBB1_26:                                ;   in Loop: Header=BB1_16 Depth=2
	ldr	x9, [sp, #328]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #544]                  ; 8-byte Folded Reload
	mov	x6, x10
LBB1_27:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z21, [x9]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	ldr	z23, [x2]
	fmopa	za0.d, p0/m, p0/m, z21.d, z23.d
	fmopa	za1.d, p0/m, p0/m, z22.d, z23.d
	add	x2, x2, x22
	add	x9, x9, x21
	subs	x6, x6, #1
	b.ne	LBB1_27
	b	LBB1_30
LBB1_28:                                ;   in Loop: Header=BB1_16 Depth=2
	ldr	x9, [sp, #328]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #544]                  ; 8-byte Folded Reload
	mov	x6, x10
LBB1_29:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z21, [x9]
	ldr	z22, [x2]
	fmopa	za0.d, p0/m, p0/m, z21.d, z22.d
	add	x2, x2, x22
	add	x9, x9, x21
	subs	x6, x6, #1
	b.ne	LBB1_29
LBB1_30:                                ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z21.d, p0/m, za0h.d[w12, 0]
	add	x9, sp, #736
	str	z21, [x9]
	mov	w12, #1                         ; =0x1
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x9, [sp, #456]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #2                         ; =0x2
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x9, [sp, #448]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #3                         ; =0x3
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x9, [sp, #440]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #4                         ; =0x4
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x9, [sp, #432]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #5                         ; =0x5
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x9, [sp, #424]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #6                         ; =0x6
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x9, [sp, #416]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #7                         ; =0x7
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x9, [sp, #408]                  ; 8-byte Folded Reload
	str	z21, [x9]
	cmp	x14, #9
	b.lt	LBB1_32
; %bb.31:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ldr	x9, [sp, #320]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #1                         ; =0x1
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ldr	x9, [sp, #304]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #2                         ; =0x2
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ldr	x9, [sp, #296]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #3                         ; =0x3
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ldr	x9, [sp, #288]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #4                         ; =0x4
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ldr	x9, [sp, #280]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #5                         ; =0x5
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ldr	x9, [sp, #272]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #6                         ; =0x6
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ldr	x9, [sp, #264]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #7                         ; =0x7
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	str	z21, [x9]
LBB1_32:                                ;   in Loop: Header=BB1_16 Depth=2
	mov	x4, x23
	cmp	x23, #9
	b.lt	LBB1_35
; %bb.33:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x9, [sp, #312]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #1                         ; =0x1
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x9, [sp, #248]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #2                         ; =0x2
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x9, [sp, #240]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #3                         ; =0x3
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x9, [sp, #232]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #4                         ; =0x4
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x9, [sp, #224]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #5                         ; =0x5
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x9, [sp, #216]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #6                         ; =0x6
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x9, [sp, #208]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #7                         ; =0x7
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x9, [sp, #200]                  ; 8-byte Folded Reload
	str	z21, [x9]
	cmp	x14, #9
	b.lt	LBB1_35
; %bb.34:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ldr	x9, [sp, #168]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #1                         ; =0x1
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ldr	x9, [sp, #160]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #2                         ; =0x2
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ldr	x9, [sp, #152]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #3                         ; =0x3
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #4                         ; =0x4
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ldr	x9, [sp, #136]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #5                         ; =0x5
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #6                         ; =0x6
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ldr	x9, [sp, #120]                  ; 8-byte Folded Reload
	str	z21, [x9]
	mov	w12, #7                         ; =0x7
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	str	z21, [x9]
LBB1_35:                                ;   in Loop: Header=BB1_16 Depth=2
	mov	x6, #0                          ; =0x0
	ldr	w9, [sp, #572]                  ; 4-byte Folded Reload
	add	w9, w9, w7
	sxtw	x9, w9
	sub	x22, x9, #1
	ldr	x12, [sp, #384]                 ; 8-byte Folded Reload
	add	x21, x12, x9, lsl #7
	lsl	x9, x15, #3
	ldr	x12, [sp, #600]                 ; 8-byte Folded Reload
	add	x7, x12, x9
	ldr	x12, [sp, #464]                 ; 8-byte Folded Reload
	add	x15, x12, x9
	ldr	x23, [sp, #496]                 ; 8-byte Folded Reload
	b	LBB1_37
LBB1_36:                                ;   in Loop: Header=BB1_37 Depth=3
	fadd	d21, d21, d22
	str	d21, [x19, x6, lsl #3]
	add	x6, x6, #1
	add	x23, x23, x11
	cmp	x6, #16
	b.eq	LBB1_53
LBB1_37:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_49 Depth 4
	cmp	x6, x30
	b.eq	LBB1_53
; %bb.38:                               ;   in Loop: Header=BB1_37 Depth=3
	lsl	x12, x6, #7
	add	x16, sp, #736
	add	x9, x16, x12
	ld1b	{ z21.b }, p1/z, [x16, x12]
	fmul	z21.d, z0.d, z21.d
	ldr	x12, [sp, #600]                 ; 8-byte Folded Reload
	cbz	x12, LBB1_41
; %bb.39:                               ;   in Loop: Header=BB1_37 Depth=3
	ldr	x12, [sp, #592]                 ; 8-byte Folded Reload
	add	x12, x12, x6
	mov	x16, x1
	mul	x1, x12, x1
	ld1d	{ z22.d }, p0/z, [x7, x1, lsl #3]
	fadd	z21.d, z21.d, z22.d
	str	z21, [x9]
	cmp	x14, #8
	b.le	LBB1_44
; %bb.40:                               ;   in Loop: Header=BB1_37 Depth=3
	add	x2, x9, #64
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fmul	z22.d, z0.d, z22.d
	ld1d	{ z23.d }, p0/z, [x15, x1, lsl #3]
	fadd	z22.d, z22.d, z23.d
	mov	x1, x16
	b	LBB1_43
LBB1_41:                                ;   in Loop: Header=BB1_37 Depth=3
	str	z21, [x9]
	cmp	x14, #8
	b.le	LBB1_45
; %bb.42:                               ;   in Loop: Header=BB1_37 Depth=3
	add	x2, x9, #64
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fmul	z22.d, z0.d, z22.d
LBB1_43:                                ;   in Loop: Header=BB1_37 Depth=3
	str	z22, [x2]
	fmax	z21.d, p0/m, z21.d, z22.d
	b	LBB1_45
LBB1_44:                                ;   in Loop: Header=BB1_37 Depth=3
	mov	x1, x16
LBB1_45:                                ;   in Loop: Header=BB1_37 Depth=3
	fmaxv	d22, p0, z21.d
	ldr	d21, [x20, x6, lsl #3]
	fcmp	d21, d22
	fcsel	d22, d21, d22, gt
	str	d22, [x20, x6, lsl #3]
	mov	x12, #-4503599627370496         ; =0xfff0000000000000
	fmov	d23, x12
	fcmp	d21, d23
	b.eq	LBB1_50
; %bb.46:                               ;   in Loop: Header=BB1_37 Depth=3
	fcmp	d21, d22
	b.eq	LBB1_50
; %bb.47:                               ;   in Loop: Header=BB1_37 Depth=3
	fsub	d21, d21, d22
	mov	x12, #18874                     ; =0x49ba
	movk	x12, #524, lsl #16
	movk	x12, #9003, lsl #32
	movk	x12, #49286, lsl #48
	fmov	d23, x12
	fcmp	d21, d23
	fcsel	d21, d23, d21, mi
	mov	x12, #33534                     ; =0x82fe
	movk	x12, #25899, lsl #16
	movk	x12, #5447, lsl #32
	movk	x12, #16375, lsl #48
	fmov	d23, x12
	fmul	d23, d21, d23
	fcmp	d23, #0.0
	fcsel	d24, d3, d2, ge
	fadd	d23, d23, d24
	fcvtzs	z23.d, p0/m, z23.d
	movprfx	z24, z23
	scvtf	z24.d, p0/m, z23.d
	fmov	x12, d23
	mov	x16, #4276092928                ; =0xfee00000
	movk	x16, #11842, lsl #32
	movk	x16, #49126, lsl #48
	fmov	d23, x16
	fmadd	d21, d24, d23, d21
	mov	x16, #15478                     ; =0x3c76
	movk	x16, #13689, lsl #16
	movk	x16, #14831, lsl #32
	movk	x16, #48618, lsl #48
	fmov	d23, x16
	fmadd	d21, d24, d23, d21
	mov	x16, #40986                     ; =0xa01a
	movk	x16, #6657, lsl #16
	movk	x16, #416, lsl #32
	movk	x16, #16170, lsl #48
	fmov	d23, x16
	mov	x16, #40986                     ; =0xa01a
	movk	x16, #6657, lsl #16
	movk	x16, #416, lsl #32
	movk	x16, #16122, lsl #48
	fmov	d24, x16
	fmadd	d23, d21, d24, d23
	mov	x16, #27671                     ; =0x6c17
	movk	x16, #5825, lsl #16
	movk	x16, #49516, lsl #32
	movk	x16, #16214, lsl #48
	fmov	d24, x16
	fmadd	d23, d23, d21, d24
	mov	x16, #1229782938247303441       ; =0x1111111111111111
	movk	x16, #16257, lsl #48
	fmov	d24, x16
	fmadd	d23, d23, d21, d24
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16293, lsl #48
	fmov	d24, x16
	fmadd	d23, d23, d21, d24
	mov	x16, #6148914691236517205       ; =0x5555555555555555
	movk	x16, #16325, lsl #48
	fmov	d24, x16
	fmadd	d23, d23, d21, d24
	fmadd	d23, d23, d21, d3
	fmadd	d23, d23, d21, d1
	fmadd	d21, d23, d21, d1
	mov	x16, #4607182418800017408       ; =0x3ff0000000000000
	add	x12, x16, x12, lsl #52
	fmov	d23, x12
	fmul	d23, d21, d23
	ldr	d21, [x19, x6, lsl #3]
	fmul	d21, d23, d21
	str	d21, [x19, x6, lsl #3]
	fcmp	d23, d1
	b.eq	LBB1_51
; %bb.48:                               ;   in Loop: Header=BB1_37 Depth=3
	mov	x2, #0                          ; =0x0
	mov	z23.d, d23
LBB1_49:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_37 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ld1d	{ z24.d }, p0/z, [x23, x2, lsl #3]
	fmul	z24.d, z23.d, z24.d
	st1d	{ z24.d }, p0, [x23, x2, lsl #3]
	add	x2, x2, #8
	cmp	x2, x10
	b.lt	LBB1_49
	b	LBB1_51
LBB1_50:                                ;   in Loop: Header=BB1_37 Depth=3
	ldr	d21, [x19, x6, lsl #3]
LBB1_51:                                ;   in Loop: Header=BB1_37 Depth=3
	mov	z23.d, d22
	ldr	z22, [x9]
	fsub	z22.d, z22.d, z23.d
	fmax	z22.d, p0/m, z22.d, z6.d
	fmul	z24.d, z22.d, z7.d
	movprfx	z28, z24
	fcvtzs	z28.d, p0/m, z24.d
	movprfx	z29, z28
	scvtf	z29.d, p0/m, z28.d
	mov	z24.d, z29.d
	fmsb	z24.d, p0/m, z4.d, z22.d
	fmsb	z29.d, p0/m, z5.d, z24.d
	mov	z22.d, z17.d
	fmad	z22.d, p0/m, z29.d, z16.d
	mov	x12, #27671                     ; =0x6c17
	movk	x12, #5825, lsl #16
	movk	x12, #49516, lsl #32
	movk	x12, #16214, lsl #48
	mov	z24.d, x12
	fmad	z22.d, p0/m, z29.d, z24.d
	mov	x12, #1229782938247303441       ; =0x1111111111111111
	movk	x12, #16257, lsl #48
	mov	z25.d, x12
	fmad	z22.d, p0/m, z29.d, z25.d
	mov	x12, #6148914691236517205       ; =0x5555555555555555
	movk	x12, #16293, lsl #48
	mov	z26.d, x12
	fmad	z22.d, p0/m, z29.d, z26.d
	mov	x12, #6148914691236517205       ; =0x5555555555555555
	movk	x12, #16325, lsl #48
	mov	z27.d, x12
	fmad	z22.d, p0/m, z29.d, z27.d
	fmad	z22.d, p0/m, z29.d, z18.d
	fmad	z22.d, p0/m, z29.d, z19.d
	fmad	z22.d, p0/m, z29.d, z19.d
	add	z28.d, z28.d, z20.d
	lsl	z28.d, z28.d, #52
	fmul	z22.d, z22.d, z28.d
	add	x12, sp, #672
	str	z22, [x12]
	ldr	d28, [sp, #672]
	ldr	d29, [sp, #680]
	add	x12, sp, #4064
	add	x2, x12, x6, lsl #3
	str	d28, [x2]
	str	d29, [x2, #128]
	ldr	d28, [sp, #688]
	ldr	d29, [sp, #696]
	str	d28, [x2, #256]
	str	d29, [x2, #384]
	ldr	d28, [sp, #704]
	ldr	d29, [sp, #712]
	str	d28, [x2, #512]
	str	d29, [x2, #640]
	ldr	d28, [sp, #720]
	ldr	d29, [sp, #728]
	str	d28, [x2, #768]
	str	d29, [x2, #896]
	faddv	d22, p0, z22.d
	cmp	x14, #9
	b.lt	LBB1_36
; %bb.52:                               ;   in Loop: Header=BB1_37 Depth=3
	ld1d	{ z28.d }, p0/z, [x9, x5, lsl #3]
	fsub	z23.d, z28.d, z23.d
	fmax	z23.d, p0/m, z23.d, z6.d
	fmul	z28.d, z23.d, z7.d
	fcvtzs	z28.d, p0/m, z28.d
	movprfx	z29, z28
	scvtf	z29.d, p0/m, z28.d
	mov	z30.d, z29.d
	fmsb	z30.d, p0/m, z4.d, z23.d
	fmsb	z29.d, p0/m, z5.d, z30.d
	mov	z23.d, z17.d
	fmad	z23.d, p0/m, z29.d, z16.d
	fmad	z23.d, p0/m, z29.d, z24.d
	fmad	z23.d, p0/m, z29.d, z25.d
	fmad	z23.d, p0/m, z29.d, z26.d
	fmad	z23.d, p0/m, z29.d, z27.d
	fmad	z23.d, p0/m, z29.d, z18.d
	fmad	z23.d, p0/m, z29.d, z19.d
	fmad	z23.d, p0/m, z29.d, z19.d
	add	z24.d, z28.d, z20.d
	lsl	z24.d, z24.d, #52
	fmul	z23.d, z23.d, z24.d
	add	x9, sp, #608
	str	z23, [x9]
	ldr	d24, [sp, #608]
	ldr	d25, [sp, #616]
	str	d24, [x2, #1024]
	str	d25, [x2, #1152]
	ldr	d24, [sp, #624]
	ldr	d25, [sp, #632]
	str	d24, [x2, #1280]
	str	d25, [x2, #1408]
	ldr	d24, [sp, #640]
	ldr	d25, [sp, #648]
	str	d24, [x2, #1536]
	str	d25, [x2, #1664]
	ldr	d24, [sp, #656]
	ldr	d25, [sp, #664]
	str	d24, [x2, #1792]
	str	d25, [x2, #1920]
	faddv	d23, p0, z23.d
	fadd	d22, d22, d23
	b	LBB1_36
LBB1_53:                                ;   in Loop: Header=BB1_16 Depth=2
	mov	x23, x4
	cmp	w23, #15
	b.gt	LBB1_56
; %bb.54:                               ;   in Loop: Header=BB1_16 Depth=2
	ldp	x9, x15, [sp, #336]             ; 16-byte Folded Reload
LBB1_55:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	str	xzr, [x9]
	str	xzr, [x9, #128]
	str	xzr, [x9, #256]
	str	xzr, [x9, #384]
	str	xzr, [x9, #512]
	str	xzr, [x9, #640]
	str	xzr, [x9, #768]
	str	xzr, [x9, #896]
	str	xzr, [x9, #1024]
	str	xzr, [x9, #1152]
	str	xzr, [x9, #1280]
	str	xzr, [x9, #1408]
	str	xzr, [x9, #1536]
	str	xzr, [x9, #1664]
	add	x15, x15, #1
	str	xzr, [x9, #1792]
	str	xzr, [x9, #1920]
	add	x9, x9, #8
	cmp	x15, #15
	b.lt	LBB1_55
LBB1_56:                                ;   in Loop: Header=BB1_16 Depth=2
	cmp	w14, #15
	b.gt	LBB1_58
LBB1_57:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stp	xzr, xzr, [x21, #-64]
	stp	xzr, xzr, [x21, #-48]
	stp	xzr, xzr, [x21, #-32]
	stp	xzr, xzr, [x21, #-16]
	stp	xzr, xzr, [x21]
	stp	xzr, xzr, [x21, #16]
	stp	xzr, xzr, [x21, #32]
	add	x22, x22, #1
	stp	xzr, xzr, [x21, #48]
	add	x21, x21, #128
	cmp	x22, #15
	b.lt	LBB1_57
LBB1_58:                                ;   in Loop: Header=BB1_16 Depth=2
	cmp	x10, #16
	b.hs	LBB1_82
; %bb.59:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	x21, #0                         ; =0x0
	ldr	x4, [sp, #376]                  ; 8-byte Folded Reload
	ldr	x22, [sp, #400]                 ; 8-byte Folded Reload
LBB1_60:                                ;   in Loop: Header=BB1_16 Depth=2
	cmp	x21, x10
	b.ge	LBB1_15
; %bb.61:                               ;   in Loop: Header=BB1_16 Depth=2
	zero	{za}
	cmp	x14, #1
	b.lt	LBB1_64
; %bb.62:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	x9, #0                          ; =0x0
	ldr	x12, [sp, #560]                 ; 8-byte Folded Reload
	add	x15, x12, x21, lsl #3
	add	x2, sp, #4064
LBB1_63:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z21, [x2]
	ld1d	{ z22.d }, p0/z, [x2, x5, lsl #3]
	ldr	z23, [x15]
	fmopa	za0.d, p0/m, p0/m, z21.d, z23.d
	fmopa	za1.d, p0/m, p0/m, z22.d, z23.d
	add	x9, x9, #1
	add	x2, x2, #128
	add	x15, x15, x11
	cmp	x14, x9
	b.gt	LBB1_63
LBB1_64:                                ;   in Loop: Header=BB1_16 Depth=2
	add	x9, x4, x21, lsl #3
	cbz	x8, LBB1_73
; %bb.65:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x17, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x17, lsl #3]
	cmp	x8, #1
	b.eq	LBB1_73
; %bb.66:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #1                         ; =0x1
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x13, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x13, lsl #3]
	cmp	x8, #2
	b.eq	LBB1_73
; %bb.67:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #2                         ; =0x2
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #552]                 ; 8-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x12, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x12, lsl #3]
	cmp	x8, #3
	b.eq	LBB1_73
; %bb.68:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #3                         ; =0x3
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #504]                 ; 8-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x12, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x12, lsl #3]
	cmp	x8, #4
	b.eq	LBB1_73
; %bb.69:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #4                         ; =0x4
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #368]                 ; 8-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x12, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x12, lsl #3]
	cmp	x8, #5
	b.eq	LBB1_73
; %bb.70:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #5                         ; =0x5
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #192]                 ; 8-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x12, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x12, lsl #3]
	cmp	x8, #6
	b.eq	LBB1_73
; %bb.71:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #6                         ; =0x6
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #104]                 ; 8-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x12, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x12, lsl #3]
	cmp	x8, #7
	b.eq	LBB1_73
; %bb.72:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #7                         ; =0x7
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #80]                  ; 8-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x12, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x12, lsl #3]
LBB1_73:                                ;   in Loop: Header=BB1_16 Depth=2
	cmp	x25, x24
	b.ge	LBB1_15
; %bb.74:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x0, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x0, lsl #3]
	ldr	x12, [sp, #584]                 ; 8-byte Folded Reload
	cmp	x12, x24
	b.ge	LBB1_15
; %bb.75:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #1                         ; =0x1
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x3, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x3, lsl #3]
	ldr	x12, [sp, #576]                 ; 8-byte Folded Reload
	cmp	x12, x24
	b.ge	LBB1_15
; %bb.76:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #2                         ; =0x2
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #536]                 ; 8-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x12, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x12, lsl #3]
	ldr	x12, [sp, #528]                 ; 8-byte Folded Reload
	cmp	x12, x24
	b.ge	LBB1_15
; %bb.77:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #3                         ; =0x3
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldp	x12, x14, [sp, #480]            ; 16-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x14, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x14, lsl #3]
	cmp	x12, x24
	b.ge	LBB1_15
; %bb.78:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #4                         ; =0x4
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldp	x12, x14, [sp, #352]            ; 16-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x14, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x14, lsl #3]
	cmp	x12, x24
	b.ge	LBB1_15
; %bb.79:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #5                         ; =0x5
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldp	x12, x14, [sp, #176]            ; 16-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x14, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x14, lsl #3]
	cmp	x12, x24
	b.ge	LBB1_15
; %bb.80:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #6                         ; =0x6
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldp	x12, x14, [sp, #88]             ; 16-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x14, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x14, lsl #3]
	cmp	x12, x24
	b.ge	LBB1_15
; %bb.81:                               ;   in Loop: Header=BB1_16 Depth=2
	mov	w12, #7                         ; =0x7
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #72]                  ; 8-byte Folded Reload
	ld1d	{ z22.d }, p0/z, [x9, x12, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x12, lsl #3]
	b	LBB1_15
LBB1_82:                                ;   in Loop: Header=BB1_16 Depth=2
	mov	x21, #0                         ; =0x0
	ldr	x15, [sp, #560]                 ; 8-byte Folded Reload
	mov	w2, #16                         ; =0x10
	ldr	x4, [sp, #376]                  ; 8-byte Folded Reload
	ldr	x22, [sp, #400]                 ; 8-byte Folded Reload
	b	LBB1_84
LBB1_83:                                ;   in Loop: Header=BB1_84 Depth=3
	add	x2, x21, #16
	add	x15, x15, #128
	cmp	x2, x10
	b.gt	LBB1_60
LBB1_84:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_86 Depth 4
	mov	x9, x21
	mov	x21, x2
	zero	{za}
	cmp	x14, #1
	b.lt	LBB1_87
; %bb.85:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	x2, #0                          ; =0x0
	add	x6, sp, #4064
	mov	x7, x15
LBB1_86:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_16 Depth=2
                                        ;       Parent Loop BB1_84 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	z21, [x6]
	ld1d	{ z22.d }, p0/z, [x6, x5, lsl #3]
	ldr	z23, [x7]
	ld1d	{ z24.d }, p0/z, [x7, x5, lsl #3]
	fmopa	za0.d, p0/m, p0/m, z21.d, z23.d
	fmopa	za1.d, p0/m, p0/m, z22.d, z23.d
	fmopa	za2.d, p0/m, p0/m, z21.d, z24.d
	fmopa	za3.d, p0/m, p0/m, z22.d, z24.d
	add	x2, x2, #1
	add	x6, x6, #128
	add	x7, x7, x11
	cmp	x14, x2
	b.gt	LBB1_86
LBB1_87:                                ;   in Loop: Header=BB1_84 Depth=3
	add	x6, x4, x9, lsl #3
	cbz	x8, LBB1_96
; %bb.88:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #0                         ; =0x0
	mov	z21.d, p0/m, za0h.d[w12, 0]
	add	x9, x6, x17, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x17, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x17, lsl #3]
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	cmp	x8, #1
	b.eq	LBB1_96
; %bb.89:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #1                         ; =0x1
	mov	z21.d, p0/m, za0h.d[w12, 0]
	add	x9, x6, x13, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x13, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x13, lsl #3]
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	cmp	x8, #2
	b.eq	LBB1_96
; %bb.90:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #2                         ; =0x2
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x16, [sp, #552]                 ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	cmp	x8, #3
	b.eq	LBB1_96
; %bb.91:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #3                         ; =0x3
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x16, [sp, #504]                 ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	cmp	x8, #4
	b.eq	LBB1_96
; %bb.92:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #4                         ; =0x4
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x16, [sp, #368]                 ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	cmp	x8, #5
	b.eq	LBB1_96
; %bb.93:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #5                         ; =0x5
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x16, [sp, #192]                 ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	cmp	x8, #6
	b.eq	LBB1_96
; %bb.94:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #6                         ; =0x6
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x16, [sp, #104]                 ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	cmp	x8, #7
	b.eq	LBB1_96
; %bb.95:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #7                         ; =0x7
	mov	z21.d, p0/m, za0h.d[w12, 0]
	ldr	x16, [sp, #80]                  ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za2h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
LBB1_96:                                ;   in Loop: Header=BB1_84 Depth=3
	cmp	x25, x24
	b.ge	LBB1_83
; %bb.97:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #0                         ; =0x0
	mov	z21.d, p0/m, za1h.d[w12, 0]
	add	x9, x6, x0, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x0, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x0, lsl #3]
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	ldr	x9, [sp, #584]                  ; 8-byte Folded Reload
	cmp	x9, x24
	b.ge	LBB1_83
; %bb.98:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #1                         ; =0x1
	mov	z21.d, p0/m, za1h.d[w12, 0]
	add	x9, x6, x3, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x3, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x3, lsl #3]
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	ldr	x9, [sp, #576]                  ; 8-byte Folded Reload
	cmp	x9, x24
	b.ge	LBB1_83
; %bb.99:                               ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #2                         ; =0x2
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x16, [sp, #536]                 ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	ldr	x9, [sp, #528]                  ; 8-byte Folded Reload
	cmp	x9, x24
	b.ge	LBB1_83
; %bb.100:                              ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #3                         ; =0x3
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x16, [sp, #488]                 ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	ldr	x9, [sp, #480]                  ; 8-byte Folded Reload
	cmp	x9, x24
	b.ge	LBB1_83
; %bb.101:                              ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #4                         ; =0x4
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x16, [sp, #360]                 ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	ldr	x9, [sp, #352]                  ; 8-byte Folded Reload
	cmp	x9, x24
	b.ge	LBB1_83
; %bb.102:                              ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #5                         ; =0x5
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x16, [sp, #184]                 ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	ldr	x9, [sp, #176]                  ; 8-byte Folded Reload
	cmp	x9, x24
	b.ge	LBB1_83
; %bb.103:                              ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #6                         ; =0x6
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x16, [sp, #96]                  ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	cmp	x9, x24
	b.ge	LBB1_83
; %bb.104:                              ;   in Loop: Header=BB1_84 Depth=3
	mov	w12, #7                         ; =0x7
	mov	z21.d, p0/m, za1h.d[w12, 0]
	ldr	x16, [sp, #72]                  ; 8-byte Folded Reload
	add	x9, x6, x16, lsl #3
	ld1d	{ z22.d }, p0/z, [x6, x16, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x6, x16, lsl #3]
	mov	z21.d, p0/m, za3h.d[w12, 0]
	ld1d	{ z22.d }, p0/z, [x9, x5, lsl #3]
	fadd	z21.d, z21.d, z22.d
	st1d	{ z21.d }, p0, [x9, x5, lsl #3]
	b	LBB1_83
LBB1_105:                               ;   in Loop: Header=BB1_4 Depth=1
	cmp	x23, #1
	ldp	x3, x12, [sp, #56]              ; 16-byte Folded Reload
	ldr	x2, [sp, #16]                   ; 8-byte Folded Reload
	b.lt	LBB1_3
; %bb.106:                              ;   in Loop: Header=BB1_4 Depth=1
	mov	x9, #0                          ; =0x0
	ldr	x13, [sp, #496]                 ; 8-byte Folded Reload
	b	LBB1_108
LBB1_107:                               ;   in Loop: Header=BB1_108 Depth=2
	add	x9, x9, #1
	add	x13, x13, x11
	cmp	x9, x23
	b.ge	LBB1_3
LBB1_108:                               ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_110 Depth 3
	ldr	d21, [x19, x9, lsl #3]
	fcmp	d21, #0.0
	b.eq	LBB1_107
; %bb.109:                              ;   in Loop: Header=BB1_108 Depth=2
	mov	x14, #0                         ; =0x0
	fdiv	d21, d1, d21
	mov	z21.d, d21
LBB1_110:                               ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_108 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ld1d	{ z22.d }, p0/z, [x13, x14, lsl #3]
	fmul	z22.d, z21.d, z22.d
	st1d	{ z22.d }, p0, [x13, x14, lsl #3]
	add	x14, x14, #8
	cmp	x14, x10
	b.lt	LBB1_110
	b	LBB1_107
                                        ; -- End function
	.globl	_sdpa_causal_fmopa_f32          ; -- Begin function sdpa_causal_fmopa_f32
	.p2align	2
_sdpa_causal_fmopa_f32:                 ; @sdpa_causal_fmopa_f32
; %bb.0:
	str	x25, [sp, #-80]!                ; 8-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	sub	sp, sp, #2, lsl #12             ; =8192
	sub	sp, sp, #1680
	stp	x1, x2, [sp, #120]              ; 16-byte Folded Spill
	str	x0, [sp, #736]                  ; 8-byte Folded Spill
	ldp	x16, x17, [x4]
	ldr	x10, [x4, #16]
	cmp	x16, #1
	ccmp	x17, #1, #8, ge
	ccmp	x10, #1, #8, ge
	b.ge	LBB2_2
LBB2_1:
	add	sp, sp, #2, lsl #12             ; =8192
	add	sp, sp, #1680
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldr	x25, [sp], #80                  ; 8-byte Folded Reload
	ret
LBB2_2:
	mov	x13, #0                         ; =0x0
	mov	x2, #0                          ; =0x0
	add	x25, sp, #1, lsl #12            ; =4096
	add	x25, x25, #1424
	add	x9, x25, #64
	sub	x8, x17, x16
	ptrue	p0.s
	ld1rw	{ z0.s }, p0/z, [x5]
	str	x8, [sp, #9880]                 ; 8-byte Folded Spill
	sub	x8, x8, #1
	str	x8, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x9, #1984
	str	x8, [sp, #704]                  ; 8-byte Folded Spill
	add	x8, x9, #2048
	str	x8, [sp, #432]                  ; 8-byte Folded Spill
	add	x8, x9, #64
	str	x8, [sp, #1056]                 ; 8-byte Folded Spill
	add	x8, x9, #192
	str	x8, [sp, #1048]                 ; 8-byte Folded Spill
	add	x8, x9, #320
	str	x8, [sp, #1040]                 ; 8-byte Folded Spill
	add	x8, x9, #448
	str	x8, [sp, #1032]                 ; 8-byte Folded Spill
	add	x8, x9, #576
	str	x8, [sp, #1024]                 ; 8-byte Folded Spill
	add	x8, x9, #704
	str	x8, [sp, #1016]                 ; 8-byte Folded Spill
	add	x8, x9, #832
	str	x8, [sp, #1008]                 ; 8-byte Folded Spill
	add	x8, x9, #960
	str	x8, [sp, #1000]                 ; 8-byte Folded Spill
	add	x8, x9, #1088
	str	x8, [sp, #992]                  ; 8-byte Folded Spill
	add	x8, x9, #1216
	str	x8, [sp, #984]                  ; 8-byte Folded Spill
	add	x8, x9, #1344
	str	x8, [sp, #976]                  ; 8-byte Folded Spill
	add	x8, x9, #1472
	str	x8, [sp, #968]                  ; 8-byte Folded Spill
	add	x8, x9, #1600
	str	x8, [sp, #960]                  ; 8-byte Folded Spill
	fmov	s1, #1.00000000
	mov	w8, #44106                      ; =0xac4a
	movk	w8, #49838, lsl #16
	mov	z2.s, w8
	mov	w8, #43579                      ; =0xaa3b
	movk	w8, #16312, lsl #16
	mov	z3.s, w8
	mov	w8, #32768                      ; =0x8000
	movk	w8, #16177, lsl #16
	mov	z4.s, w8
	mov	w8, #32899                      ; =0x8083
	movk	w8, #47454, lsl #16
	mov	z5.s, w8
	mov	w8, #34953                      ; =0x8889
	movk	w8, #15368, lsl #16
	mov	z6.s, w8
	mov	w8, #2913                       ; =0xb61
	movk	w8, #15030, lsl #16
	mov	z7.s, w8
	mov	w8, #43691                      ; =0xaaab
	movk	w8, #15658, lsl #16
	mov	z16.s, w8
	mov	w8, #43691                      ; =0xaaab
	movk	w8, #15914, lsl #16
	mov	z17.s, w8
	fmov	z18.s, #0.50000000
	fmov	z19.s, #1.00000000
	fmov	s20, #-0.50000000
	fmov	s21, #0.50000000
	add	x8, x9, #1728
	str	x8, [sp, #952]                  ; 8-byte Folded Spill
	add	x8, x9, #1856
	str	x8, [sp, #944]                  ; 8-byte Folded Spill
	add	x8, x9, #128
	str	x8, [sp, #696]                  ; 8-byte Folded Spill
	add	x8, x9, #256
	str	x8, [sp, #688]                  ; 8-byte Folded Spill
	add	x8, x9, #384
	str	x8, [sp, #680]                  ; 8-byte Folded Spill
	add	x8, x9, #512
	str	x8, [sp, #672]                  ; 8-byte Folded Spill
	add	x8, x9, #640
	str	x8, [sp, #664]                  ; 8-byte Folded Spill
	add	x8, x9, #768
	str	x8, [sp, #656]                  ; 8-byte Folded Spill
	add	x8, x9, #896
	str	x8, [sp, #648]                  ; 8-byte Folded Spill
	add	x8, x9, #1024
	str	x8, [sp, #640]                  ; 8-byte Folded Spill
	add	x8, x9, #1152
	str	x8, [sp, #632]                  ; 8-byte Folded Spill
	add	x8, x9, #1280
	str	x8, [sp, #624]                  ; 8-byte Folded Spill
	add	x8, x9, #1408
	str	x8, [sp, #616]                  ; 8-byte Folded Spill
	add	x8, x9, #1536
	str	x8, [sp, #608]                  ; 8-byte Folded Spill
	add	x8, x9, #1664
	str	x8, [sp, #600]                  ; 8-byte Folded Spill
	add	x8, x9, #1792
	str	x8, [sp, #592]                  ; 8-byte Folded Spill
	add	x8, x9, #1920
	str	x8, [sp, #584]                  ; 8-byte Folded Spill
	add	x8, x9, #2112
	str	x8, [sp, #576]                  ; 8-byte Folded Spill
	add	x8, x9, #2240
	str	x8, [sp, #568]                  ; 8-byte Folded Spill
	add	x8, x9, #2368
	str	x8, [sp, #560]                  ; 8-byte Folded Spill
	add	x8, x9, #2496
	str	x8, [sp, #552]                  ; 8-byte Folded Spill
	add	x8, x9, #2624
	str	x8, [sp, #544]                  ; 8-byte Folded Spill
	add	x8, x9, #2752
	str	x8, [sp, #536]                  ; 8-byte Folded Spill
	add	x8, x9, #2880
	str	x8, [sp, #528]                  ; 8-byte Folded Spill
	add	x8, x9, #3008
	str	x8, [sp, #520]                  ; 8-byte Folded Spill
	add	x11, x9, #3136
	add	x8, x9, #3264
	stp	x8, x11, [sp, #504]             ; 16-byte Folded Spill
	add	x11, x9, #3392
	add	x8, x9, #3520
	stp	x8, x11, [sp, #488]             ; 16-byte Folded Spill
	add	x11, x9, #3648
	add	x8, x9, #3776
	stp	x8, x11, [sp, #472]             ; 16-byte Folded Spill
	add	x8, x9, #3904
	str	x8, [sp, #464]                  ; 8-byte Folded Spill
	add	x11, x9, #2176
	add	x8, x9, #2304
	stp	x8, x11, [sp, #416]             ; 16-byte Folded Spill
	add	x11, x9, #2432
	add	x8, x9, #2560
	stp	x8, x11, [sp, #400]             ; 16-byte Folded Spill
	add	x11, x9, #2688
	add	x8, x9, #2816
	stp	x8, x11, [sp, #384]             ; 16-byte Folded Spill
	add	x11, x9, #2944
	add	x8, x9, #3072
	stp	x8, x11, [sp, #368]             ; 16-byte Folded Spill
	add	x11, x9, #3200
	add	x8, x9, #3328
	stp	x8, x11, [sp, #352]             ; 16-byte Folded Spill
	add	x11, x9, #3456
	add	x8, x9, #3584
	stp	x8, x11, [sp, #336]             ; 16-byte Folded Spill
	add	x11, x9, #3712
	add	x8, x9, #3840
	stp	x8, x11, [sp, #320]             ; 16-byte Folded Spill
	str	x9, [sp, #712]                  ; 8-byte Folded Spill
	add	x8, x9, #3968
	str	x8, [sp, #312]                  ; 8-byte Folded Spill
	and	x0, x10, #0x7ffffffffffffffc
	add	x1, x3, #8
	lsl	x8, x10, #7
	str	x8, [sp, #1128]                 ; 8-byte Folded Spill
	lsl	x21, x10, #2
	lsl	x5, x17, #2
	lsl	x19, x16, #2
	add	x8, sp, #1424
	add	x8, x8, #64
	str	x8, [sp, #928]                  ; 8-byte Folded Spill
	mov	w30, #-8388608                  ; =0xff800000
	mov	x4, #16                         ; =0x10
	str	x3, [sp, #1176]                 ; 8-byte Folded Spill
	mov	x8, x16
	mov	w12, #32                        ; =0x20
	str	x17, [sp, #1064]                ; 8-byte Folded Spill
	str	x0, [sp, #80]                   ; 8-byte Folded Spill
	str	x5, [sp, #936]                  ; 8-byte Folded Spill
	str	x19, [sp, #920]                 ; 8-byte Folded Spill
	b	LBB2_4
LBB2_3:                                 ;   in Loop: Header=BB2_4 Depth=1
	ldr	x12, [sp, #240]                 ; 8-byte Folded Reload
	add	x12, x12, #32
	sub	x13, x13, #32
	sub	x8, x8, #32
	ldr	x9, [sp, #1128]                 ; 8-byte Folded Reload
	add	x1, x1, x9
	ldr	x11, [sp, #1176]                ; 8-byte Folded Reload
	add	x11, x11, x9
	str	x11, [sp, #1176]                ; 8-byte Folded Spill
	ldr	x9, [sp, #736]                  ; 8-byte Folded Reload
	add	x9, x9, #128
	str	x9, [sp, #736]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #232]                  ; 8-byte Folded Reload
	mov	x2, x9
	cmp	x9, x16
	b.ge	LBB2_1
LBB2_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_7 Depth 2
                                        ;       Child Loop BB2_10 Depth 3
                                        ;       Child Loop BB2_13 Depth 3
                                        ;     Child Loop BB2_16 Depth 2
                                        ;       Child Loop BB2_22 Depth 3
                                        ;       Child Loop BB2_28 Depth 3
                                        ;       Child Loop BB2_26 Depth 3
                                        ;       Child Loop BB2_30 Depth 3
                                        ;       Child Loop BB2_38 Depth 3
                                        ;         Child Loop BB2_142 Depth 4
                                        ;       Child Loop BB2_148 Depth 3
                                        ;       Child Loop BB2_150 Depth 3
                                        ;       Child Loop BB2_193 Depth 3
                                        ;         Child Loop BB2_195 Depth 4
                                        ;       Child Loop BB2_156 Depth 3
                                        ;     Child Loop BB2_233 Depth 2
                                        ;       Child Loop BB2_235 Depth 3
	add	x14, sp, #2, lsl #12            ; =8192
	add	x14, x14, #1424
	stur	xzr, [x14, #4]
	cmp	x16, x12
	str	x12, [sp, #240]                 ; 8-byte Folded Spill
	csel	x9, x16, x12, lt
	add	w11, w13, w9
	sxtw	x12, w11
	sub	x12, x12, #1
	str	x12, [sp, #728]                 ; 8-byte Folded Spill
	mov	x15, #-36028792732385280        ; =0xff800000ff800000
	str	x15, [sp, #9744]
	str	x15, [sp, #9752]
	add	x12, sp, #1424
	add	x11, x12, w11, sxtw #2
	str	x11, [sp, #720]                 ; 8-byte Folded Spill
	stur	xzr, [x14, #12]
	str	x13, [sp, #256]                 ; 8-byte Folded Spill
	add	x9, x9, x13
	stur	xzr, [x14, #20]
	str	x15, [sp, #9760]
	str	x15, [sp, #9768]
	stur	xzr, [x14, #28]
	stur	xzr, [x14, #36]
	str	x15, [sp, #9776]
	str	x15, [sp, #9784]
	stur	xzr, [x14, #44]
	stur	xzr, [x14, #52]
	str	x15, [sp, #9792]
	str	x15, [sp, #9800]
	str	wzr, [sp, #9616]
	str	wzr, [sp, #9676]
	str	w30, [sp, #9808]
	str	w30, [sp, #9812]
	str	xzr, [sp, #9680]
	str	w30, [sp, #9816]
	str	w30, [sp, #9820]
	str	xzr, [sp, #9688]
	str	w30, [sp, #9824]
	str	w30, [sp, #9828]
	str	xzr, [sp, #9696]
	str	w30, [sp, #9832]
	str	w30, [sp, #9836]
	str	xzr, [sp, #9704]
	str	w30, [sp, #9840]
	str	w30, [sp, #9844]
	str	xzr, [sp, #9712]
	str	w30, [sp, #9848]
	str	w30, [sp, #9852]
	str	xzr, [sp, #9720]
	str	w30, [sp, #9856]
	str	w30, [sp, #9860]
	str	xzr, [sp, #9728]
	str	w30, [sp, #9864]
	str	w30, [sp, #9868]
	add	x12, x2, #32
	sub	x11, x16, x2
	str	x12, [sp, #232]                 ; 8-byte Folded Spill
	cmp	x12, x16
	mov	w12, #32                        ; =0x20
	csel	x6, x11, x12, gt
	str	xzr, [sp, #9736]
	cmp	x6, #1
	b.lt	LBB2_14
; %bb.5:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x11, #0                         ; =0x0
	ldr	x12, [sp, #1176]                ; 8-byte Folded Reload
	mov	x13, x1
	b	LBB2_7
LBB2_6:                                 ;   in Loop: Header=BB2_7 Depth=2
	add	x11, x11, #1
	add	x13, x13, x21
	add	x12, x12, x21
	cmp	x11, x6
	b.ge	LBB2_14
LBB2_7:                                 ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_10 Depth 3
                                        ;       Child Loop BB2_13 Depth 3
	cmp	x10, #4
	b.hs	LBB2_9
; %bb.8:                                ;   in Loop: Header=BB2_7 Depth=2
	mov	x15, #0                         ; =0x0
	b	LBB2_12
LBB2_9:                                 ;   in Loop: Header=BB2_7 Depth=2
	mov	x14, x13
	mov	x15, x0
LBB2_10:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stp	xzr, xzr, [x14, #-8]
	add	x14, x14, #16
	subs	x15, x15, #4
	b.ne	LBB2_10
; %bb.11:                               ;   in Loop: Header=BB2_7 Depth=2
	mov	x15, x0
	cmp	x10, x0
	b.eq	LBB2_6
LBB2_12:                                ;   in Loop: Header=BB2_7 Depth=2
	sub	x14, x10, x15
	add	x15, x12, x15, lsl #2
LBB2_13:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	str	wzr, [x15], #4
	subs	x14, x14, #1
	b.ne	LBB2_13
	b	LBB2_6
LBB2_14:                                ;   in Loop: Header=BB2_4 Depth=1
	str	x1, [sp, #248]                  ; 8-byte Folded Spill
	str	xzr, [sp, #1280]                ; 8-byte Folded Spill
	mov	x24, #0                         ; =0x0
	mul	x11, x2, x10
	str	x6, [sp, #1264]                 ; 8-byte Folded Spill
	add	x12, x2, x6
	ldr	x13, [sp, #88]                  ; 8-byte Folded Reload
	add	x12, x13, x12
	str	x12, [sp, #1160]                ; 8-byte Folded Spill
	orr	x12, x2, #0x1
	mul	x20, x12, x10
	orr	x12, x2, #0x2
	bic	x1, x9, x9, asr #63
	mul	x9, x12, x10
	str	x9, [sp, #1120]                 ; 8-byte Folded Spill
	orr	x9, x2, #0x3
	mul	x9, x9, x10
	str	x9, [sp, #1192]                 ; 8-byte Folded Spill
	orr	x9, x2, #0x4
	mul	x9, x9, x10
	str	x9, [sp, #760]                  ; 8-byte Folded Spill
	mov	w12, #5                         ; =0x5
	orr	x9, x2, x12
	mul	x9, x9, x10
	str	x9, [sp, #456]                  ; 8-byte Folded Spill
	orr	x9, x2, #0x6
	mul	x9, x9, x10
	str	x9, [sp, #304]                  ; 8-byte Folded Spill
	orr	x9, x2, #0x7
	mul	x9, x9, x10
	str	x9, [sp, #280]                  ; 8-byte Folded Spill
	orr	x9, x2, #0x8
	mul	x9, x9, x10
	str	x9, [sp, #224]                  ; 8-byte Folded Spill
	mov	w12, #9                         ; =0x9
	orr	x9, x2, x12
	mul	x9, x9, x10
	str	x9, [sp, #200]                  ; 8-byte Folded Spill
	mov	w12, #10                        ; =0xa
	orr	x9, x2, x12
	mul	x9, x9, x10
	str	x9, [sp, #176]                  ; 8-byte Folded Spill
	mov	w12, #11                        ; =0xb
	orr	x9, x2, x12
	mul	x9, x9, x10
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	orr	x9, x2, #0xc
	mul	x9, x9, x10
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	mov	w12, #13                        ; =0xd
	orr	x9, x2, x12
	mul	x9, x9, x10
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	orr	x9, x2, #0xe
	mul	x9, x9, x10
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	orr	x9, x2, #0xf
	mul	x9, x9, x10
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	orr	x0, x2, #0x10
	mul	x7, x0, x10
	mov	w9, #17                         ; =0x11
	orr	x9, x2, x9
	str	x9, [sp, #1112]                 ; 8-byte Folded Spill
	mul	x23, x9, x10
	mov	w9, #18                         ; =0x12
	orr	x9, x2, x9
	str	x9, [sp, #1288]                 ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #1232]                 ; 8-byte Folded Spill
	mov	w9, #19                         ; =0x13
	orr	x9, x2, x9
	str	x9, [sp, #1224]                 ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #1152]                 ; 8-byte Folded Spill
	mov	w9, #20                         ; =0x14
	orr	x9, x2, x9
	str	x9, [sp, #1144]                 ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #752]                  ; 8-byte Folded Spill
	mov	w9, #21                         ; =0x15
	orr	x9, x2, x9
	str	x9, [sp, #744]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #448]                  ; 8-byte Folded Spill
	mov	w9, #22                         ; =0x16
	orr	x9, x2, x9
	str	x9, [sp, #440]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #296]                  ; 8-byte Folded Spill
	mov	w9, #23                         ; =0x17
	orr	x9, x2, x9
	str	x9, [sp, #288]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #272]                  ; 8-byte Folded Spill
	orr	x9, x2, #0x18
	str	x9, [sp, #264]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #216]                  ; 8-byte Folded Spill
	mov	w9, #25                         ; =0x19
	orr	x9, x2, x9
	str	x9, [sp, #208]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #192]                  ; 8-byte Folded Spill
	mov	w9, #26                         ; =0x1a
	orr	x9, x2, x9
	str	x9, [sp, #184]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #168]                  ; 8-byte Folded Spill
	mov	w9, #27                         ; =0x1b
	orr	x9, x2, x9
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	orr	x9, x2, #0x1c
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	mov	w9, #29                         ; =0x1d
	orr	x9, x2, x9
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	orr	x9, x2, #0x1e
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	orr	x9, x2, #0x1f
	ldp	x12, x13, [sp, #120]            ; 16-byte Folded Reload
	str	x13, [sp, #1256]                ; 8-byte Folded Spill
	str	x12, [sp, #1248]                ; 8-byte Folded Spill
	mov	w13, #32                        ; =0x20
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB2_16
LBB2_15:                                ;   in Loop: Header=BB2_16 Depth=2
	ldr	x13, [sp, #1216]                ; 8-byte Folded Reload
	add	x13, x13, #32
	ldr	x9, [sp, #1280]                 ; 8-byte Folded Reload
	sub	x9, x9, #32
	str	x9, [sp, #1280]                 ; 8-byte Folded Spill
	ldr	x9, [sp, #1248]                 ; 8-byte Folded Reload
	add	x9, x9, #128
	str	x9, [sp, #1248]                 ; 8-byte Folded Spill
	ldr	x9, [sp, #1128]                 ; 8-byte Folded Reload
	ldr	x12, [sp, #1256]                ; 8-byte Folded Reload
	add	x12, x12, x9
	str	x12, [sp, #1256]                ; 8-byte Folded Spill
	ldr	x17, [sp, #1064]                ; 8-byte Folded Reload
	ldr	x24, [sp, #1208]                ; 8-byte Folded Reload
	cmp	x24, x17
	b.ge	LBB2_230
LBB2_16:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_22 Depth 3
                                        ;       Child Loop BB2_28 Depth 3
                                        ;       Child Loop BB2_26 Depth 3
                                        ;       Child Loop BB2_30 Depth 3
                                        ;       Child Loop BB2_38 Depth 3
                                        ;         Child Loop BB2_142 Depth 4
                                        ;       Child Loop BB2_148 Depth 3
                                        ;       Child Loop BB2_150 Depth 3
                                        ;       Child Loop BB2_193 Depth 3
                                        ;         Child Loop BB2_195 Depth 4
                                        ;       Child Loop BB2_156 Depth 3
	str	x13, [sp, #1216]                ; 8-byte Folded Spill
	cmp	x17, x13
	csel	x9, x17, x13, lt
	add	x15, x24, #32
	sub	x13, x17, x24
	cmp	x15, x17
	mov	w14, #32                        ; =0x20
	csel	x13, x13, x14, gt
	ldr	x12, [sp, #1160]                ; 8-byte Folded Reload
	cmp	x24, x12
	b.gt	LBB2_230
; %bb.17:                               ;   in Loop: Header=BB2_16 Depth=2
	zero	{za}
	ldr	x12, [sp, #1264]                ; 8-byte Folded Reload
	cmp	x12, #16
	str	x15, [sp, #1208]                ; 8-byte Folded Spill
	b.eq	LBB2_23
; %bb.18:                               ;   in Loop: Header=BB2_16 Depth=2
	cmp	x12, #32
	b.ne	LBB2_31
; %bb.19:                               ;   in Loop: Header=BB2_16 Depth=2
	cmp	x13, #16
	b.eq	LBB2_27
; %bb.20:                               ;   in Loop: Header=BB2_16 Depth=2
	cmp	x13, #32
	b.ne	LBB2_31
; %bb.21:                               ;   in Loop: Header=BB2_16 Depth=2
	ldr	x14, [sp, #736]                 ; 8-byte Folded Reload
	ldr	x15, [sp, #1248]                ; 8-byte Folded Reload
	mov	x17, x10
LBB2_22:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z22, [x14]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	ldr	z24, [x15]
	ld1w	{ z25.s }, p0/z, [x15, x4, lsl #2]
	fmopa	za0.s, p0/m, p0/m, z22.s, z24.s
	fmopa	za1.s, p0/m, p0/m, z23.s, z24.s
	fmopa	za2.s, p0/m, p0/m, z22.s, z25.s
	fmopa	za3.s, p0/m, p0/m, z23.s, z25.s
	add	x15, x15, x5
	add	x14, x14, x19
	subs	x17, x17, #1
	b.ne	LBB2_22
	b	LBB2_31
LBB2_23:                                ;   in Loop: Header=BB2_16 Depth=2
	cmp	x13, #16
	b.eq	LBB2_29
; %bb.24:                               ;   in Loop: Header=BB2_16 Depth=2
	cmp	x13, #32
	b.ne	LBB2_31
; %bb.25:                               ;   in Loop: Header=BB2_16 Depth=2
	ldr	x14, [sp, #736]                 ; 8-byte Folded Reload
	ldr	x15, [sp, #1248]                ; 8-byte Folded Reload
	mov	x17, x10
LBB2_26:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z22, [x14]
	ldr	z23, [x15]
	ld1w	{ z24.s }, p0/z, [x15, x4, lsl #2]
	fmopa	za0.s, p0/m, p0/m, z22.s, z23.s
	fmopa	za2.s, p0/m, p0/m, z22.s, z24.s
	add	x15, x15, x5
	add	x14, x14, x19
	subs	x17, x17, #1
	b.ne	LBB2_26
	b	LBB2_31
LBB2_27:                                ;   in Loop: Header=BB2_16 Depth=2
	ldr	x14, [sp, #736]                 ; 8-byte Folded Reload
	ldr	x15, [sp, #1248]                ; 8-byte Folded Reload
	mov	x17, x10
LBB2_28:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z22, [x14]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	ldr	z24, [x15]
	fmopa	za0.s, p0/m, p0/m, z22.s, z24.s
	fmopa	za1.s, p0/m, p0/m, z23.s, z24.s
	add	x15, x15, x5
	add	x14, x14, x19
	subs	x17, x17, #1
	b.ne	LBB2_28
	b	LBB2_31
LBB2_29:                                ;   in Loop: Header=BB2_16 Depth=2
	ldr	x14, [sp, #736]                 ; 8-byte Folded Reload
	ldr	x15, [sp, #1248]                ; 8-byte Folded Reload
	mov	x17, x10
LBB2_30:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z22, [x14]
	ldr	z23, [x15]
	fmopa	za0.s, p0/m, p0/m, z22.s, z23.s
	add	x15, x15, x5
	add	x14, x14, x19
	subs	x17, x17, #1
	b.ne	LBB2_30
LBB2_31:                                ;   in Loop: Header=BB2_16 Depth=2
	mov	w14, #0                         ; =0x0
	mov	z22.s, p0/m, za0h.s[w14, 0]
	str	z22, [x25]
	mov	w12, #1                         ; =0x1
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x14, [sp, #1056]                ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #2                         ; =0x2
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x14, [sp, #1048]                ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #3                         ; =0x3
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x14, [sp, #1040]                ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #4                         ; =0x4
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x14, [sp, #1032]                ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #5                         ; =0x5
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x14, [sp, #1024]                ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #6                         ; =0x6
	mov	z22.s, p0/m, za0h.s[w14, 0]
	ldr	x14, [sp, #1016]                ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #7                         ; =0x7
	mov	z22.s, p0/m, za0h.s[w14, 0]
	ldr	x14, [sp, #1008]                ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #8                         ; =0x8
	mov	z22.s, p0/m, za0h.s[w14, 0]
	ldr	x14, [sp, #1000]                ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w15, #9                         ; =0x9
	mov	z22.s, p0/m, za0h.s[w15, 0]
	ldr	x14, [sp, #992]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #10                        ; =0xa
	mov	z22.s, p0/m, za0h.s[w14, 0]
	ldr	x14, [sp, #984]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #11                        ; =0xb
	mov	z22.s, p0/m, za0h.s[w14, 0]
	ldr	x14, [sp, #976]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #12                        ; =0xc
	mov	z22.s, p0/m, za0h.s[w14, 0]
	ldr	x14, [sp, #968]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #13                        ; =0xd
	mov	z22.s, p0/m, za0h.s[w14, 0]
	ldr	x14, [sp, #960]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #14                        ; =0xe
	mov	z22.s, p0/m, za0h.s[w14, 0]
	ldr	x14, [sp, #952]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #15                        ; =0xf
	mov	z22.s, p0/m, za0h.s[w14, 0]
	ldr	x14, [sp, #944]                 ; 8-byte Folded Reload
	str	z22, [x14]
	cmp	x13, #17
	b.lt	LBB2_33
; %bb.32:                               ;   in Loop: Header=BB2_16 Depth=2
	mov	w14, #0                         ; =0x0
	mov	z22.s, p0/m, za2h.s[w14, 0]
	ldr	x14, [sp, #712]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #1                         ; =0x1
	mov	z22.s, p0/m, za2h.s[w14, 0]
	ldr	x14, [sp, #696]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #2                         ; =0x2
	mov	z22.s, p0/m, za2h.s[w14, 0]
	ldr	x14, [sp, #688]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #3                         ; =0x3
	mov	z22.s, p0/m, za2h.s[w14, 0]
	ldr	x14, [sp, #680]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #4                         ; =0x4
	mov	z22.s, p0/m, za2h.s[w14, 0]
	ldr	x14, [sp, #672]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #664]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #6                         ; =0x6
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #656]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #7                         ; =0x7
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #648]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #8                         ; =0x8
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #640]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	z22.s, p0/m, za2h.s[w15, 0]
	ldr	x14, [sp, #632]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #10                        ; =0xa
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #624]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #11                        ; =0xb
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #616]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #12                        ; =0xc
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #608]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #13                        ; =0xd
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #600]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #14                        ; =0xe
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #592]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w12, #15                        ; =0xf
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ldr	x14, [sp, #584]                 ; 8-byte Folded Reload
	str	z22, [x14]
LBB2_33:                                ;   in Loop: Header=BB2_16 Depth=2
	ldr	x12, [sp, #1280]                ; 8-byte Folded Reload
	add	w14, w12, w9
	sxtw	x14, w14
	sub	x17, x14, #1
	ldr	x15, [sp, #928]                 ; 8-byte Folded Reload
	add	x5, x15, x14, lsl #7
	ldr	x14, [sp, #1264]                ; 8-byte Folded Reload
	cmp	x14, #17
	mov	w12, #11                        ; =0xb
	mov	w15, #13                        ; =0xd
	b.lt	LBB2_36
; %bb.34:                               ;   in Loop: Header=BB2_16 Depth=2
	mov	w14, #0                         ; =0x0
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #704]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #1                         ; =0x1
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #576]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #2                         ; =0x2
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #568]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #3                         ; =0x3
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #560]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #4                         ; =0x4
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #552]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #5                         ; =0x5
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #544]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #6                         ; =0x6
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #536]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #7                         ; =0x7
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #528]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #8                         ; =0x8
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #520]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #9                         ; =0x9
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #512]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #10                        ; =0xa
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #504]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x14, [sp, #496]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #12                        ; =0xc
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #488]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	z22.s, p0/m, za1h.s[w15, 0]
	ldr	x14, [sp, #480]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #14                        ; =0xe
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #472]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #15                        ; =0xf
	mov	z22.s, p0/m, za1h.s[w14, 0]
	ldr	x14, [sp, #464]                 ; 8-byte Folded Reload
	str	z22, [x14]
	cmp	x13, #17
	b.lt	LBB2_36
; %bb.35:                               ;   in Loop: Header=BB2_16 Depth=2
	mov	w14, #0                         ; =0x0
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #432]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #1                         ; =0x1
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #424]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #2                         ; =0x2
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #416]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #3                         ; =0x3
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #408]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #4                         ; =0x4
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #400]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #5                         ; =0x5
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #392]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #6                         ; =0x6
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #384]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #7                         ; =0x7
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #376]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #8                         ; =0x8
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #368]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #9                         ; =0x9
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #360]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #10                        ; =0xa
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #352]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ldr	x14, [sp, #344]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #12                        ; =0xc
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #336]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	z22.s, p0/m, za3h.s[w15, 0]
	ldr	x14, [sp, #328]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #14                        ; =0xe
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #320]                 ; 8-byte Folded Reload
	str	z22, [x14]
	mov	w14, #15                        ; =0xf
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ldr	x14, [sp, #312]                 ; 8-byte Folded Reload
	str	z22, [x14]
LBB2_36:                                ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #11                        ; =0xb
	mov	x15, #0                         ; =0x0
	ldr	x14, [sp, #1280]                ; 8-byte Folded Reload
	add	x19, x9, x14
	orr	x9, x24, #0x2
	str	x9, [sp, #1272]                 ; 8-byte Folded Spill
	orr	x9, x24, #0x3
	str	x9, [sp, #1240]                 ; 8-byte Folded Spill
	orr	x9, x24, #0x4
	str	x9, [sp, #1200]                 ; 8-byte Folded Spill
	mov	w14, #5                         ; =0x5
	orr	x9, x24, x14
	str	x9, [sp, #1184]                 ; 8-byte Folded Spill
	orr	x9, x24, #0x6
	str	x9, [sp, #1168]                 ; 8-byte Folded Spill
	orr	x9, x24, #0x7
	str	x9, [sp, #1136]                 ; 8-byte Folded Spill
	orr	x9, x24, #0x8
	str	x9, [sp, #1104]                 ; 8-byte Folded Spill
	mov	w14, #9                         ; =0x9
	orr	x9, x24, x14
	str	x9, [sp, #1096]                 ; 8-byte Folded Spill
	mov	w14, #10                        ; =0xa
	orr	x9, x24, x14
	str	x9, [sp, #1088]                 ; 8-byte Folded Spill
	orr	x9, x24, x12
	str	x9, [sp, #1080]                 ; 8-byte Folded Spill
	orr	x9, x24, #0xc
	str	x9, [sp, #1072]                 ; 8-byte Folded Spill
	mov	w12, #13                        ; =0xd
	orr	x9, x24, x12
	str	x9, [sp, #912]                  ; 8-byte Folded Spill
	orr	x9, x24, #0xe
	str	x9, [sp, #904]                  ; 8-byte Folded Spill
	orr	x9, x24, #0xf
	str	x9, [sp, #896]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x10
	str	x9, [sp, #888]                  ; 8-byte Folded Spill
	mov	w9, #17                         ; =0x11
	orr	x9, x24, x9
	str	x9, [sp, #880]                  ; 8-byte Folded Spill
	mov	w9, #18                         ; =0x12
	orr	x9, x24, x9
	str	x9, [sp, #872]                  ; 8-byte Folded Spill
	mov	w9, #19                         ; =0x13
	orr	x9, x24, x9
	str	x9, [sp, #864]                  ; 8-byte Folded Spill
	mov	w9, #20                         ; =0x14
	orr	x9, x24, x9
	str	x9, [sp, #856]                  ; 8-byte Folded Spill
	mov	w9, #21                         ; =0x15
	orr	x9, x24, x9
	str	x9, [sp, #848]                  ; 8-byte Folded Spill
	mov	w9, #22                         ; =0x16
	orr	x9, x24, x9
	str	x9, [sp, #840]                  ; 8-byte Folded Spill
	mov	w9, #23                         ; =0x17
	orr	x9, x24, x9
	str	x9, [sp, #832]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x18
	str	x9, [sp, #824]                  ; 8-byte Folded Spill
	mov	w9, #25                         ; =0x19
	orr	x9, x24, x9
	str	x9, [sp, #816]                  ; 8-byte Folded Spill
	mov	w9, #26                         ; =0x1a
	orr	x9, x24, x9
	str	x9, [sp, #808]                  ; 8-byte Folded Spill
	mov	w9, #27                         ; =0x1b
	orr	x9, x24, x9
	str	x9, [sp, #800]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x1c
	str	x9, [sp, #792]                  ; 8-byte Folded Spill
	mov	w9, #29                         ; =0x1d
	orr	x9, x24, x9
	str	x9, [sp, #784]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x1e
	str	x9, [sp, #776]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x1f
	str	x9, [sp, #768]                  ; 8-byte Folded Spill
	ldr	x6, [sp, #1176]                 ; 8-byte Folded Reload
	b	LBB2_38
LBB2_37:                                ;   in Loop: Header=BB2_38 Depth=3
	add	x9, sp, #1424
	add	x9, x9, x15, lsl #2
	str	wzr, [x9]
	str	wzr, [x9, #128]
	str	wzr, [x9, #256]
	str	wzr, [x9, #384]
	str	wzr, [x9, #512]
	str	wzr, [x9, #640]
	str	wzr, [x9, #768]
	str	wzr, [x9, #896]
	str	wzr, [x9, #1024]
	str	wzr, [x9, #1152]
	str	wzr, [x9, #1280]
	str	wzr, [x9, #1408]
	str	wzr, [x9, #1536]
	str	wzr, [x9, #1664]
	str	wzr, [x9, #1792]
	str	wzr, [x9, #1920]
	str	wzr, [x9, #2048]
	str	wzr, [x9, #2176]
	str	wzr, [x9, #2304]
	str	wzr, [x9, #2432]
	str	wzr, [x9, #2560]
	str	wzr, [x9, #2688]
	str	wzr, [x9, #2816]
	str	wzr, [x9, #2944]
	str	wzr, [x9, #3072]
	str	wzr, [x9, #3200]
	str	wzr, [x9, #3328]
	str	wzr, [x9, #3456]
	str	wzr, [x9, #3584]
	str	wzr, [x9, #3712]
	str	wzr, [x9, #3840]
	str	wzr, [x9, #3968]
	add	x15, x15, #1
	add	x6, x6, x21
	cmp	x15, #32
	b.eq	LBB2_146
LBB2_38:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB2_142 Depth 4
	cmp	x15, x1
	b.eq	LBB2_146
; %bb.39:                               ;   in Loop: Header=BB2_38 Depth=3
	add	x9, x25, x15, lsl #7
	cmp	x19, #1
	b.lt	LBB2_135
; %bb.40:                               ;   in Loop: Header=BB2_38 Depth=3
	mov	x22, x2
	orr	x14, x2, x15
	ldr	x2, [sp, #9880]                 ; 8-byte Folded Reload
	add	x14, x14, x2
	cmp	x24, x14
	b.le	LBB2_42
; %bb.41:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9]
LBB2_42:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #1
	mov	x2, x22
	b.eq	LBB2_135
; %bb.43:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x24, x14
	b.lt	LBB2_45
; %bb.44:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #4]
LBB2_45:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #2
	b.eq	LBB2_135
; %bb.46:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1272]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_48
; %bb.47:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #8]
LBB2_48:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #3
	b.eq	LBB2_135
; %bb.49:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1240]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_51
; %bb.50:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #12]
LBB2_51:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #4
	b.eq	LBB2_135
; %bb.52:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1200]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_54
; %bb.53:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #16]
LBB2_54:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #5
	b.eq	LBB2_135
; %bb.55:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1184]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_57
; %bb.56:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #20]
LBB2_57:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #6
	b.eq	LBB2_135
; %bb.58:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1168]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_60
; %bb.59:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #24]
LBB2_60:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #7
	b.eq	LBB2_135
; %bb.61:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1136]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_63
; %bb.62:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #28]
LBB2_63:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #8
	b.eq	LBB2_135
; %bb.64:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1104]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_66
; %bb.65:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #32]
LBB2_66:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #9
	b.eq	LBB2_135
; %bb.67:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1096]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_69
; %bb.68:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #36]
LBB2_69:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #10
	b.eq	LBB2_135
; %bb.70:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1088]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_72
; %bb.71:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #40]
LBB2_72:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #11
	b.eq	LBB2_135
; %bb.73:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1080]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_75
; %bb.74:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #44]
LBB2_75:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #12
	b.eq	LBB2_135
; %bb.76:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #1072]                ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_78
; %bb.77:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #48]
LBB2_78:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #13
	b.eq	LBB2_135
; %bb.79:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #912]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_81
; %bb.80:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #52]
LBB2_81:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #14
	b.eq	LBB2_135
; %bb.82:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #904]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_84
; %bb.83:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #56]
LBB2_84:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #15
	b.eq	LBB2_135
; %bb.85:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #896]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_87
; %bb.86:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #60]
LBB2_87:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #16
	b.eq	LBB2_135
; %bb.88:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #888]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_90
; %bb.89:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #64]
LBB2_90:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #17
	b.eq	LBB2_135
; %bb.91:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #880]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_93
; %bb.92:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #68]
LBB2_93:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #18
	b.eq	LBB2_135
; %bb.94:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #872]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_96
; %bb.95:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #72]
LBB2_96:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #19
	b.eq	LBB2_135
; %bb.97:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #864]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_99
; %bb.98:                               ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #76]
LBB2_99:                                ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #20
	b.eq	LBB2_135
; %bb.100:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #856]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_102
; %bb.101:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #80]
LBB2_102:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #21
	b.eq	LBB2_135
; %bb.103:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #848]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_105
; %bb.104:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #84]
LBB2_105:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #22
	b.eq	LBB2_135
; %bb.106:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #840]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_108
; %bb.107:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #88]
LBB2_108:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #23
	b.eq	LBB2_135
; %bb.109:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #832]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_111
; %bb.110:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #92]
LBB2_111:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #24
	b.eq	LBB2_135
; %bb.112:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #824]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_114
; %bb.113:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #96]
LBB2_114:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #25
	b.eq	LBB2_135
; %bb.115:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #816]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_117
; %bb.116:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #100]
LBB2_117:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #26
	b.eq	LBB2_135
; %bb.118:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #808]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_120
; %bb.119:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #104]
LBB2_120:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #27
	add	x25, sp, #1, lsl #12            ; =4096
	add	x25, x25, #1424
	mov	x2, x22
	b.eq	LBB2_135
; %bb.121:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #800]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_123
; %bb.122:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #108]
LBB2_123:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #28
	add	x25, sp, #1, lsl #12            ; =4096
	add	x25, x25, #1424
	mov	x2, x22
	b.eq	LBB2_135
; %bb.124:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #792]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_126
; %bb.125:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #112]
LBB2_126:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #29
	add	x25, sp, #1, lsl #12            ; =4096
	add	x25, x25, #1424
	mov	x2, x22
	b.eq	LBB2_135
; %bb.127:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #784]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_129
; %bb.128:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #116]
LBB2_129:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #30
	add	x25, sp, #1, lsl #12            ; =4096
	add	x25, x25, #1424
	mov	x2, x22
	b.eq	LBB2_135
; %bb.130:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #776]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_132
; %bb.131:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #120]
LBB2_132:                               ;   in Loop: Header=BB2_38 Depth=3
	cmp	x19, #31
	add	x25, sp, #1, lsl #12            ; =4096
	add	x25, x25, #1424
	mov	x2, x22
	b.eq	LBB2_135
; %bb.133:                              ;   in Loop: Header=BB2_38 Depth=3
	ldr	x12, [sp, #768]                 ; 8-byte Folded Reload
	cmp	x12, x14
	b.le	LBB2_135
; %bb.134:                              ;   in Loop: Header=BB2_38 Depth=3
	str	w30, [x9, #124]
LBB2_135:                               ;   in Loop: Header=BB2_38 Depth=3
	ldr	z22, [x9]
	fmul	z22.s, z0.s, z22.s
	str	z22, [x9]
	cmp	x13, #17
	b.lt	LBB2_137
; %bb.136:                              ;   in Loop: Header=BB2_38 Depth=3
	ld1w	{ z23.s }, p0/z, [x9, x4, lsl #2]
	fmul	z23.s, z0.s, z23.s
	st1w	{ z23.s }, p0, [x9, x4, lsl #2]
	fmax	z22.s, p0/m, z22.s, z23.s
LBB2_137:                               ;   in Loop: Header=BB2_38 Depth=3
	fmaxv	s23, p0, z22.s
	fmov	s22, w30
	fcmp	s23, s22
	b.eq	LBB2_37
; %bb.138:                              ;   in Loop: Header=BB2_38 Depth=3
	add	x12, sp, #2, lsl #12            ; =8192
	add	x12, x12, #1552
	ldr	s22, [x12, x15, lsl #2]
	fcmp	s22, s23
	fcsel	s23, s22, s23, gt
	str	s23, [x12, x15, lsl #2]
	fmov	s24, w30
	fcmp	s22, s24
	fccmp	s22, s23, #4, ne
	b.ne	LBB2_140
; %bb.139:                              ;   in Loop: Header=BB2_38 Depth=3
	add	x14, sp, #2, lsl #12            ; =8192
	add	x14, x14, #1424
	add	x14, x14, x15, lsl #2
	ldr	s22, [x14]
	b	LBB2_143
LBB2_140:                               ;   in Loop: Header=BB2_38 Depth=3
	fsub	s22, s22, s23
	mov	w14, #44106                     ; =0xac4a
	movk	w14, #49838, lsl #16
	fmov	s24, w14
	fcmp	s22, s24
	fcsel	s22, s24, s22, mi
	mov	w14, #43579                     ; =0xaa3b
	movk	w14, #16312, lsl #16
	fmov	s24, w14
	fmul	s24, s22, s24
	fcmp	s24, #0.0
	fcsel	s25, s21, s20, ge
	fadd	s24, s24, s25
	fcvtzs	z24.s, p0/m, z24.s
	movprfx	z25, z24
	scvtf	z25.s, p0/m, z24.s
	fmov	w14, s24
	mov	w12, #32768                     ; =0x8000
	movk	w12, #48945, lsl #16
	fmov	s24, w12
	fmadd	s22, s25, s24, s22
	mov	w12, #32899                     ; =0x8083
	movk	w12, #14686, lsl #16
	fmov	s24, w12
	fmadd	s22, s25, s24, s22
	mov	w22, #34953                     ; =0x8889
	movk	w22, #15368, lsl #16
	fmov	s24, w22
	mov	w22, #2913                      ; =0xb61
	movk	w22, #15030, lsl #16
	fmov	s25, w22
	fmadd	s24, s22, s25, s24
	mov	w22, #43691                     ; =0xaaab
	movk	w22, #15658, lsl #16
	fmov	s25, w22
	fmadd	s24, s24, s22, s25
	mov	w22, #43691                     ; =0xaaab
	movk	w22, #15914, lsl #16
	fmov	s25, w22
	fmadd	s24, s24, s22, s25
	fmadd	s24, s24, s22, s21
	fmadd	s24, s24, s22, s1
	fmadd	s22, s24, s22, s1
	mov	w12, #1065353216                ; =0x3f800000
	add	w14, w12, w14, lsl #23
	fmov	s24, w14
	fmul	s24, s22, s24
	add	x14, sp, #2, lsl #12            ; =8192
	add	x14, x14, #1424
	add	x14, x14, x15, lsl #2
	ldr	s22, [x14]
	fmul	s22, s24, s22
	str	s22, [x14]
	fcmp	s24, s1
	b.eq	LBB2_143
; %bb.141:                              ;   in Loop: Header=BB2_38 Depth=3
	mov	x25, #0                         ; =0x0
	mov	z24.s, s24
LBB2_142:                               ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ;       Parent Loop BB2_38 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ld1w	{ z25.s }, p0/z, [x6, x25, lsl #2]
	fmul	z25.s, z24.s, z25.s
	st1w	{ z25.s }, p0, [x6, x25, lsl #2]
	add	x25, x25, #16
	cmp	x25, x10
	b.lt	LBB2_142
LBB2_143:                               ;   in Loop: Header=BB2_38 Depth=3
	mov	z24.s, s23
	ldr	z23, [x9]
	fsub	z23.s, z23.s, z24.s
	fmax	z23.s, p0/m, z23.s, z2.s
	fmul	z25.s, z23.s, z3.s
	fcvtzs	z25.s, p0/m, z25.s
	movprfx	z26, z25
	scvtf	z26.s, p0/m, z25.s
	mov	z27.d, z26.d
	fmsb	z27.s, p0/m, z4.s, z23.s
	fmsb	z26.s, p0/m, z5.s, z27.s
	mov	z23.d, z7.d
	fmad	z23.s, p0/m, z26.s, z6.s
	fmad	z23.s, p0/m, z26.s, z16.s
	fmad	z23.s, p0/m, z26.s, z17.s
	fmad	z23.s, p0/m, z26.s, z18.s
	fmad	z23.s, p0/m, z26.s, z19.s
	fmad	z23.s, p0/m, z26.s, z19.s
	add	z25.s, z25.s, #127              ; =0x7f
	lsl	z25.s, z25.s, #23
	fmul	z23.s, z23.s, z25.s
	add	x12, sp, #1360
	str	z23, [x12]
	ldr	s25, [sp, #1360]
	ldr	s26, [sp, #1364]
	add	x22, sp, #1424
	add	x25, x22, x15, lsl #2
	str	s25, [x25]
	str	s26, [x25, #128]
	ldr	s25, [sp, #1368]
	ldr	s26, [sp, #1372]
	str	s25, [x25, #256]
	str	s26, [x25, #384]
	ldr	s25, [sp, #1376]
	ldr	s26, [sp, #1380]
	str	s25, [x25, #512]
	str	s26, [x25, #640]
	ldr	s25, [sp, #1384]
	ldr	s26, [sp, #1388]
	str	s25, [x25, #768]
	str	s26, [x25, #896]
	ldr	s25, [sp, #1392]
	ldr	s26, [sp, #1396]
	str	s25, [x25, #1024]
	str	s26, [x25, #1152]
	ldr	s25, [sp, #1400]
	ldr	s26, [sp, #1404]
	str	s25, [x25, #1280]
	str	s26, [x25, #1408]
	ldr	s25, [sp, #1408]
	ldr	s26, [sp, #1412]
	str	s25, [x25, #1536]
	str	s26, [x25, #1664]
	ldr	s25, [sp, #1416]
	ldr	s26, [sp, #1420]
	str	s25, [x25, #1792]
	str	s26, [x25, #1920]
	faddv	s23, p0, z23.s
	cmp	x13, #17
	b.lt	LBB2_145
; %bb.144:                              ;   in Loop: Header=BB2_38 Depth=3
	ld1w	{ z25.s }, p0/z, [x9, x4, lsl #2]
	fsub	z24.s, z25.s, z24.s
	fmax	z24.s, p0/m, z24.s, z2.s
	fmul	z25.s, z24.s, z3.s
	fcvtzs	z25.s, p0/m, z25.s
	movprfx	z26, z25
	scvtf	z26.s, p0/m, z25.s
	mov	z27.d, z26.d
	fmsb	z27.s, p0/m, z4.s, z24.s
	fmsb	z26.s, p0/m, z5.s, z27.s
	mov	z24.d, z7.d
	fmad	z24.s, p0/m, z26.s, z6.s
	fmad	z24.s, p0/m, z26.s, z16.s
	fmad	z24.s, p0/m, z26.s, z17.s
	fmad	z24.s, p0/m, z26.s, z18.s
	fmad	z24.s, p0/m, z26.s, z19.s
	fmad	z24.s, p0/m, z26.s, z19.s
	add	z25.s, z25.s, #127              ; =0x7f
	lsl	z25.s, z25.s, #23
	fmul	z24.s, z24.s, z25.s
	add	x9, sp, #1296
	str	z24, [x9]
	ldr	s25, [sp, #1296]
	ldr	s26, [sp, #1300]
	str	s25, [x25, #2048]
	str	s26, [x25, #2176]
	ldr	s25, [sp, #1304]
	ldr	s26, [sp, #1308]
	str	s25, [x25, #2304]
	str	s26, [x25, #2432]
	ldr	s25, [sp, #1312]
	ldr	s26, [sp, #1316]
	str	s25, [x25, #2560]
	str	s26, [x25, #2688]
	ldr	s25, [sp, #1320]
	ldr	s26, [sp, #1324]
	str	s25, [x25, #2816]
	str	s26, [x25, #2944]
	ldr	s25, [sp, #1328]
	ldr	s26, [sp, #1332]
	str	s25, [x25, #3072]
	str	s26, [x25, #3200]
	ldr	s25, [sp, #1336]
	ldr	s26, [sp, #1340]
	str	s25, [x25, #3328]
	str	s26, [x25, #3456]
	ldr	s25, [sp, #1344]
	ldr	s26, [sp, #1348]
	str	s25, [x25, #3584]
	str	s26, [x25, #3712]
	ldr	s25, [sp, #1352]
	ldr	s26, [sp, #1356]
	str	s25, [x25, #3840]
	str	s26, [x25, #3968]
	faddv	s24, p0, z24.s
	fadd	s23, s23, s24
LBB2_145:                               ;   in Loop: Header=BB2_38 Depth=3
	add	x25, sp, #1, lsl #12            ; =4096
	add	x25, x25, #1424
	fadd	s22, s22, s23
	str	s22, [x14]
	add	x15, x15, #1
	add	x6, x6, x21
	cmp	x15, #32
	b.ne	LBB2_38
LBB2_146:                               ;   in Loop: Header=BB2_16 Depth=2
	ldr	x9, [sp, #1264]                 ; 8-byte Folded Reload
	cmp	w9, #31
	b.gt	LBB2_149
; %bb.147:                              ;   in Loop: Header=BB2_16 Depth=2
	ldr	x9, [sp, #720]                  ; 8-byte Folded Reload
	ldr	x14, [sp, #728]                 ; 8-byte Folded Reload
LBB2_148:                               ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	str	wzr, [x9]
	str	wzr, [x9, #128]
	str	wzr, [x9, #256]
	str	wzr, [x9, #384]
	str	wzr, [x9, #512]
	str	wzr, [x9, #640]
	str	wzr, [x9, #768]
	str	wzr, [x9, #896]
	str	wzr, [x9, #1024]
	str	wzr, [x9, #1152]
	str	wzr, [x9, #1280]
	str	wzr, [x9, #1408]
	str	wzr, [x9, #1536]
	str	wzr, [x9, #1664]
	str	wzr, [x9, #1792]
	str	wzr, [x9, #1920]
	str	wzr, [x9, #2048]
	str	wzr, [x9, #2176]
	str	wzr, [x9, #2304]
	str	wzr, [x9, #2432]
	str	wzr, [x9, #2560]
	str	wzr, [x9, #2688]
	str	wzr, [x9, #2816]
	str	wzr, [x9, #2944]
	str	wzr, [x9, #3072]
	str	wzr, [x9, #3200]
	str	wzr, [x9, #3328]
	str	wzr, [x9, #3456]
	str	wzr, [x9, #3584]
	str	wzr, [x9, #3712]
	add	x14, x14, #1
	str	wzr, [x9, #3840]
	str	wzr, [x9, #3968]
	add	x9, x9, #4
	cmp	x14, #31
	b.lt	LBB2_148
LBB2_149:                               ;   in Loop: Header=BB2_16 Depth=2
	cmp	w13, #31
	ldr	x19, [sp, #920]                 ; 8-byte Folded Reload
	ldr	x22, [sp, #1120]                ; 8-byte Folded Reload
	ldr	x24, [sp, #1112]                ; 8-byte Folded Reload
	b.gt	LBB2_151
LBB2_150:                               ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stp	xzr, xzr, [x5, #-64]
	stp	xzr, xzr, [x5, #-48]
	stp	xzr, xzr, [x5, #-32]
	stp	xzr, xzr, [x5, #-16]
	stp	xzr, xzr, [x5]
	stp	xzr, xzr, [x5, #16]
	stp	xzr, xzr, [x5, #32]
	add	x17, x17, #1
	stp	xzr, xzr, [x5, #48]
	add	x5, x5, #128
	cmp	x17, #31
	b.lt	LBB2_150
LBB2_151:                               ;   in Loop: Header=BB2_16 Depth=2
	cmp	x10, #32
	b.hs	LBB2_191
; %bb.152:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	x15, #0                         ; =0x0
LBB2_153:                               ;   in Loop: Header=BB2_16 Depth=2
	cmp	x15, x10
	ldr	x5, [sp, #936]                  ; 8-byte Folded Reload
	b.ge	LBB2_15
; %bb.154:                              ;   in Loop: Header=BB2_16 Depth=2
	zero	{za}
	cmp	x13, #1
	b.lt	LBB2_157
; %bb.155:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	x9, #0                          ; =0x0
	ldr	x12, [sp, #1256]                ; 8-byte Folded Reload
	add	x14, x12, x15, lsl #2
	add	x17, sp, #1424
LBB2_156:                               ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z22, [x17]
	ld1w	{ z23.s }, p0/z, [x17, x4, lsl #2]
	ldr	z24, [x14]
	fmopa	za0.s, p0/m, p0/m, z22.s, z24.s
	fmopa	za1.s, p0/m, p0/m, z23.s, z24.s
	add	x9, x9, #1
	add	x17, x17, #128
	add	x14, x14, x21
	cmp	x13, x9
	b.gt	LBB2_156
LBB2_157:                               ;   in Loop: Header=BB2_16 Depth=2
	add	x9, x3, x15, lsl #2
	cbz	x8, LBB2_174
; %bb.158:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w13, #0                         ; =0x0
	mov	z22.s, p0/m, za0h.s[w13, 0]
	ld1w	{ z23.s }, p0/z, [x9, x11, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x11, lsl #2]
	cmp	x8, #1
	b.eq	LBB2_174
; %bb.159:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #1                         ; =0x1
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x9, x20, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x20, lsl #2]
	cmp	x8, #2
	b.eq	LBB2_174
; %bb.160:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #2                         ; =0x2
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x9, x22, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x22, lsl #2]
	cmp	x8, #3
	b.eq	LBB2_174
; %bb.161:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #3                         ; =0x3
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #1192]                ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #4
	b.eq	LBB2_174
; %bb.162:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #4                         ; =0x4
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #760]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #5
	b.eq	LBB2_174
; %bb.163:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #5                         ; =0x5
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #456]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #6
	b.eq	LBB2_174
; %bb.164:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #6                         ; =0x6
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #304]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #7
	b.eq	LBB2_174
; %bb.165:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #7                         ; =0x7
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #280]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #8
	b.eq	LBB2_174
; %bb.166:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #8                         ; =0x8
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #224]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #9
	b.eq	LBB2_174
; %bb.167:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #9                         ; =0x9
	mov	z22.s, p0/m, za0h.s[w12, 0]
	mov	w12, #10                        ; =0xa
	ldr	x13, [sp, #200]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x8, #10
	b.eq	LBB2_174
; %bb.168:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #176]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #11
	b.eq	LBB2_174
; %bb.169:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #11                        ; =0xb
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #152]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #12
	b.eq	LBB2_174
; %bb.170:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #12                        ; =0xc
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #112]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #13
	b.eq	LBB2_174
; %bb.171:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #13                        ; =0xd
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #72]                  ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #14
	b.eq	LBB2_174
; %bb.172:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #14                        ; =0xe
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #48]                  ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	cmp	x8, #15
	b.eq	LBB2_174
; %bb.173:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #15                        ; =0xf
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x12, [sp, #24]                  ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
LBB2_174:                               ;   in Loop: Header=BB2_16 Depth=2
	cmp	x0, x16
	b.ge	LBB2_15
; %bb.175:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w13, #0                         ; =0x0
	mov	z22.s, p0/m, za1h.s[w13, 0]
	ld1w	{ z23.s }, p0/z, [x9, x7, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x7, lsl #2]
	cmp	x24, x16
	b.ge	LBB2_15
; %bb.176:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #1                         ; =0x1
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x9, x23, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x23, lsl #2]
	ldr	x12, [sp, #1288]                ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.177:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #2                         ; =0x2
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x12, [sp, #1232]                ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	ldr	x12, [sp, #1224]                ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.178:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #3                         ; =0x3
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x12, [sp, #1152]                ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	ldr	x12, [sp, #1144]                ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.179:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #4                         ; =0x4
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x12, [sp, #752]                 ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	ldr	x12, [sp, #744]                 ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.180:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #5                         ; =0x5
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldp	x12, x13, [sp, #440]            ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.181:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #6                         ; =0x6
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldp	x12, x13, [sp, #288]            ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.182:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #7                         ; =0x7
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldp	x12, x13, [sp, #264]            ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.183:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #8                         ; =0x8
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldp	x12, x13, [sp, #208]            ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.184:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #9                         ; =0x9
	mov	z22.s, p0/m, za1h.s[w12, 0]
	mov	w12, #10                        ; =0xa
	ldp	x13, x14, [sp, #184]            ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x14, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x14, lsl #2]
	cmp	x13, x16
	b.ge	LBB2_15
; %bb.185:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldp	x12, x13, [sp, #160]            ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.186:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #11                        ; =0xb
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldp	x12, x13, [sp, #136]            ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.187:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #12                        ; =0xc
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldp	x12, x13, [sp, #96]             ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.188:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #13                        ; =0xd
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldp	x12, x13, [sp, #56]             ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.189:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #14                        ; =0xe
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldp	x12, x13, [sp, #32]             ; 16-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x13, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x13, lsl #2]
	cmp	x12, x16
	b.ge	LBB2_15
; %bb.190:                              ;   in Loop: Header=BB2_16 Depth=2
	mov	w12, #15                        ; =0xf
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x12, [sp, #16]                  ; 8-byte Folded Reload
	ld1w	{ z23.s }, p0/z, [x9, x12, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x9, x12, lsl #2]
	b	LBB2_15
LBB2_191:                               ;   in Loop: Header=BB2_16 Depth=2
	mov	x15, #0                         ; =0x0
	ldr	x9, [sp, #1256]                 ; 8-byte Folded Reload
	mov	w17, #32                        ; =0x20
	b	LBB2_193
LBB2_192:                               ;   in Loop: Header=BB2_193 Depth=3
	add	x17, x15, #32
	add	x9, x9, #128
	cmp	x17, x10
	b.gt	LBB2_153
LBB2_193:                               ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB2_195 Depth 4
	mov	x14, x15
	mov	x15, x17
	zero	{za}
	cmp	x13, #1
	b.lt	LBB2_196
; %bb.194:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	x17, #0                         ; =0x0
	add	x5, sp, #1424
	mov	x6, x9
LBB2_195:                               ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_16 Depth=2
                                        ;       Parent Loop BB2_193 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	z22, [x5]
	ld1w	{ z23.s }, p0/z, [x5, x4, lsl #2]
	ldr	z24, [x6]
	ld1w	{ z25.s }, p0/z, [x6, x4, lsl #2]
	fmopa	za0.s, p0/m, p0/m, z22.s, z24.s
	fmopa	za1.s, p0/m, p0/m, z23.s, z24.s
	fmopa	za2.s, p0/m, p0/m, z22.s, z25.s
	fmopa	za3.s, p0/m, p0/m, z23.s, z25.s
	add	x17, x17, #1
	add	x5, x5, #128
	add	x6, x6, x21
	cmp	x13, x17
	b.gt	LBB2_195
LBB2_196:                               ;   in Loop: Header=BB2_193 Depth=3
	add	x17, x3, x14, lsl #2
	cbz	x8, LBB2_213
; %bb.197:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w14, #0                         ; =0x0
	mov	z22.s, p0/m, za0h.s[w14, 0]
	add	x5, x17, x11, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x11, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x11, lsl #2]
	mov	z22.s, p0/m, za2h.s[w14, 0]
	ld1w	{ z23.s }, p0/z, [x5, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x5, x4, lsl #2]
	cmp	x8, #1
	b.eq	LBB2_213
; %bb.198:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #1                         ; =0x1
	mov	z22.s, p0/m, za0h.s[w12, 0]
	add	x14, x17, x20, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x20, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x20, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #2
	b.eq	LBB2_213
; %bb.199:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #2                         ; =0x2
	mov	z22.s, p0/m, za0h.s[w12, 0]
	add	x14, x17, x22, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x22, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x22, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #3
	b.eq	LBB2_213
; %bb.200:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #3                         ; =0x3
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #1192]                 ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #4
	b.eq	LBB2_213
; %bb.201:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #4                         ; =0x4
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #760]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #5
	b.eq	LBB2_213
; %bb.202:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #5                         ; =0x5
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #456]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #6
	b.eq	LBB2_213
; %bb.203:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #6                         ; =0x6
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #304]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #7
	b.eq	LBB2_213
; %bb.204:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #7                         ; =0x7
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #280]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #8
	b.eq	LBB2_213
; %bb.205:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #8                         ; =0x8
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #224]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #9
	b.eq	LBB2_213
; %bb.206:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #9                         ; =0x9
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #200]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	mov	w12, #10                        ; =0xa
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #10
	b.eq	LBB2_213
; %bb.207:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #176]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #11
	b.eq	LBB2_213
; %bb.208:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #11                        ; =0xb
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #152]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #12
	b.eq	LBB2_213
; %bb.209:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #12                        ; =0xc
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #112]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #13
	b.eq	LBB2_213
; %bb.210:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #13                        ; =0xd
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #72]                   ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #14
	b.eq	LBB2_213
; %bb.211:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #14                        ; =0xe
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #48]                   ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	cmp	x8, #15
	b.eq	LBB2_213
; %bb.212:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #15                        ; =0xf
	mov	z22.s, p0/m, za0h.s[w12, 0]
	ldr	x5, [sp, #24]                   ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za2h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
LBB2_213:                               ;   in Loop: Header=BB2_193 Depth=3
	cmp	x0, x16
	b.ge	LBB2_192
; %bb.214:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w14, #0                         ; =0x0
	mov	z22.s, p0/m, za1h.s[w14, 0]
	add	x5, x17, x7, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x7, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x7, lsl #2]
	mov	z22.s, p0/m, za3h.s[w14, 0]
	ld1w	{ z23.s }, p0/z, [x5, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x5, x4, lsl #2]
	cmp	x24, x16
	b.ge	LBB2_192
; %bb.215:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #1                         ; =0x1
	mov	z22.s, p0/m, za1h.s[w12, 0]
	add	x14, x17, x23, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x23, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x23, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #1288]                ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.216:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #2                         ; =0x2
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #1232]                 ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #1224]                ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.217:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #3                         ; =0x3
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #1152]                 ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #1144]                ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.218:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #4                         ; =0x4
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #752]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #744]                 ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.219:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #5                         ; =0x5
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #448]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #440]                 ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.220:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #6                         ; =0x6
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #296]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #288]                 ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.221:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #7                         ; =0x7
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #272]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #264]                 ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.222:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #8                         ; =0x8
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #216]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #208]                 ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.223:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #9                         ; =0x9
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #192]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	mov	w12, #10                        ; =0xa
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x14, [sp, #184]                 ; 8-byte Folded Reload
	cmp	x14, x16
	b.ge	LBB2_192
; %bb.224:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #168]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #160]                 ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.225:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #11                        ; =0xb
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #144]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #136]                 ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.226:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #12                        ; =0xc
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #104]                  ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #96]                  ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.227:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #13                        ; =0xd
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #64]                   ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #56]                  ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.228:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #14                        ; =0xe
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #40]                   ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	ldr	x12, [sp, #32]                  ; 8-byte Folded Reload
	cmp	x12, x16
	b.ge	LBB2_192
; %bb.229:                              ;   in Loop: Header=BB2_193 Depth=3
	mov	w12, #15                        ; =0xf
	mov	z22.s, p0/m, za1h.s[w12, 0]
	ldr	x5, [sp, #16]                   ; 8-byte Folded Reload
	add	x14, x17, x5, lsl #2
	ld1w	{ z23.s }, p0/z, [x17, x5, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x17, x5, lsl #2]
	mov	z22.s, p0/m, za3h.s[w12, 0]
	ld1w	{ z23.s }, p0/z, [x14, x4, lsl #2]
	fadd	z22.s, z22.s, z23.s
	st1w	{ z22.s }, p0, [x14, x4, lsl #2]
	b	LBB2_192
LBB2_230:                               ;   in Loop: Header=BB2_4 Depth=1
	ldr	x14, [sp, #1264]                ; 8-byte Folded Reload
	cmp	x14, #1
	ldp	x1, x13, [sp, #248]             ; 16-byte Folded Reload
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	b.lt	LBB2_3
; %bb.231:                              ;   in Loop: Header=BB2_4 Depth=1
	mov	x9, #0                          ; =0x0
	ldr	x11, [sp, #1176]                ; 8-byte Folded Reload
	b	LBB2_233
LBB2_232:                               ;   in Loop: Header=BB2_233 Depth=2
	add	x9, x9, #1
	add	x11, x11, x21
	cmp	x9, x14
	b.ge	LBB2_3
LBB2_233:                               ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_235 Depth 3
	add	x12, sp, #2, lsl #12            ; =8192
	add	x12, x12, #1424
	ldr	s22, [x12, x9, lsl #2]
	fcmp	s22, #0.0
	b.eq	LBB2_232
; %bb.234:                              ;   in Loop: Header=BB2_233 Depth=2
	mov	x12, #0                         ; =0x0
	fdiv	s22, s1, s22
	mov	z22.s, s22
LBB2_235:                               ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_233 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ld1w	{ z23.s }, p0/z, [x11, x12, lsl #2]
	fmul	z23.s, z22.s, z23.s
	st1w	{ z23.s }, p0, [x11, x12, lsl #2]
	add	x12, x12, #16
	cmp	x12, x10
	b.lt	LBB2_235
	b	LBB2_232
                                        ; -- End function
	.globl	_sdpa_causal_fmopa_f64          ; -- Begin function sdpa_causal_fmopa_f64
	.p2align	2
_sdpa_causal_fmopa_f64:                 ; @sdpa_causal_fmopa_f64
; %bb.0:
	str	x25, [sp, #-80]!                ; 8-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	sub	sp, sp, #1, lsl #12             ; =4096
	sub	sp, sp, #1088
	stp	x1, x2, [sp, #24]               ; 16-byte Folded Spill
	str	x0, [sp, #344]                  ; 8-byte Folded Spill
	ldp	x22, x6, [x4]
	ldr	x10, [x4, #16]
	cmp	x22, #1
	ccmp	x6, #1, #8, ge
	ccmp	x10, #1, #8, ge
	b.ge	LBB3_2
LBB3_1:
	add	sp, sp, #1, lsl #12             ; =4096
	add	sp, sp, #1088
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldr	x25, [sp], #80                  ; 8-byte Folded Reload
	ret
LBB3_2:
	mov	x14, #0                         ; =0x0
	mov	x24, #0                         ; =0x0
	add	x8, sp, #2880
	add	x9, x8, #64
	sub	x8, x6, x22
	ptrue	p0.d
	ld1rd	{ z0.d }, p0/z, [x5]
	str	x8, [sp, #5192]                 ; 8-byte Folded Spill
	sub	x8, x8, #1
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	add	x11, x9, #960
	add	x8, x9, #1024
	str	x8, [sp, #168]                  ; 8-byte Folded Spill
	add	x8, x9, #64
	str	x8, [sp, #464]                  ; 8-byte Folded Spill
	add	x8, x9, #192
	str	x8, [sp, #456]                  ; 8-byte Folded Spill
	add	x8, x9, #320
	str	x8, [sp, #448]                  ; 8-byte Folded Spill
	add	x8, x9, #448
	str	x8, [sp, #440]                  ; 8-byte Folded Spill
	add	x8, x9, #576
	str	x8, [sp, #432]                  ; 8-byte Folded Spill
	add	x8, x9, #704
	str	x8, [sp, #424]                  ; 8-byte Folded Spill
	add	x8, x9, #832
	str	x8, [sp, #416]                  ; 8-byte Folded Spill
	add	x8, x9, #128
	stp	x8, x11, [sp, #304]             ; 16-byte Folded Spill
	add	x11, x9, #256
	add	x8, x9, #384
	stp	x8, x11, [sp, #288]             ; 16-byte Folded Spill
	add	x11, x9, #512
	add	x8, x9, #640
	stp	x8, x11, [sp, #272]             ; 16-byte Folded Spill
	fmov	d1, #1.00000000
	mov	x8, #18874                      ; =0x49ba
	movk	x8, #524, lsl #16
	movk	x8, #9003, lsl #32
	movk	x8, #49286, lsl #48
	mov	z2.d, x8
	mov	x8, #33534                      ; =0x82fe
	movk	x8, #25899, lsl #16
	movk	x8, #5447, lsl #32
	movk	x8, #16375, lsl #48
	mov	z3.d, x8
	mov	x8, #4276092928                 ; =0xfee00000
	movk	x8, #11842, lsl #32
	movk	x8, #16358, lsl #48
	mov	z4.d, x8
	mov	x8, #15478                      ; =0x3c76
	movk	x8, #13689, lsl #16
	movk	x8, #14831, lsl #32
	movk	x8, #15850, lsl #48
	mov	z5.d, x8
	mov	x8, #40986                      ; =0xa01a
	movk	x8, #6657, lsl #16
	movk	x8, #416, lsl #32
	movk	x8, #16170, lsl #48
	mov	z6.d, x8
	mov	x8, #40986                      ; =0xa01a
	movk	x8, #6657, lsl #16
	movk	x8, #416, lsl #32
	movk	x8, #16122, lsl #48
	mov	z7.d, x8
	mov	x8, #27671                      ; =0x6c17
	movk	x8, #5825, lsl #16
	movk	x8, #49516, lsl #32
	movk	x8, #16214, lsl #48
	mov	z16.d, x8
	mov	x8, #1229782938247303441        ; =0x1111111111111111
	movk	x8, #16257, lsl #48
	mov	z17.d, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16293, lsl #48
	mov	z18.d, x8
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	movk	x8, #16325, lsl #48
	mov	z19.d, x8
	fmov	z20.d, #0.50000000
	fmov	z21.d, #1.00000000
	mov	z22.d, #1023                    ; =0x3ff
	fmov	d23, #-0.50000000
	fmov	d24, #0.50000000
	add	x11, x9, #768
	add	x8, x9, #896
	stp	x8, x11, [sp, #256]             ; 16-byte Folded Spill
	add	x11, x9, #1088
	add	x8, x9, #1216
	stp	x8, x11, [sp, #240]             ; 16-byte Folded Spill
	add	x11, x9, #1344
	add	x8, x9, #1472
	stp	x8, x11, [sp, #224]             ; 16-byte Folded Spill
	add	x11, x9, #1600
	add	x8, x9, #1728
	stp	x8, x11, [sp, #208]             ; 16-byte Folded Spill
	add	x8, x9, #1856
	str	x8, [sp, #200]                  ; 8-byte Folded Spill
	add	x11, x9, #1152
	add	x8, x9, #1280
	stp	x8, x11, [sp, #152]             ; 16-byte Folded Spill
	add	x11, x9, #1408
	add	x8, x9, #1536
	stp	x8, x11, [sp, #136]             ; 16-byte Folded Spill
	add	x11, x9, #1664
	add	x8, x9, #1792
	stp	x8, x11, [sp, #120]             ; 16-byte Folded Spill
	str	x9, [sp, #320]                  ; 8-byte Folded Spill
	add	x8, x9, #1920
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
	and	x17, x10, #0x7ffffffffffffffc
	add	x1, x3, #16
	lsl	x8, x10, #7
	str	x8, [sp, #528]                  ; 8-byte Folded Spill
	lsl	x13, x10, #3
	lsl	x4, x6, #3
	lsl	x0, x22, #3
	add	x8, sp, #832
	add	x8, x8, #64
	stp	x8, x4, [sp, #400]              ; 16-byte Folded Spill
	mov	x7, #-4503599627370496          ; =0xfff0000000000000
	mov	x20, #8                         ; =0x8
	str	x3, [sp, #576]                  ; 8-byte Folded Spill
	mov	x8, x22
	mov	w12, #16                        ; =0x10
	str	x6, [sp, #472]                  ; 8-byte Folded Spill
	str	x17, [sp, #8]                   ; 8-byte Folded Spill
	b	LBB3_4
LBB3_3:                                 ;   in Loop: Header=BB3_4 Depth=1
	ldr	x12, [sp, #48]                  ; 8-byte Folded Reload
	add	x12, x12, #16
	sub	x14, x14, #16
	sub	x8, x8, #16
	ldr	x9, [sp, #528]                  ; 8-byte Folded Reload
	add	x1, x1, x9
	ldr	x11, [sp, #576]                 ; 8-byte Folded Reload
	add	x11, x11, x9
	str	x11, [sp, #576]                 ; 8-byte Folded Spill
	ldr	x9, [sp, #344]                  ; 8-byte Folded Reload
	add	x9, x9, #128
	str	x9, [sp, #344]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	mov	x24, x9
	cmp	x9, x22
	b.ge	LBB3_1
LBB3_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_7 Depth 2
                                        ;       Child Loop BB3_10 Depth 3
                                        ;       Child Loop BB3_13 Depth 3
                                        ;     Child Loop BB3_16 Depth 2
                                        ;       Child Loop BB3_22 Depth 3
                                        ;       Child Loop BB3_28 Depth 3
                                        ;       Child Loop BB3_26 Depth 3
                                        ;       Child Loop BB3_30 Depth 3
                                        ;       Child Loop BB3_38 Depth 3
                                        ;         Child Loop BB3_94 Depth 4
                                        ;       Child Loop BB3_100 Depth 3
                                        ;       Child Loop BB3_102 Depth 3
                                        ;       Child Loop BB3_129 Depth 3
                                        ;         Child Loop BB3_131 Depth 4
                                        ;       Child Loop BB3_108 Depth 3
                                        ;     Child Loop BB3_153 Depth 2
                                        ;       Child Loop BB3_155 Depth 3
	cmp	x22, x12
	str	x12, [sp, #48]                  ; 8-byte Folded Spill
	csel	x9, x22, x12, lt
	add	w11, w14, w9
	str	x7, [sp, #5056]
	str	x7, [sp, #5064]
	sxtw	x12, w11
	sub	x15, x12, #1
	add	x12, sp, #832
	add	x11, x12, w11, sxtw #3
	stp	x11, x15, [sp, #328]            ; 16-byte Folded Spill
	str	xzr, [sp, #4928]
	str	xzr, [sp, #4936]
	str	x14, [sp, #64]                  ; 8-byte Folded Spill
	add	x9, x9, x14
	str	x7, [sp, #5072]
	str	x7, [sp, #5080]
	str	xzr, [sp, #4944]
	str	xzr, [sp, #4952]
	str	x7, [sp, #5088]
	str	x7, [sp, #5096]
	str	xzr, [sp, #4960]
	str	xzr, [sp, #4968]
	str	x7, [sp, #5104]
	str	x7, [sp, #5112]
	str	xzr, [sp, #4976]
	str	xzr, [sp, #4984]
	str	x7, [sp, #5120]
	str	x7, [sp, #5128]
	str	xzr, [sp, #4992]
	str	xzr, [sp, #5000]
	str	x7, [sp, #5136]
	str	x7, [sp, #5144]
	str	xzr, [sp, #5008]
	str	xzr, [sp, #5016]
	str	x7, [sp, #5152]
	str	x7, [sp, #5160]
	str	xzr, [sp, #5024]
	str	xzr, [sp, #5032]
	str	x7, [sp, #5168]
	str	x7, [sp, #5176]
	add	x12, x24, #16
	sub	x11, x22, x24
	str	x12, [sp, #40]                  ; 8-byte Folded Spill
	cmp	x12, x22
	mov	w12, #16                        ; =0x10
	csel	x23, x11, x12, gt
	str	xzr, [sp, #5040]
	str	xzr, [sp, #5048]
	cmp	x23, #1
	b.lt	LBB3_14
; %bb.5:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x11, #0                         ; =0x0
	ldr	x12, [sp, #576]                 ; 8-byte Folded Reload
	mov	x14, x1
	b	LBB3_7
LBB3_6:                                 ;   in Loop: Header=BB3_7 Depth=2
	add	x11, x11, #1
	add	x14, x14, x13
	add	x12, x12, x13
	cmp	x11, x23
	b.ge	LBB3_14
LBB3_7:                                 ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_10 Depth 3
                                        ;       Child Loop BB3_13 Depth 3
	cmp	x10, #4
	b.hs	LBB3_9
; %bb.8:                                ;   in Loop: Header=BB3_7 Depth=2
	mov	x16, #0                         ; =0x0
	b	LBB3_12
LBB3_9:                                 ;   in Loop: Header=BB3_7 Depth=2
	mov	x15, x14
	mov	x16, x17
LBB3_10:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stp	xzr, xzr, [x15, #-16]
	stp	xzr, xzr, [x15], #32
	subs	x16, x16, #4
	b.ne	LBB3_10
; %bb.11:                               ;   in Loop: Header=BB3_7 Depth=2
	mov	x16, x17
	cmp	x10, x17
	b.eq	LBB3_6
LBB3_12:                                ;   in Loop: Header=BB3_7 Depth=2
	sub	x15, x10, x16
	add	x16, x12, x16, lsl #3
LBB3_13:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	str	xzr, [x16], #8
	subs	x15, x15, #1
	b.ne	LBB3_13
	b	LBB3_6
LBB3_14:                                ;   in Loop: Header=BB3_4 Depth=1
	str	x1, [sp, #56]                   ; 8-byte Folded Spill
	mov	x17, #0                         ; =0x0
	mov	x5, #0                          ; =0x0
	mul	x16, x24, x10
	add	x11, x24, x23
	ldr	x12, [sp, #16]                  ; 8-byte Folded Reload
	add	x11, x12, x11
	str	x11, [sp, #560]                 ; 8-byte Folded Spill
	orr	x11, x24, #0x1
	mul	x11, x11, x10
	orr	x12, x24, #0x2
	bic	x2, x9, x9, asr #63
	mul	x9, x12, x10
	str	x9, [sp, #520]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x3
	mul	x9, x9, x10
	str	x9, [sp, #592]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x4
	mul	x9, x9, x10
	str	x9, [sp, #368]                  ; 8-byte Folded Spill
	mov	w12, #5                         ; =0x5
	orr	x9, x24, x12
	mul	x9, x9, x10
	str	x9, [sp, #192]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x6
	mul	x9, x9, x10
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	orr	x9, x24, #0x7
	mul	x9, x9, x10
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	orr	x25, x24, #0x8
	mul	x19, x25, x10
	mov	w9, #9                          ; =0x9
	orr	x9, x24, x9
	str	x9, [sp, #696]                  ; 8-byte Folded Spill
	mul	x30, x9, x10
	mov	w9, #10                         ; =0xa
	orr	x9, x24, x9
	str	x9, [sp, #688]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #648]                  ; 8-byte Folded Spill
	mov	w9, #11                         ; =0xb
	orr	x9, x24, x9
	str	x9, [sp, #640]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #552]                  ; 8-byte Folded Spill
	orr	x9, x24, #0xc
	str	x9, [sp, #544]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #360]                  ; 8-byte Folded Spill
	mov	w9, #13                         ; =0xd
	orr	x9, x24, x9
	str	x9, [sp, #352]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #184]                  ; 8-byte Folded Spill
	orr	x9, x24, #0xe
	str	x9, [sp, #176]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	orr	x9, x24, #0xf
	ldp	x12, x14, [sp, #24]             ; 16-byte Folded Reload
	str	x14, [sp, #672]                 ; 8-byte Folded Spill
	str	x12, [sp, #664]                 ; 8-byte Folded Spill
	mov	w14, #16                        ; =0x10
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	mul	x9, x9, x10
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x23, [sp, #632]                 ; 8-byte Folded Spill
	b	LBB3_16
LBB3_15:                                ;   in Loop: Header=BB3_16 Depth=2
	ldr	x14, [sp, #624]                 ; 8-byte Folded Reload
	add	x14, x14, #16
	sub	x17, x17, #16
	ldr	x9, [sp, #664]                  ; 8-byte Folded Reload
	add	x9, x9, #128
	str	x9, [sp, #664]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #528]                  ; 8-byte Folded Reload
	ldr	x12, [sp, #672]                 ; 8-byte Folded Reload
	add	x12, x12, x9
	str	x12, [sp, #672]                 ; 8-byte Folded Spill
	ldr	x5, [sp, #608]                  ; 8-byte Folded Reload
	cmp	x5, x6
	b.ge	LBB3_150
LBB3_16:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_22 Depth 3
                                        ;       Child Loop BB3_28 Depth 3
                                        ;       Child Loop BB3_26 Depth 3
                                        ;       Child Loop BB3_30 Depth 3
                                        ;       Child Loop BB3_38 Depth 3
                                        ;         Child Loop BB3_94 Depth 4
                                        ;       Child Loop BB3_100 Depth 3
                                        ;       Child Loop BB3_102 Depth 3
                                        ;       Child Loop BB3_129 Depth 3
                                        ;         Child Loop BB3_131 Depth 4
                                        ;       Child Loop BB3_108 Depth 3
	str	x14, [sp, #624]                 ; 8-byte Folded Spill
	cmp	x6, x14
	csel	x9, x6, x14, lt
	add	x15, x5, #16
	sub	x12, x6, x5
	cmp	x15, x6
	mov	w14, #16                        ; =0x10
	csel	x21, x12, x14, gt
	ldr	x12, [sp, #560]                 ; 8-byte Folded Reload
	cmp	x5, x12
	b.gt	LBB3_150
; %bb.17:                               ;   in Loop: Header=BB3_16 Depth=2
	zero	{za}
	cmp	x23, #8
	str	x15, [sp, #608]                 ; 8-byte Folded Spill
	b.eq	LBB3_23
; %bb.18:                               ;   in Loop: Header=BB3_16 Depth=2
	cmp	x23, #16
	b.ne	LBB3_31
; %bb.19:                               ;   in Loop: Header=BB3_16 Depth=2
	cmp	x21, #8
	b.eq	LBB3_27
; %bb.20:                               ;   in Loop: Header=BB3_16 Depth=2
	cmp	x21, #16
	b.ne	LBB3_31
; %bb.21:                               ;   in Loop: Header=BB3_16 Depth=2
	ldr	x12, [sp, #344]                 ; 8-byte Folded Reload
	ldr	x14, [sp, #664]                 ; 8-byte Folded Reload
	mov	x15, x10
LBB3_22:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z25, [x12]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	ldr	z27, [x14]
	ld1d	{ z28.d }, p0/z, [x14, x20, lsl #3]
	fmopa	za0.d, p0/m, p0/m, z25.d, z27.d
	fmopa	za1.d, p0/m, p0/m, z26.d, z27.d
	fmopa	za2.d, p0/m, p0/m, z25.d, z28.d
	fmopa	za3.d, p0/m, p0/m, z26.d, z28.d
	add	x14, x14, x4
	add	x12, x12, x0
	subs	x15, x15, #1
	b.ne	LBB3_22
	b	LBB3_31
LBB3_23:                                ;   in Loop: Header=BB3_16 Depth=2
	cmp	x21, #8
	b.eq	LBB3_29
; %bb.24:                               ;   in Loop: Header=BB3_16 Depth=2
	cmp	x21, #16
	b.ne	LBB3_31
; %bb.25:                               ;   in Loop: Header=BB3_16 Depth=2
	ldr	x12, [sp, #344]                 ; 8-byte Folded Reload
	ldr	x14, [sp, #664]                 ; 8-byte Folded Reload
	mov	x15, x10
LBB3_26:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z25, [x12]
	ldr	z26, [x14]
	ld1d	{ z27.d }, p0/z, [x14, x20, lsl #3]
	fmopa	za0.d, p0/m, p0/m, z25.d, z26.d
	fmopa	za2.d, p0/m, p0/m, z25.d, z27.d
	add	x14, x14, x4
	add	x12, x12, x0
	subs	x15, x15, #1
	b.ne	LBB3_26
	b	LBB3_31
LBB3_27:                                ;   in Loop: Header=BB3_16 Depth=2
	ldr	x12, [sp, #344]                 ; 8-byte Folded Reload
	ldr	x14, [sp, #664]                 ; 8-byte Folded Reload
	mov	x15, x10
LBB3_28:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z25, [x12]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	ldr	z27, [x14]
	fmopa	za0.d, p0/m, p0/m, z25.d, z27.d
	fmopa	za1.d, p0/m, p0/m, z26.d, z27.d
	add	x14, x14, x4
	add	x12, x12, x0
	subs	x15, x15, #1
	b.ne	LBB3_28
	b	LBB3_31
LBB3_29:                                ;   in Loop: Header=BB3_16 Depth=2
	ldr	x12, [sp, #344]                 ; 8-byte Folded Reload
	ldr	x14, [sp, #664]                 ; 8-byte Folded Reload
	mov	x15, x10
LBB3_30:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z25, [x12]
	ldr	z26, [x14]
	fmopa	za0.d, p0/m, p0/m, z25.d, z26.d
	add	x14, x14, x4
	add	x12, x12, x0
	subs	x15, x15, #1
	b.ne	LBB3_30
LBB3_31:                                ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z25.d, p0/m, za0h.d[w12, 0]
	add	x15, sp, #2880
	str	z25, [x15]
	mov	w12, #1                         ; =0x1
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #464]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #2                         ; =0x2
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #456]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #3                         ; =0x3
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #448]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #4                         ; =0x4
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #440]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w14, #5                         ; =0x5
	mov	z25.d, p0/m, za0h.d[w14, 0]
	ldr	x12, [sp, #432]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #6                         ; =0x6
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #424]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #7                         ; =0x7
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #416]                 ; 8-byte Folded Reload
	str	z25, [x12]
	cmp	x21, #9
	b.lt	LBB3_33
; %bb.32:                               ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z25.d, p0/m, za2h.d[w12, 0]
	ldr	x12, [sp, #320]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #1                         ; =0x1
	mov	z25.d, p0/m, za2h.d[w12, 0]
	ldr	x12, [sp, #304]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #2                         ; =0x2
	mov	z25.d, p0/m, za2h.d[w12, 0]
	ldr	x12, [sp, #296]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #3                         ; =0x3
	mov	z25.d, p0/m, za2h.d[w12, 0]
	ldr	x12, [sp, #288]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #4                         ; =0x4
	mov	z25.d, p0/m, za2h.d[w12, 0]
	ldr	x12, [sp, #280]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	z25.d, p0/m, za2h.d[w14, 0]
	ldr	x12, [sp, #272]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #6                         ; =0x6
	mov	z25.d, p0/m, za2h.d[w12, 0]
	ldr	x12, [sp, #264]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #7                         ; =0x7
	mov	z25.d, p0/m, za2h.d[w12, 0]
	ldr	x12, [sp, #256]                 ; 8-byte Folded Reload
	str	z25, [x12]
LBB3_33:                                ;   in Loop: Header=BB3_16 Depth=2
	cmp	x23, #9
	b.lt	LBB3_36
; %bb.34:                               ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #312]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #1                         ; =0x1
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #248]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #2                         ; =0x2
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #240]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #3                         ; =0x3
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #232]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #4                         ; =0x4
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #224]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	z25.d, p0/m, za1h.d[w14, 0]
	ldr	x12, [sp, #216]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #6                         ; =0x6
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #208]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #7                         ; =0x7
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #200]                 ; 8-byte Folded Reload
	str	z25, [x12]
	cmp	x21, #9
	b.lt	LBB3_36
; %bb.35:                               ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z25.d, p0/m, za3h.d[w12, 0]
	ldr	x12, [sp, #168]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #1                         ; =0x1
	mov	z25.d, p0/m, za3h.d[w12, 0]
	ldr	x12, [sp, #160]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #2                         ; =0x2
	mov	z25.d, p0/m, za3h.d[w12, 0]
	ldr	x12, [sp, #152]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #3                         ; =0x3
	mov	z25.d, p0/m, za3h.d[w12, 0]
	ldr	x12, [sp, #144]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #4                         ; =0x4
	mov	z25.d, p0/m, za3h.d[w12, 0]
	ldr	x12, [sp, #136]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	z25.d, p0/m, za3h.d[w14, 0]
	ldr	x12, [sp, #128]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #6                         ; =0x6
	mov	z25.d, p0/m, za3h.d[w12, 0]
	ldr	x12, [sp, #120]                 ; 8-byte Folded Reload
	str	z25, [x12]
	mov	w12, #7                         ; =0x7
	mov	z25.d, p0/m, za3h.d[w12, 0]
	ldr	x12, [sp, #112]                 ; 8-byte Folded Reload
	str	z25, [x12]
LBB3_36:                                ;   in Loop: Header=BB3_16 Depth=2
	mov	x14, #0                         ; =0x0
	add	w12, w17, w9
	sxtw	x4, w12
	mov	x1, x17
	sub	x17, x4, #1
	str	x1, [sp, #616]                  ; 8-byte Folded Spill
	add	x1, x9, x1
	orr	x9, x5, #0x2
	str	x9, [sp, #680]                  ; 8-byte Folded Spill
	orr	x9, x5, #0x3
	str	x9, [sp, #656]                  ; 8-byte Folded Spill
	orr	x9, x5, #0x4
	str	x9, [sp, #600]                  ; 8-byte Folded Spill
	mov	w12, #5                         ; =0x5
	orr	x9, x5, x12
	str	x9, [sp, #584]                  ; 8-byte Folded Spill
	orr	x9, x5, #0x6
	str	x9, [sp, #568]                  ; 8-byte Folded Spill
	orr	x9, x5, #0x7
	str	x9, [sp, #536]                  ; 8-byte Folded Spill
	orr	x9, x5, #0x8
	str	x9, [sp, #512]                  ; 8-byte Folded Spill
	mov	w9, #9                          ; =0x9
	orr	x9, x5, x9
	str	x9, [sp, #504]                  ; 8-byte Folded Spill
	mov	w9, #10                         ; =0xa
	orr	x9, x5, x9
	str	x9, [sp, #496]                  ; 8-byte Folded Spill
	mov	w9, #11                         ; =0xb
	orr	x9, x5, x9
	str	x9, [sp, #488]                  ; 8-byte Folded Spill
	orr	x9, x5, #0xc
	str	x9, [sp, #480]                  ; 8-byte Folded Spill
	mov	w9, #13                         ; =0xd
	orr	x9, x5, x9
	str	x9, [sp, #392]                  ; 8-byte Folded Spill
	orr	x9, x5, #0xe
	str	x9, [sp, #384]                  ; 8-byte Folded Spill
	orr	x9, x5, #0xf
	str	x9, [sp, #376]                  ; 8-byte Folded Spill
	ldr	x6, [sp, #576]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #400]                  ; 8-byte Folded Reload
	add	x23, x9, x4, lsl #7
	b	LBB3_38
LBB3_37:                                ;   in Loop: Header=BB3_38 Depth=3
	add	x9, sp, #832
	add	x9, x9, x14, lsl #3
	str	xzr, [x9]
	str	xzr, [x9, #128]
	str	xzr, [x9, #256]
	str	xzr, [x9, #384]
	str	xzr, [x9, #512]
	str	xzr, [x9, #640]
	str	xzr, [x9, #768]
	str	xzr, [x9, #896]
	str	xzr, [x9, #1024]
	str	xzr, [x9, #1152]
	str	xzr, [x9, #1280]
	str	xzr, [x9, #1408]
	str	xzr, [x9, #1536]
	str	xzr, [x9, #1664]
	str	xzr, [x9, #1792]
	str	xzr, [x9, #1920]
	add	x14, x14, #1
	add	x6, x6, x13
	cmp	x14, #16
	b.eq	LBB3_98
LBB3_38:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB3_94 Depth 4
	cmp	x14, x2
	b.eq	LBB3_98
; %bb.39:                               ;   in Loop: Header=BB3_38 Depth=3
	add	x9, x15, x14, lsl #7
	cmp	x1, #1
	b.lt	LBB3_87
; %bb.40:                               ;   in Loop: Header=BB3_38 Depth=3
	mov	x4, x24
	orr	x12, x24, x14
	ldr	x24, [sp, #5192]                ; 8-byte Folded Reload
	add	x12, x12, x24
	cmp	x5, x12
	b.le	LBB3_42
; %bb.41:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9]
LBB3_42:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #1
	mov	x24, x4
	b.eq	LBB3_87
; %bb.43:                               ;   in Loop: Header=BB3_38 Depth=3
	cmp	x5, x12
	b.lt	LBB3_45
; %bb.44:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #8]
LBB3_45:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #2
	b.eq	LBB3_87
; %bb.46:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #680]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_48
; %bb.47:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #16]
LBB3_48:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #3
	b.eq	LBB3_87
; %bb.49:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #656]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_51
; %bb.50:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #24]
LBB3_51:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #4
	b.eq	LBB3_87
; %bb.52:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #600]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_54
; %bb.53:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #32]
LBB3_54:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #5
	b.eq	LBB3_87
; %bb.55:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #584]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_57
; %bb.56:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #40]
LBB3_57:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #6
	b.eq	LBB3_87
; %bb.58:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #568]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_60
; %bb.59:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #48]
LBB3_60:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #7
	b.eq	LBB3_87
; %bb.61:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #536]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_63
; %bb.62:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #56]
LBB3_63:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #8
	b.eq	LBB3_87
; %bb.64:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #512]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_66
; %bb.65:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #64]
LBB3_66:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #9
	b.eq	LBB3_87
; %bb.67:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #504]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_69
; %bb.68:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #72]
LBB3_69:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #10
	b.eq	LBB3_87
; %bb.70:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #496]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_72
; %bb.71:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #80]
LBB3_72:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #11
	b.eq	LBB3_87
; %bb.73:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #488]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_75
; %bb.74:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #88]
LBB3_75:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #12
	b.eq	LBB3_87
; %bb.76:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #480]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_78
; %bb.77:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #96]
LBB3_78:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #13
	b.eq	LBB3_87
; %bb.79:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #392]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_81
; %bb.80:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #104]
LBB3_81:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #14
	b.eq	LBB3_87
; %bb.82:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #384]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_84
; %bb.83:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #112]
LBB3_84:                                ;   in Loop: Header=BB3_38 Depth=3
	cmp	x1, #15
	b.eq	LBB3_87
; %bb.85:                               ;   in Loop: Header=BB3_38 Depth=3
	ldr	x4, [sp, #376]                  ; 8-byte Folded Reload
	cmp	x4, x12
	b.le	LBB3_87
; %bb.86:                               ;   in Loop: Header=BB3_38 Depth=3
	str	x7, [x9, #120]
LBB3_87:                                ;   in Loop: Header=BB3_38 Depth=3
	ldr	z25, [x9]
	fmul	z25.d, z0.d, z25.d
	str	z25, [x9]
	cmp	x21, #9
	b.lt	LBB3_89
; %bb.88:                               ;   in Loop: Header=BB3_38 Depth=3
	ld1d	{ z26.d }, p0/z, [x9, x20, lsl #3]
	fmul	z26.d, z0.d, z26.d
	st1d	{ z26.d }, p0, [x9, x20, lsl #3]
	fmax	z25.d, p0/m, z25.d, z26.d
LBB3_89:                                ;   in Loop: Header=BB3_38 Depth=3
	fmaxv	d26, p0, z25.d
	fmov	d25, x7
	fcmp	d26, d25
	b.eq	LBB3_37
; %bb.90:                               ;   in Loop: Header=BB3_38 Depth=3
	add	x12, sp, #1, lsl #12            ; =4096
	add	x12, x12, #960
	ldr	d25, [x12, x14, lsl #3]
	fcmp	d25, d26
	fcsel	d26, d25, d26, gt
	str	d26, [x12, x14, lsl #3]
	fmov	d27, x7
	fcmp	d25, d27
	fccmp	d25, d26, #4, ne
	b.ne	LBB3_92
; %bb.91:                               ;   in Loop: Header=BB3_38 Depth=3
	add	x12, sp, #1, lsl #12            ; =4096
	add	x12, x12, #832
	add	x12, x12, x14, lsl #3
	ldr	d25, [x12]
	b	LBB3_95
LBB3_92:                                ;   in Loop: Header=BB3_38 Depth=3
	fsub	d25, d25, d26
	mov	x12, #18874                     ; =0x49ba
	movk	x12, #524, lsl #16
	movk	x12, #9003, lsl #32
	movk	x12, #49286, lsl #48
	fmov	d27, x12
	fcmp	d25, d27
	fcsel	d25, d27, d25, mi
	mov	x12, #33534                     ; =0x82fe
	movk	x12, #25899, lsl #16
	movk	x12, #5447, lsl #32
	movk	x12, #16375, lsl #48
	fmov	d27, x12
	fmul	d27, d25, d27
	fcmp	d27, #0.0
	fcsel	d28, d24, d23, ge
	fadd	d27, d27, d28
	fcvtzs	z27.d, p0/m, z27.d
	movprfx	z28, z27
	scvtf	z28.d, p0/m, z27.d
	fmov	x12, d27
	mov	x15, #4276092928                ; =0xfee00000
	movk	x15, #11842, lsl #32
	movk	x15, #49126, lsl #48
	fmov	d27, x15
	fmadd	d25, d28, d27, d25
	mov	x15, #15478                     ; =0x3c76
	movk	x15, #13689, lsl #16
	movk	x15, #14831, lsl #32
	movk	x15, #48618, lsl #48
	fmov	d27, x15
	fmadd	d25, d28, d27, d25
	mov	x15, #40986                     ; =0xa01a
	movk	x15, #6657, lsl #16
	movk	x15, #416, lsl #32
	movk	x15, #16170, lsl #48
	fmov	d27, x15
	mov	x15, #40986                     ; =0xa01a
	movk	x15, #6657, lsl #16
	movk	x15, #416, lsl #32
	movk	x15, #16122, lsl #48
	fmov	d28, x15
	fmadd	d27, d25, d28, d27
	mov	x15, #27671                     ; =0x6c17
	movk	x15, #5825, lsl #16
	movk	x15, #49516, lsl #32
	movk	x15, #16214, lsl #48
	fmov	d28, x15
	fmadd	d27, d27, d25, d28
	mov	x15, #1229782938247303441       ; =0x1111111111111111
	movk	x15, #16257, lsl #48
	fmov	d28, x15
	fmadd	d27, d27, d25, d28
	mov	x15, #6148914691236517205       ; =0x5555555555555555
	movk	x15, #16293, lsl #48
	fmov	d28, x15
	fmadd	d27, d27, d25, d28
	mov	x15, #6148914691236517205       ; =0x5555555555555555
	movk	x15, #16325, lsl #48
	fmov	d28, x15
	fmadd	d27, d27, d25, d28
	fmadd	d27, d27, d25, d24
	fmadd	d27, d27, d25, d1
	fmadd	d25, d27, d25, d1
	mov	x15, #4607182418800017408       ; =0x3ff0000000000000
	add	x12, x15, x12, lsl #52
	fmov	d27, x12
	fmul	d27, d25, d27
	add	x12, sp, #1, lsl #12            ; =4096
	add	x12, x12, #832
	add	x12, x12, x14, lsl #3
	ldr	d25, [x12]
	fmul	d25, d27, d25
	str	d25, [x12]
	fcmp	d27, d1
	b.eq	LBB3_95
; %bb.93:                               ;   in Loop: Header=BB3_38 Depth=3
	mov	x15, #0                         ; =0x0
	mov	z27.d, d27
LBB3_94:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ;       Parent Loop BB3_38 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ld1d	{ z28.d }, p0/z, [x6, x15, lsl #3]
	fmul	z28.d, z27.d, z28.d
	st1d	{ z28.d }, p0, [x6, x15, lsl #3]
	add	x15, x15, #8
	cmp	x15, x10
	b.lt	LBB3_94
LBB3_95:                                ;   in Loop: Header=BB3_38 Depth=3
	mov	z27.d, d26
	ldr	z26, [x9]
	fsub	z26.d, z26.d, z27.d
	fmax	z26.d, p0/m, z26.d, z2.d
	fmul	z28.d, z26.d, z3.d
	fcvtzs	z28.d, p0/m, z28.d
	movprfx	z29, z28
	scvtf	z29.d, p0/m, z28.d
	mov	z30.d, z29.d
	fmsb	z30.d, p0/m, z4.d, z26.d
	fmsb	z29.d, p0/m, z5.d, z30.d
	mov	z26.d, z7.d
	fmad	z26.d, p0/m, z29.d, z6.d
	fmad	z26.d, p0/m, z29.d, z16.d
	fmad	z26.d, p0/m, z29.d, z17.d
	fmad	z26.d, p0/m, z29.d, z18.d
	fmad	z26.d, p0/m, z29.d, z19.d
	fmad	z26.d, p0/m, z29.d, z20.d
	fmad	z26.d, p0/m, z29.d, z21.d
	fmad	z26.d, p0/m, z29.d, z21.d
	add	z28.d, z28.d, z22.d
	lsl	z28.d, z28.d, #52
	fmul	z26.d, z26.d, z28.d
	add	x15, sp, #768
	str	z26, [x15]
	ldr	d28, [sp, #768]
	ldr	d29, [sp, #776]
	add	x15, sp, #832
	add	x15, x15, x14, lsl #3
	str	d28, [x15]
	str	d29, [x15, #128]
	ldr	d28, [sp, #784]
	ldr	d29, [sp, #792]
	str	d28, [x15, #256]
	str	d29, [x15, #384]
	ldr	d28, [sp, #800]
	ldr	d29, [sp, #808]
	str	d28, [x15, #512]
	str	d29, [x15, #640]
	ldr	d28, [sp, #816]
	ldr	d29, [sp, #824]
	str	d28, [x15, #768]
	str	d29, [x15, #896]
	faddv	d26, p0, z26.d
	cmp	x21, #9
	b.lt	LBB3_97
; %bb.96:                               ;   in Loop: Header=BB3_38 Depth=3
	ld1d	{ z28.d }, p0/z, [x9, x20, lsl #3]
	fsub	z27.d, z28.d, z27.d
	fmax	z27.d, p0/m, z27.d, z2.d
	fmul	z28.d, z27.d, z3.d
	fcvtzs	z28.d, p0/m, z28.d
	movprfx	z29, z28
	scvtf	z29.d, p0/m, z28.d
	mov	z30.d, z29.d
	fmsb	z30.d, p0/m, z4.d, z27.d
	fmsb	z29.d, p0/m, z5.d, z30.d
	mov	z27.d, z7.d
	fmad	z27.d, p0/m, z29.d, z6.d
	fmad	z27.d, p0/m, z29.d, z16.d
	fmad	z27.d, p0/m, z29.d, z17.d
	fmad	z27.d, p0/m, z29.d, z18.d
	fmad	z27.d, p0/m, z29.d, z19.d
	fmad	z27.d, p0/m, z29.d, z20.d
	fmad	z27.d, p0/m, z29.d, z21.d
	fmad	z27.d, p0/m, z29.d, z21.d
	add	z28.d, z28.d, z22.d
	lsl	z28.d, z28.d, #52
	fmul	z27.d, z27.d, z28.d
	add	x9, sp, #704
	str	z27, [x9]
	ldr	d28, [sp, #704]
	ldr	d29, [sp, #712]
	str	d28, [x15, #1024]
	str	d29, [x15, #1152]
	ldr	d28, [sp, #720]
	ldr	d29, [sp, #728]
	str	d28, [x15, #1280]
	str	d29, [x15, #1408]
	ldr	d28, [sp, #736]
	ldr	d29, [sp, #744]
	str	d28, [x15, #1536]
	str	d29, [x15, #1664]
	ldr	d28, [sp, #752]
	ldr	d29, [sp, #760]
	str	d28, [x15, #1792]
	str	d29, [x15, #1920]
	faddv	d27, p0, z27.d
	fadd	d26, d26, d27
LBB3_97:                                ;   in Loop: Header=BB3_38 Depth=3
	add	x15, sp, #2880
	fadd	d25, d25, d26
	str	d25, [x12]
	add	x14, x14, #1
	add	x6, x6, x13
	cmp	x14, #16
	b.ne	LBB3_38
LBB3_98:                                ;   in Loop: Header=BB3_16 Depth=2
	ldr	x9, [sp, #632]                  ; 8-byte Folded Reload
	cmp	w9, #15
	b.gt	LBB3_101
; %bb.99:                               ;   in Loop: Header=BB3_16 Depth=2
	ldp	x9, x12, [sp, #328]             ; 16-byte Folded Reload
LBB3_100:                               ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	str	xzr, [x9]
	str	xzr, [x9, #128]
	str	xzr, [x9, #256]
	str	xzr, [x9, #384]
	str	xzr, [x9, #512]
	str	xzr, [x9, #640]
	str	xzr, [x9, #768]
	str	xzr, [x9, #896]
	str	xzr, [x9, #1024]
	str	xzr, [x9, #1152]
	str	xzr, [x9, #1280]
	str	xzr, [x9, #1408]
	str	xzr, [x9, #1536]
	str	xzr, [x9, #1664]
	add	x12, x12, #1
	str	xzr, [x9, #1792]
	str	xzr, [x9, #1920]
	add	x9, x9, #8
	cmp	x12, #15
	b.lt	LBB3_100
LBB3_101:                               ;   in Loop: Header=BB3_16 Depth=2
	cmp	w21, #15
	ldr	x5, [sp, #520]                  ; 8-byte Folded Reload
	b.gt	LBB3_103
LBB3_102:                               ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	stp	xzr, xzr, [x23, #-64]
	stp	xzr, xzr, [x23, #-48]
	stp	xzr, xzr, [x23, #-32]
	stp	xzr, xzr, [x23, #-16]
	stp	xzr, xzr, [x23]
	stp	xzr, xzr, [x23, #16]
	stp	xzr, xzr, [x23, #32]
	add	x17, x17, #1
	stp	xzr, xzr, [x23, #48]
	add	x23, x23, #128
	cmp	x17, #15
	b.lt	LBB3_102
LBB3_103:                               ;   in Loop: Header=BB3_16 Depth=2
	cmp	x10, #16
	b.hs	LBB3_127
; %bb.104:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	x9, #0                          ; =0x0
	ldr	x6, [sp, #472]                  ; 8-byte Folded Reload
	ldr	x4, [sp, #408]                  ; 8-byte Folded Reload
	ldr	x23, [sp, #632]                 ; 8-byte Folded Reload
LBB3_105:                               ;   in Loop: Header=BB3_16 Depth=2
	cmp	x9, x10
	ldr	x17, [sp, #616]                 ; 8-byte Folded Reload
	b.ge	LBB3_15
; %bb.106:                              ;   in Loop: Header=BB3_16 Depth=2
	zero	{za}
	cmp	x21, #1
	b.lt	LBB3_109
; %bb.107:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	x12, #0                         ; =0x0
	ldr	x14, [sp, #672]                 ; 8-byte Folded Reload
	add	x14, x14, x9, lsl #3
	add	x15, sp, #832
LBB3_108:                               ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	z25, [x15]
	ld1d	{ z26.d }, p0/z, [x15, x20, lsl #3]
	ldr	z27, [x14]
	fmopa	za0.d, p0/m, p0/m, z25.d, z27.d
	fmopa	za1.d, p0/m, p0/m, z26.d, z27.d
	add	x12, x12, #1
	add	x15, x15, #128
	add	x14, x14, x13
	cmp	x21, x12
	b.gt	LBB3_108
LBB3_109:                               ;   in Loop: Header=BB3_16 Depth=2
	add	x9, x3, x9, lsl #3
	cbz	x8, LBB3_118
; %bb.110:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ld1d	{ z26.d }, p0/z, [x9, x16, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x16, lsl #3]
	cmp	x8, #1
	b.eq	LBB3_118
; %bb.111:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #1                         ; =0x1
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ld1d	{ z26.d }, p0/z, [x9, x11, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x11, lsl #3]
	cmp	x8, #2
	b.eq	LBB3_118
; %bb.112:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #2                         ; =0x2
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ld1d	{ z26.d }, p0/z, [x9, x5, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x5, lsl #3]
	cmp	x8, #3
	b.eq	LBB3_118
; %bb.113:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #3                         ; =0x3
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #592]                 ; 8-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x12, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x12, lsl #3]
	cmp	x8, #4
	b.eq	LBB3_118
; %bb.114:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #4                         ; =0x4
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #368]                 ; 8-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x12, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x12, lsl #3]
	cmp	x8, #5
	b.eq	LBB3_118
; %bb.115:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #5                         ; =0x5
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #192]                 ; 8-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x12, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x12, lsl #3]
	cmp	x8, #6
	b.eq	LBB3_118
; %bb.116:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #6                         ; =0x6
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #104]                 ; 8-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x12, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x12, lsl #3]
	cmp	x8, #7
	b.eq	LBB3_118
; %bb.117:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #7                         ; =0x7
	mov	z25.d, p0/m, za0h.d[w12, 0]
	ldr	x12, [sp, #80]                  ; 8-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x12, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x12, lsl #3]
LBB3_118:                               ;   in Loop: Header=BB3_16 Depth=2
	cmp	x25, x22
	b.ge	LBB3_15
; %bb.119:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #0                         ; =0x0
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ld1d	{ z26.d }, p0/z, [x9, x19, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x19, lsl #3]
	ldr	x12, [sp, #696]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_15
; %bb.120:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #1                         ; =0x1
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ld1d	{ z26.d }, p0/z, [x9, x30, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x30, lsl #3]
	ldr	x12, [sp, #688]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_15
; %bb.121:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #2                         ; =0x2
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #648]                 ; 8-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x12, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x12, lsl #3]
	ldr	x12, [sp, #640]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_15
; %bb.122:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #3                         ; =0x3
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #552]                 ; 8-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x12, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x12, lsl #3]
	ldr	x12, [sp, #544]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_15
; %bb.123:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #4                         ; =0x4
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldp	x12, x14, [sp, #352]            ; 16-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x14, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x14, lsl #3]
	cmp	x12, x22
	b.ge	LBB3_15
; %bb.124:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #5                         ; =0x5
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldp	x12, x14, [sp, #176]            ; 16-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x14, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x14, lsl #3]
	cmp	x12, x22
	b.ge	LBB3_15
; %bb.125:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #6                         ; =0x6
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldp	x12, x14, [sp, #88]             ; 16-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x14, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x14, lsl #3]
	cmp	x12, x22
	b.ge	LBB3_15
; %bb.126:                              ;   in Loop: Header=BB3_16 Depth=2
	mov	w12, #7                         ; =0x7
	mov	z25.d, p0/m, za1h.d[w12, 0]
	ldr	x12, [sp, #72]                  ; 8-byte Folded Reload
	ld1d	{ z26.d }, p0/z, [x9, x12, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x9, x12, lsl #3]
	b	LBB3_15
LBB3_127:                               ;   in Loop: Header=BB3_16 Depth=2
	mov	x9, #0                          ; =0x0
	ldr	x14, [sp, #672]                 ; 8-byte Folded Reload
	mov	w15, #16                        ; =0x10
	ldr	x6, [sp, #472]                  ; 8-byte Folded Reload
	ldr	x4, [sp, #408]                  ; 8-byte Folded Reload
	ldr	x23, [sp, #632]                 ; 8-byte Folded Reload
	b	LBB3_129
LBB3_128:                               ;   in Loop: Header=BB3_129 Depth=3
	add	x15, x9, #16
	add	x14, x14, #128
	cmp	x15, x10
	b.gt	LBB3_105
LBB3_129:                               ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB3_131 Depth 4
	mov	x12, x9
	mov	x9, x15
	zero	{za}
	cmp	x21, #1
	b.lt	LBB3_132
; %bb.130:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	x15, #0                         ; =0x0
	add	x17, sp, #832
	mov	x1, x14
LBB3_131:                               ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_16 Depth=2
                                        ;       Parent Loop BB3_129 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	z25, [x17]
	ld1d	{ z26.d }, p0/z, [x17, x20, lsl #3]
	ldr	z27, [x1]
	ld1d	{ z28.d }, p0/z, [x1, x20, lsl #3]
	fmopa	za0.d, p0/m, p0/m, z25.d, z27.d
	fmopa	za1.d, p0/m, p0/m, z26.d, z27.d
	fmopa	za2.d, p0/m, p0/m, z25.d, z28.d
	fmopa	za3.d, p0/m, p0/m, z26.d, z28.d
	add	x15, x15, #1
	add	x17, x17, #128
	add	x1, x1, x13
	cmp	x21, x15
	b.gt	LBB3_131
LBB3_132:                               ;   in Loop: Header=BB3_129 Depth=3
	add	x17, x3, x12, lsl #3
	cbz	x8, LBB3_141
; %bb.133:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w12, #0                         ; =0x0
	mov	z25.d, p0/m, za0h.d[w12, 0]
	add	x15, x17, x16, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x16, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x16, lsl #3]
	mov	z25.d, p0/m, za2h.d[w12, 0]
	ld1d	{ z26.d }, p0/z, [x15, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x15, x20, lsl #3]
	cmp	x8, #1
	b.eq	LBB3_141
; %bb.134:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #1                         ; =0x1
	mov	z25.d, p0/m, za0h.d[w15, 0]
	add	x12, x17, x11, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x11, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x11, lsl #3]
	mov	z25.d, p0/m, za2h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	cmp	x8, #2
	b.eq	LBB3_141
; %bb.135:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #2                         ; =0x2
	mov	z25.d, p0/m, za0h.d[w15, 0]
	add	x12, x17, x5, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x5, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x5, lsl #3]
	mov	z25.d, p0/m, za2h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	cmp	x8, #3
	b.eq	LBB3_141
; %bb.136:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #3                         ; =0x3
	mov	z25.d, p0/m, za0h.d[w15, 0]
	ldr	x1, [sp, #592]                  ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za2h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	cmp	x8, #4
	b.eq	LBB3_141
; %bb.137:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #4                         ; =0x4
	mov	z25.d, p0/m, za0h.d[w15, 0]
	ldr	x1, [sp, #368]                  ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za2h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	cmp	x8, #5
	b.eq	LBB3_141
; %bb.138:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #5                         ; =0x5
	mov	z25.d, p0/m, za0h.d[w15, 0]
	ldr	x1, [sp, #192]                  ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za2h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	cmp	x8, #6
	b.eq	LBB3_141
; %bb.139:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #6                         ; =0x6
	mov	z25.d, p0/m, za0h.d[w15, 0]
	ldr	x1, [sp, #104]                  ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za2h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	cmp	x8, #7
	b.eq	LBB3_141
; %bb.140:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #7                         ; =0x7
	mov	z25.d, p0/m, za0h.d[w15, 0]
	ldr	x1, [sp, #80]                   ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za2h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
LBB3_141:                               ;   in Loop: Header=BB3_129 Depth=3
	cmp	x25, x22
	b.ge	LBB3_128
; %bb.142:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w12, #0                         ; =0x0
	mov	z25.d, p0/m, za1h.d[w12, 0]
	add	x15, x17, x19, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x19, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x19, lsl #3]
	mov	z25.d, p0/m, za3h.d[w12, 0]
	ld1d	{ z26.d }, p0/z, [x15, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x15, x20, lsl #3]
	ldr	x12, [sp, #696]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_128
; %bb.143:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #1                         ; =0x1
	mov	z25.d, p0/m, za1h.d[w15, 0]
	add	x12, x17, x30, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x30, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x30, lsl #3]
	mov	z25.d, p0/m, za3h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	ldr	x12, [sp, #688]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_128
; %bb.144:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #2                         ; =0x2
	mov	z25.d, p0/m, za1h.d[w15, 0]
	ldr	x1, [sp, #648]                  ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za3h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	ldr	x12, [sp, #640]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_128
; %bb.145:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #3                         ; =0x3
	mov	z25.d, p0/m, za1h.d[w15, 0]
	ldr	x1, [sp, #552]                  ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za3h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	ldr	x12, [sp, #544]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_128
; %bb.146:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #4                         ; =0x4
	mov	z25.d, p0/m, za1h.d[w15, 0]
	ldr	x1, [sp, #360]                  ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za3h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	ldr	x12, [sp, #352]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_128
; %bb.147:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #5                         ; =0x5
	mov	z25.d, p0/m, za1h.d[w15, 0]
	ldr	x1, [sp, #184]                  ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za3h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	ldr	x12, [sp, #176]                 ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_128
; %bb.148:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #6                         ; =0x6
	mov	z25.d, p0/m, za1h.d[w15, 0]
	ldr	x1, [sp, #96]                   ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za3h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	ldr	x12, [sp, #88]                  ; 8-byte Folded Reload
	cmp	x12, x22
	b.ge	LBB3_128
; %bb.149:                              ;   in Loop: Header=BB3_129 Depth=3
	mov	w15, #7                         ; =0x7
	mov	z25.d, p0/m, za1h.d[w15, 0]
	ldr	x1, [sp, #72]                   ; 8-byte Folded Reload
	add	x12, x17, x1, lsl #3
	ld1d	{ z26.d }, p0/z, [x17, x1, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x17, x1, lsl #3]
	mov	z25.d, p0/m, za3h.d[w15, 0]
	ld1d	{ z26.d }, p0/z, [x12, x20, lsl #3]
	fadd	z25.d, z25.d, z26.d
	st1d	{ z25.d }, p0, [x12, x20, lsl #3]
	b	LBB3_128
LBB3_150:                               ;   in Loop: Header=BB3_4 Depth=1
	cmp	x23, #1
	ldp	x1, x14, [sp, #56]              ; 16-byte Folded Reload
	ldr	x17, [sp, #8]                   ; 8-byte Folded Reload
	b.lt	LBB3_3
; %bb.151:                              ;   in Loop: Header=BB3_4 Depth=1
	mov	x9, #0                          ; =0x0
	ldr	x11, [sp, #576]                 ; 8-byte Folded Reload
	b	LBB3_153
LBB3_152:                               ;   in Loop: Header=BB3_153 Depth=2
	add	x9, x9, #1
	add	x11, x11, x13
	cmp	x9, x23
	b.ge	LBB3_3
LBB3_153:                               ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_155 Depth 3
	add	x12, sp, #1, lsl #12            ; =4096
	add	x12, x12, #832
	ldr	d25, [x12, x9, lsl #3]
	fcmp	d25, #0.0
	b.eq	LBB3_152
; %bb.154:                              ;   in Loop: Header=BB3_153 Depth=2
	mov	x12, #0                         ; =0x0
	fdiv	d25, d1, d25
	mov	z25.d, d25
LBB3_155:                               ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_153 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ld1d	{ z26.d }, p0/z, [x11, x12, lsl #3]
	fmul	z26.d, z25.d, z26.d
	st1d	{ z26.d }, p0, [x11, x12, lsl #3]
	add	x12, x12, #8
	cmp	x12, x10
	b.lt	LBB3_155
	b	LBB3_152
                                        ; -- End function
.subsections_via_symbols
