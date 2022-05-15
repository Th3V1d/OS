disk_load:
	xor ax, ax
	mov ds, ax
	cld
	
	mov ah, 2h
	mov al, 15
	mov ch, 0
	mov cl, 2
	mov dh, 0
	
	xor bx, bx
	mov es, bx
	
	mov bx, 0x1000
	int 13h
	jc disk_error
	jmp 0x7e00

disk_error:
	mov si, DISK_ERROR_MSG
	call print_string
	jmp $

DISK_ERROR_MSG:
	db "Disk read error", 0


