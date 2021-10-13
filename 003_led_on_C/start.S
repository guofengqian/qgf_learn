
.text
.global _start

_start:
	/* 设置内存：SP栈 */
	ldr sp, =4096 /* nand启动 */
//	ldr sp, =0x40004096 /* nor启动 */

	/* 调用main */
	bl main

halt:	
	b halt
