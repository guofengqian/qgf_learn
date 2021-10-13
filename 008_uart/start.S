
.text
.global _start

_start:
	/* 0. 关闭看门狗 */
	ldr r0, = 0x53000000
	ldr r1, = 0
	str r1, [r0]


	/* 1. 硬件上配置时钟源: 外部时钟振荡器 */
//	OM[3:2] = 00 

	/* 2. 配置MPLL, FCLK:HCLK:PCLK = 400:100:50 */
	// 2.1 LOCKTIME
	ldr r0, = 0x4C000000
	ldr r1, = 0xFFFFFFFF
	str r1, [r0]
	// 2.2 CLKDIVN , tFCLK:tHCLK:tPCLK = 1:4:8
	ldr r0, = 0x4C000014
	ldr r1, = 0x5
	str r1, [r0]
	// 2.3 设置CPU工作于异步模式
	mrc p15,0,r0,c1,c0,0
	orr r0,r0,#0xc0000000 //R1_nF:OR:R1_iA
	mcr p15,0,r0,c1,c0,0
	/* 2.4 设置MPLL输出400mhz: MPLLCON=(92<<12) | (1<<4) | (1<<1) 
		m = MDIV+8 = 100
		p = PDIV+2 = 3
		s = SDIV   = 1
		FCLK = 2*m*Fin/(p*2^s) = 399.6Mhz ≈ 400Mhz
	 */
	ldr r0, = 0x4C000004
	ldr r1, = (92<<12)|(1<<4)|(1<<0)
	str r1, [r0]
	/* 一旦设置PLL，就会锁定LOCKTIME直到PLL输出稳定
	   然后CPU工作于新的频率FCLK  
	 */

	/* 3. 分辨是NAND/NOR启动 
	      写0到0地址，再读出来
	      如果得到0，表明是NAND启动
	 */
	mov r1, #0
	ldr r0, [r1] //读出原来的值备份
	str r1, [r1] //0 -> [0]
	ldr r2, [r1] //r2 = [0]
	cmp r1, r2 // r1==r2  => NAND启动

	/* 4. 设置内存：SP栈 */
	ldr sp, = 0x40000000 + 4096
	moveq sp, #4096 //NAND启动
	streq r0,[r1] //恢复原来的值

	/* 调用main */
	bl main 

halt:	
	b halt
