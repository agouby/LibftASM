global ft_strlen

section .text

ft_strlen:
	push rdi
	xor rax, rax
	xor rcx, rcx
	not rcx
	cld
	repne scasb
	not rcx
	dec rcx
	mov rax, rcx
	pop rdi
end:
	ret
