
void fun();
int main()
{
	unsigned int *PGFCON = (unsigned int *)0x56000050;
	unsigned int *PGFDAT = (unsigned int *)0x56000054;

	/* 配置GPF5为输出口 */
	*PGFCON = 0x444400;

	/* 配置GPF5输出低 */
	*PGFDAT &= 0xDF;

	fun();

	return 0;
}

void fun(){
	return;
}

