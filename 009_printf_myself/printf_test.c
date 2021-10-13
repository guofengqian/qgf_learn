#include <stdio.h>

void printf_test(void)
{
	printf("hello world\n");
	printf("test hex number = 0x%x\n", 0x55aa55aa);
}

int main(int argc, char *argv[])
{
	printf_test();
	return 0;
}
