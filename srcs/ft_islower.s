global ft_islower

section .text

ft_islower:
	cmp rdi, 0x61 ; 'a'
	jl err
	cmp rdi, 0x7A ; 'z'
	jg err
	mov rax, 0x1
	jmp end

err:
	xor rax, rax

end:
	ret
