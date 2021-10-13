#include "uart0.h"

#define PCLK             50000000 //start.S中设置PCLK为50Mhz
#define UART0_CLK        PCLK // uart0的时钟源设为PCLK
#define UART0_BAUD_RATE  115200
#define UART0_BRD        ((UART0_CLK / (UART0_BAUD_RATE * 16)) - 1)

void uart0_init(void)
{
	//1. 设置引脚用于串口
	//	GPH2,3用于TXD0,RXD0
	GPHCON &= ~(0x0f << 4);
	GPHCON |= 0xa0;

	// GPH2,3开启上拉
	GPHUP &= ~(3 << 2);

	/* 
	 * 2. 设置波特率: 115200
		UBRDIVn = (int)(UART clock / (baud rate x 16) ) - 1
			UART clock = PCLK = 50M
			UBRTDIV0 = (50000000 / (115200 * 16) - 1 = 26.12 
	*/
	UCON0 = 0x5; //UART clock = PCLK, 中断/查询模式
	UBRDIV0 = UART0_BRD;

	/*
	 * 3. 设置数据格式: 8N1
	 * */
	ULCON0 = 0x03; //8个数据位，无校验位，1个停止位
	UMCON0 = 0;    //不使用流控
}

int putChar(unsigned char c)
{
	/* UTRSTAT0 */
	while (!(UTRSTAT0 & (1<<2))); // 0 = not empty
	UTXH0 = (unsigned char)c;
}

int getChar(void)
{
	while (!(UTRSTAT0 & 1)); // 0 = empty
	return URXH0;
}

int puts(const char *s)
{
	while (*s){
		putChar(*s);
		s++;
	}
}
