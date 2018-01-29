global ft_tolower

ft_tolower:
	mov rax, rdi
	cmp rdi, 65
	jl _exit
	cmp rdi, 90
	jg _exit
	add rax, 32
	jmp _exit

_exit:
	ret
