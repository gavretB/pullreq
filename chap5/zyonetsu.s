	.equ    STACK,      0x8000
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
	.equ	MI_f,1245
	.equ	MI, 1319
	.equ	FA, 1397
	.equ	FA_s, 1480
	.equ	SO, 1568
	.equ	RA, 1760
	.equ	SI, 1976
	.equ	DOO, 2093
	.equ	DOOO, 4186
	.equ	REEE, 4699
	.equ	MIII, 5274
	.equ	SOOO, 6272

	
	.section .text
	.global zyonetsu

zyonetsu:
	@ r1に周波数の先頭番地, r2に音数を入れるサブルーチン
	
	@ レジスタの値を保存
        str	r0, [sp, #-4]!
	str	r2, [sp, #-4]!
	str	r3, [sp, #-4]!
	str	r4, [sp, #-4]!
	str	r5, [sp, #-4]!
	str	r6, [sp, #-4]!
	str	r8, [sp, #-4]!
	str	r9, [sp, #-4]!
	str	r10,[sp, #-4]!
	str	r11, [sp, #-4]!
	str	r12, [sp, #-4]!
	str	r14, [sp, #-4]!
	sub	sp, sp, #4

	cmp	r7, #5
	ldreq	r1, =A_
	
	cmp	r7, #4
	ldreq	r1, =B_
	
	cmp	r7, #3
	ldreq	r1, =C_
	
	cmp	r7, #2
	ldreq	r1, =D_
	
	cmp	r7, #1
	ldreq	r1, =E_
	
	
	@ レジスタを復元
	add	sp, sp, #4
	ldr	r14, [sp], #4
	ldr	r12, [sp], #4	
	ldr	r11, [sp], #4
	ldr	r10, [sp], #4
	ldr	r9, [sp], #4
	ldr	r8, [sp], #4
	ldr	r6, [sp], #4
	ldr	r5, [sp], #4
	ldr	r4, [sp], #4
	ldr	r3, [sp], #4
	ldr	r2, [sp], #4
	ldr	r0, [sp], #4
	
	bx      r14

	.section .data
A_:
	.word	1, 1, RA, 1, RA, 1, RA, 1,  RA, 1, RA, 1, RA, 1, RA, 1, 1, 1, 1, 1
	.word	1, 1, RA, 1, RA, 1, RA, 1,  RA, 1, RA, 1, RA, 1, RA, 1, ra, 1, ra, 1
	.word	RE, RE, RE, MI, 1, 1, FA, FA,  FA, FA, FA, FA, MI, MI, FA, FA	
	.word	SO, 1, FA, MI, 1, do, ra, ra
B_:
	.word   ra, ra, ra, ra, ra, ra, ra, ra
	.word	si_f, 1, ra, DO, 1, si_f, 1, RE, 1, DO_s, 1, si_f, 1, ra, 1, so
	.word	ra, si_f, ra, 1, so, fa, so, 1, ra, ra, ra, ra, ra, ra, ra, ra	
	.word	RE, RE, RE, MI, 1, 1, FA, FA, FA, FA, FA, FA, MI, MI, FA, FA
	.word	SO, SO, RA, RA, SI, SI, RA, RA, SO
C_:
	.word   SO, FA, FA, MI, MI, MI, MI, MI, MI, MI, MI
	.word	RE, MI, 1, FA, 1, MI, 1, SO, 1, FA, 1, RE, MI, MI, FA, FA, SO, SO	
	.word	RA, RA, RA, 1, 1, 1, RA, RA, RA, 1, RA, ra, ra, ra, ra, ra
	.word	RE, RE, RE, MI, 1, 1, FA, FA, FA, FA, FA, FA, MI, MI, SO, SO
	.word	SO, 1, FA
D_:
	.word	MI, 1, DO, ra, ra,  ra, ra, ra, ra, ra, ra, ra, ra	
	.word	si_f, 1, ra, DO, 1, si_f, 1, RE, 1, DO_s, 1, si_f, 1, ra, 1, so
	.word	ra, si_f, ra, 1, so, fa, so, 1, ra, ra ,ra, ra, ra, ra, ra, ra
	.word	RE, RE, RE, MI, 1, 1,FA, FA, FA, FA, FA, FA, MI, MI, FA, FA
	.word	SO, SO
E_:	
	.wordRA, RA, SI, SI, RA, RA, SO, SO, FA, FA, MI, MI, MI, MI, MI, MI, MI, MI
	.word	RE, MI, 1, FA, 1, MI, 1, SO, 1, FA, 1, RE, MI, MI, FA, FA, SO, SO
	.word	RA, RA, RA, 1, 1, 1, RA, RA, RA, 1, RA, ra, ra, ra, ra, ra
	.word	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
