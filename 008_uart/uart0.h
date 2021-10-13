#ifndef _UART0_H
#define _UART0_H

#include "s3c24xx.h"
#include "led.h"
#include "delay.h"

void uart0_init(void);
int putChar(unsigned char c);
int getChar(void);
int puts(const char *s);

#endif
