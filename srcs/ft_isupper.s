global ft_isupper

section .text

ft_isupper:
	cmp rdi, 0x41 ; 'A'
	jl err
	cmp rdi, 0x5A ; 'Z'
	jg err
	mov rax, 0x1
	jmp end

err:
	xor rax, rax

end:
	ret
