	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"led.c"
	.text
	.align	2
	.global	delay
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	nop
.L2:
	ldr	r3, [fp, #-8]
	sub	r2, r3, #1
	str	r2, [fp, #-8]
	cmp	r3, #0
	bne	.L2
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	ldr	r3, .L11
	ldr	r3, [r3]
	ldr	r2, .L11
	bic	r3, r3, #16128
	str	r3, [r2]
	ldr	r3, .L11
	ldr	r3, [r3]
	ldr	r2, .L11
	orr	r3, r3, #5376
	str	r3, [r2]
	ldr	r3, .L11
	ldr	r3, [r3]
	ldr	r2, .L11
	bic	r3, r3, #51
	str	r3, [r2]
	ldr	r3, .L11+4
	ldr	r3, [r3]
	ldr	r2, .L11+4
	bic	r3, r3, #192
	str	r3, [r2]
.L10:
	ldr	r3, .L11+8
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L11+12
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L4
	ldr	r3, .L11+8
	ldr	r3, [r3]
	ldr	r2, .L11+8
	orr	r3, r3, #16
	str	r3, [r2]
	b	.L5
.L4:
	ldr	r3, .L11+8
	ldr	r3, [r3]
	ldr	r2, .L11+8
	bic	r3, r3, #16
	str	r3, [r2]
.L5:
	ldr	r3, [fp, #-8]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L6
	ldr	r3, .L11+8
	ldr	r3, [r3]
	ldr	r2, .L11+8
	orr	r3, r3, #32
	str	r3, [r2]
	b	.L7
.L6:
	ldr	r3, .L11+8
	ldr	r3, [r3]
	ldr	r2, .L11+8
	bic	r3, r3, #32
	str	r3, [r2]
.L7:
	ldr	r3, [fp, #-12]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L8
	ldr	r3, .L11+8
	ldr	r3, [r3]
	ldr	r2, .L11+8
	orr	r3, r3, #64
	str	r3, [r2]
	b	.L10
.L8:
	ldr	r3, .L11+8
	ldr	r3, [r3]
	ldr	r2, .L11+8
	bic	r3, r3, #64
	str	r3, [r2]
	b	.L10
.L12:
	.align	2
.L11:
	.word	1442840656
	.word	1442840672
	.word	1442840660
	.word	1442840676
	.size	main, .-main
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.07) 10.3.1 20210621 (release)"
