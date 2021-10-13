#include "s3c24xx.h"
#include "led.h"
#include "uart0.h"

int main(void)
{
	char c;

	/* 初始化 */
	led_init();	
	uart0_init();
	puts("hello world");	

	while (1)
	{
		c = (char)getChar();
		led_D11_On();
		putChar(c);
		led_D11_Off();
		putChar(c);
	}

	return 0;
}
