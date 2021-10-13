#include <stdio.h>
struct person {
	char *name;
	char age;
	char score;
};

void push_test(const char *format, ...)
{
	char *p = (char *)&format;
	int i;
	struct person per;
	// 第一个参数
	printf("arg1:%s\n",format);

	// 第二个参数	
	p += sizeof(char *);
	i = *((int *)p);
	printf("arg2:%d\n",i);

	// 第三个参数
	p += sizeof(int);
	per = *((struct person *)p); 
	printf("arg3.name=%s, arg3.age= %d, arg3.score=%c\n",per.name, per.age, per.score);
}

int main(int argc, char **argv)
{
	struct person per = {"qianguofeng",32,98};

	printf("sizeof(char)=%lu\n", sizeof(char ));
    printf("sizeof(int)=%lu\n", sizeof(int));
    printf("sizeof(char *)=%lu\n", sizeof(char *));
    printf("sizeof(char **)=%lu\n", sizeof(int **));

    push_test("qianguofeng",13, per);
	return 0;
}
