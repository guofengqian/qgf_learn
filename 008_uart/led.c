#include "led.h"


#define GPFCON (*(volatile unsigned int *)0x56000050)
#define GPFDAT (*(volatile unsigned int *)0x56000054)

void led_init(void)
{
	// 设置GPFCON让GPF4(D10),
	//			   GPF5(D11),
	//			   GPF6(D12)为输出引脚
	GPFCON &= ~((3<<8) | (3<<10) | (3<<12));
	GPFCON |= ((1<<8) | (1<<10) | (1<<12));

	// 灯灭
	// GPFDAT[6:4]=0b111	
	GPFDAT |= (7<<4);
}

void led_flicker()
{
	unsigned int val = 0;


	/* 循环点亮 */
	while (1)
	{
		GPFDAT &= ~(7<<4);
		GPFDAT |= (val<<4);
		val++;
		delay(100000);
		if (val == 8)
			val = 1;
	}
		
}

void led_D10_On()
{
	GPFDAT &= ~(1<<4);
}

void led_D10_Off()
{
	GPFDAT |= (1<<4);
}

void led_D11_On()
{
	GPFDAT &= ~(1<<5);
}

void led_D11_Off()
{
	GPFDAT |= (1<<5);
}

void led_D12_On()
{
	GPFDAT &= ~(1<<6);
}

void led_D12_Off()
{
	GPFDAT |= (1<<6);
}
