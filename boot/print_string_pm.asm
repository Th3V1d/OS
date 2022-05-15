bits 32
print_string_pm:
	pusha
	lodsb
	or al, al
	jz done
	or eax, 0x0100
	
	mov word [ebx], ax
	add ebx, 2
	jmp print_string_pm

done:
	popa
	ret
	
	

halt:
	cli
	hlt
