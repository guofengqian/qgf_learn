objects = start.o led.o delay.o uart0.o main.o
dep_files := $(patsubst %,.%.d, $(objects))
dep_files1 = $(wildcard $(dep_files))

uart0.bin : uart0.elf
	@echo files = $(dep_files1)
	arm-none-eabi-objcopy -O binary -S uart0.elf uart0.bin
uart0.elf : $(objects) 
	arm-none-eabi-ld -Ttext 0 $^ -o $@
uart0.o: uart0.c uart0.h
%.o     : %.c
	arm-none-eabi-gcc -c -o $@ $< -MD -MF .$@.d
%.o     : %.S
	arm-none-eabi-gcc -c -o $@ $<

uart0.dis:uart0.elf
	arm-none-eabi-objdump -D uart0.elf > uart0.dis
clean:
	rm *.bin *.o *.elf  

.PHONY: clean


	

