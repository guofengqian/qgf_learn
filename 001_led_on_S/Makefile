all:
	arm-none-eabi-gcc -c -o led_on.o led_on.S
	arm-none-eabi-ld -Ttext 0 led_on.o -o led_on.elf
	arm-none-eabi-objcopy -O binary -S led_on.elf led_on.bin
	arm-none-eabi-objdump -D led_on.elf > led_on.dis
clean:
	rm *.bin *.o *.elf

