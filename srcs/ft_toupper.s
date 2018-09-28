global ft_toupper
extern ft_islower

section .text

ft_toupper:
	call ft_islower
	cmp rax, 0x0
	je err
	mov rax, rdi
	sub rax, 0x20
	jmp end

err:
	mov rax, rdi

end:
	ret
