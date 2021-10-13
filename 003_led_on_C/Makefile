all:
	arm-none-eabi-gcc -c -o led.o led.c
	arm-none-eabi-gcc -c -o start.o start.S
	arm-none-eabi-ld -Ttext 0 start.o led.o -o led.elf
	arm-none-eabi-objcopy -O binary -S led.elf led.bin
	arm-none-eabi-objdump -D led.elf > led.dis
clean:
	rm *.bin *.o *.elf *.dis

