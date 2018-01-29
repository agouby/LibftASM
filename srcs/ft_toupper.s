global ft_toupper

ft_toupper:
	mov rax, rdi
	cmp rdi, 97
	jl _exit
	cmp rdi, 122
	jg _exit
	sub rax, 32
	jmp _exit

_exit:
	ret
