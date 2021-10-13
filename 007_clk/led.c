

#define GPFCON (*(volatile unsigned int *)0x56000050)
#define GPFDAT (*(volatile unsigned int *)0x56000054)

void delay(unsigned int count){
	while (count--);
}
int main()
{
	unsigned int val = 0;

	// 设置GPFCON让GPF4,GPF5,GPF6为输出引脚
	GPFCON &= ~((3<<8) | (3<<10) | (3<<12));
	GPFCON |= ((1<<8) | (1<<10) | (1<<12));

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

