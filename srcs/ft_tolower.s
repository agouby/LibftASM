global ft_tolower
extern ft_isupper

section .text

ft_tolower:
	call ft_isupper
	cmp rax, 0x0
	je err
	mov rax, rdi
	add rax, 0x20
	jmp end

err:
	mov rax, rdi

end:
	ret
