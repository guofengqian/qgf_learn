objects = led.o start.o
dep_files := $(patsubst %,.%.d, $(objects))
dep_files1 = $(wildcard $(dep_files))

led.bin : led.elf
	@echo files = $(dep_files1)
	arm-none-eabi-objcopy -O binary -S led.elf led.bin
led.elf : $(objects) 
	arm-none-eabi-ld -Ttext 0 $^ -o $@
led.o: led.c led.h
%.o     : %.c
	arm-none-eabi-gcc -c -o $@ $< -MD -MF .$@.d
%.o     : %.S
	arm-none-eabi-gcc -c -o $@ $<

led.dis:led.elf
	arm-none-eabi-objdump -D led.elf > led.dis
clean:
	rm *.bin *.o *.elf *.dis *.i *.d 

.PHONY: clean

