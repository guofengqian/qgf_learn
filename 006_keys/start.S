.text
.global _start

_start:
	/* 关闭看门狗 */
	ldr r0, = 0x53000000
	ldr r1, = 0
	str r1, [r0]

	/* 设置内存：SP栈 */
	/* 分辨是NAND/NOR启动 */
	/*写0到0地址，再读出来
	 如果得到0，表明是NAND启动*/
	mov r1, #0
	ldr r0, [r1] //读出原来的值备份
	str r1, [r1] //0 -> [0]
	ldr r2, [r1] //r2 = [0]
	cmp r1, r2 // r1==r2  => NAND启动
	ldr sp, = 0x40000000 + 4096
	moveq sp, #4096 //NAND启动
	streq r0,[r1] //恢复原来的值

	/* 调用main */
	bl main

halt:	
	b halt
