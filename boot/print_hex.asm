print_hex:
	pusha

	mov cx, 4
	
	call char_loop

char_loop:
	dec cx
	
	mov ax, dx
	shr dx, 4
	and ax, 0xf
	
	mov bx, HEX_OUT
	add bx, 2
	add bx, cx
	
	cmp ax, 0xa
	jl set_letter
	add byte [bx], 7
	
	jl set_letter

set_letter:
	add byte [bx], al
	
	cmp cx, 0
	je print_hex_done
	jmp char_loop
	
print_hex_done:
	mov bx, HEX_OUT
	call print_string
	
	popa
	ret


HEX_OUT:
	db '0x0000', 0
