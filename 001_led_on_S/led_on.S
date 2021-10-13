.global _start

_start:
/* 配置GPF4为输出引脚
   把0x100写入地址0x56000050
 */
	ldr r1, = 0x56000050
	ldr r0, = 0x100 // mov r0, #0x100
	str r0,[r1]

/*
 设置GPF4输出高电平
 把0写道地址0x56000054
 */
	ldr r1, = 0x56000054
	ldr r0, = 0x0
	str r0, [r1]

halt:
	b halt

