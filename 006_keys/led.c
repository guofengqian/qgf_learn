#include "led.h"

#define GPFCON (*(volatile unsigned int *)0x56000050)
#define GPFDAT (*(volatile unsigned int *)0x56000054)
#define GPGCON (*(volatile unsigned int *)0x56000060)
#define GPGDAT (*(volatile unsigned int *)0x56000064)

void delay(unsigned int count){
	while (count--);
}
int main()
{
	unsigned int val1,val2;

	// 设置GPFCON让GPF4,GPF5,GPF6为输出引脚
	GPFCON &= ~((3<<8) | (3<<10) | (3<<12));
	GPFCON |= ((1<<8) | (1<<10) | (1<<12));
	
	// 设置3个按键为输入引脚
	// GPF0(S2),GPF2(S3),GPG3(S4)
	GPFCON &= ~(3 | (3<<4));
	GPGCON &= ~(3 << 6);


	/* 循环点亮 */
	while (1)
	{
		val1 = GPFDAT; 
		val2 = GPGDAT;

		if (val1 & (1<<0))  // s2 --> GPF0  未按下
			GPFDAT |= 1<<4; //熄灭D10 -> GPF4
		else 
			GPFDAT &= ~(1<<4);

		if (val1 & (1<<2))  // s3 --> GPF2  未按下
			GPFDAT |= 1<<5; //熄灭D11 -> GPF5
		else 
			GPFDAT &= ~(1<<5);

		if (val2 & (1<<3))  // s2 --> GPG3  未按下
			GPFDAT |= 1<<6; //熄灭D12 -> GPG6
		else 
			GPFDAT &= ~(1<<6);
	}
}

