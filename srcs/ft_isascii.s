global ft_isascii

section .text

ft_isascii:
	cmp rdi, 0x0
	jl err
	cmp rdi, 0x7F
	jg err
	mov rax, 0x1
	jmp end

err:
	xor rax, rax

end:
	ret
