; Function to set the ah register as teletype in bios,
; then calling the interrupt
print_string:
	pusha
	mov ah, 0x0e
	loop:
		mov al, [si]
		add si, 1
		int 0x10
	cmp BYTE [si], 0
	jne loop
	popa
	ret
