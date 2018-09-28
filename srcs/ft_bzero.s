global ft_bzero

section .text

ft_bzero:
	xor rcx, rcx
	
loop:
	cmp rsi, rcx
	je end
	mov byte[rdi + rcx], 0x0
	inc rcx
	jmp loop
	
end:
	ret
