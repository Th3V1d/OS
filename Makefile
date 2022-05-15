C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

OBJ = ${C_SOURCES : .c=.o}

all: os-image

run: all
	qemu-system-x86_64 os-image
	

os-image: boot/boot.bin kernel.bin
	cat $^ > os-image

kernel.bin: kernel/kernel.o ${OBJ}
	ld -o $@ -Ttext 0x1000 --oformat binary $^

%.o : %.c
	gcc -ffreestanding -c $< -o $@

%.bin : %.asm
	nasm $< -f bin -o $@

clean:
	rm -fr *.bin *.dis *.o os-image *.map
	rm -fr kernel/*.o boot/*.bin drivers/*.o
