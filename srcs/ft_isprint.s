global ft_isprint

section .text

ft_isprint:
	cmp rdi, 0x20 ;
	jl err
	cmp rdi, 0x7E ;
	jg err
	mov rax, 0x1
	jmp end

err:
	xor rax, rax

end:
	ret
