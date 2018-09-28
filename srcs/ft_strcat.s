global ft_strcat
extern ft_strlen

section .text

ft_strcat:
	call ft_strlen
	xor rcx, rcx

loop:
	cmp byte[rsi + rcx], 0x0
	je end
	mov r8b, byte[rsi + rcx]
	mov byte[rdi + rax], r8b
	inc rax
	inc rcx
	jmp loop

end:
	mov rax, rdi
	ret
