	.equ    STACK,      0x8000
	.equ	sii, 247
	.equ	do, 494
	.equ	re, 587
	.equ	mi, 659
	.equ	fa, 698
	.equ	so, 784
	.equ	ra_f,831
	.equ	ra, 880
	.equ	si_f,932
	.equ	si, 988
	.equ	DO, 1047
	.equ	DO_s, 1109
	.equ	RE, 1175
	.equ	RE_s, 1245
	.equ	MI_f,1245
	.equ	MI, 1319
	.equ	FA, 1397
	.equ	FA_s, 1480
	.equ	SO, 1568
	.equ	SO_s, 1661
	.equ	RA, 1760
	.equ	SI, 1976
	.equ	DOO, 2093
	.equ	DOOO, 4186
	.equ	REEE, 4699
	.equ	MIII, 5274
	.equ	SOOO, 6272

	
	.section .text
	.global dezimon2

dezimon2:
	@ r1に周波数の先頭番地, r2に音数を入れるサブルーチン
	mov     sp, #STACK
	
	@ レジスタの値を保存
        str	r0, [sp, #-4]!
	str	r3, [sp, #-4]!
	str	r4, [sp, #-4]!
	str	r5, [sp, #-4]!
	str	r6, [sp, #-4]!
	str	r7, [sp, #-4]!
	str	r8, [sp, #-4]!
	str	r9, [sp, #-4]!
	str	r10,[sp, #-4]!
	str	r11, [sp, #-4]!
	str	r12, [sp, #-4]!
	sub	sp, sp, #4

	cmp	r7, #7
	ldreq	r1, =A_
	moveq	r2, #64
	
	cmp	r7, #6
	ldreq	r1, =B_
	moveq	r2, #64
	
	cmp	r7, #5
	ldreq	r1, =C_
	moveq	r2, #64
	
	cmp	r7, #4
	ldreq	r1, =D_
	moveq	r2, #64
	
	cmp	r7, #3
	ldreq	r1, =E_
	moveq	r2, #64
	
	cmp	r7, #2
	ldreq	r1, =F_
	moveq	r2, #64
	
	cmp	r7, #1
	ldreq	r1, =G_
	moveq	r2, #64
	
	@ レジスタを復元
	add	sp, sp, #4
	ldr	r12, [sp], #4	
	ldr	r11, [sp], #4
	ldr	r10, [sp], #4
	ldr	r9, [sp], #4
	ldr	r8, [sp], #4
	ldr	r7, [sp], #4
	ldr	r6, [sp], #4
	ldr	r5, [sp], #4
	ldr	r4, [sp], #4
	ldr	r3, [sp], #4
	ldr	r0, [sp], #4
	
	bx      r14

	.section .data
A_:	
	.word	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, so, 1, so, 1, so, 1	
	.word	MI, MI, MI, 1, RE_s, RE_s, RE_s, 1, DO_s, 1, si, si, si, 1, so, so
	.word	so, 1, sii, 1, re, 1, so, 1, sii, 1, so, 1, fa, 1, so, 1
	.word	fa, 1, mi, 1, mi, 1, do, 1, mi, 1, fa, 1, so, 1, so, 1
B_:	
	.word	ra, 1, sii, 1, mi, 1, so, 1, sii, 1, mi, 1, so, 1, so, 1
	.word	MI, MI, MI, 1, RE_s, RE_s, RE_s, 1, DO_s, 1, si, si, si, si, so, so
	.word	so, 1, sii, 1, re, 1, so, so, so, so, so, 1, so, 1, so, 1
	.word	ra, 1, so, 1, ra, 1, si, si, si, 1, ra, 1, si, 1, DO_s, DO_s
C_:	
	.word	DO_s, 1, si, 1, DO_s, 1, RE_s, RE_s, RE_s, RE_s, RE_s, 1, 1, 1, 1, 1
	.word	si, 1, mi, fa, si, 1, mi, fa, si, 1, mi, fa, si, si, si, 1
	.word	SI, SI, SI, 1, RA, RA, 1, FA, RA, 1, SI, SI, SI, 1, 1, 1
	.word	MI, MI, MI, MI, MI, 1, FA_s, FA_s, FA_s, FA_s, FA_s, 1, SO_s, SO_s, SO_s, 1
D_:	
	.word	FA_s, FA_s, FA_s, 1, SO_s, 1, FA_s, FA_s, FA_s, 1, MI, 1, RE_s, 1, RE_s, 1
	.word	MI, 1, mi, 1, so, 1, DO_s, 1, so, 1, DO_s, 1, MI, 1, so, 1
	.word	SO_s, 1, FA_s, FA_s, FA_s, 1, MI, MI, MI, 1, MI, 1, FA_s, 1, FA_s, 1
	.word	MI, MI, MI, MI, MI, 1, MI, MI, MI, 1, RE_s, 1, DO_s, 1, si, si
E_:	
	.word	si, 1, so, 1, si, 1, DO_s, DO_s, DO_s, DO_s, DO_s, DO_s, DO_s, 1, DO_s, 1
	.word	MI, 1, DO_s, 1, MI, 1, DO_s, 1, MI, 1, DO_s, 1, DO_s, 1, SO_s, SO_s
	.word	SO_s, 1, SO_s, 1, FA_s, FA_s, FA_s, 1, MI, 1, FA_s, FA_s, FA_s, 1, 1, 1
	.word	MI, MI, MI, MI, MI, 1, FA_s, FA_s, FA_s, FA_s, FA_s, 1, SO_s, SO_s, SO_s, 1
F_:	
	.word	FA_s, FA_s, FA_s, 1, SO_s, 1, FA_s, FA_s, FA_s, 1, MI, 1, RE_s, 1, RE_s, 1
	.word	MI, MI, MI, MI, MI, 1, DO_s, DO_s, DO_s, DO_s, DO_s, 1, DO_s, 1, FA_s, 1
	.word	SO_s, 1, FA_s, FA_s, FA_s, 1, FA_s, 1, SI, 1, MI, 1, RE_s, 1, MI, MI
	.word	MI, MI, MI, MI, MI, 1, MI, MI, MI, 1, RE_s, 1, DO_s, 1, si, si
G_:	
	.word	si, 1, si, 1, FA_s, 1, MI, MI, MI, MI, MI, 1, 1, 1, 1, 1
	.word	MI, mi, so, DO_s, MI, DO_s, so, mi, MI, mi, so, DO_s, MI, DO_s, so, mi
	.word	RE_s, re, fa, ra, RE_s, ra, fa, re, RE_s, re, FA_s, ra, RE_s, ra, fa, re
	.word	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
