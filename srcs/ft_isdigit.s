global ft_isdigit

section .text

ft_isdigit:
	cmp rdi, 0x30 ; '0'
	jl err
	cmp rdi, 0x39 ; '9'
	jg err
	mov rax, 0x1
	jmp end

err:
	xor rax, rax

end:
	ret
