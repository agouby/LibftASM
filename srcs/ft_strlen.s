global	ft_strlen

ft_strlen:
	push rbp
	mov rbp, rsp
	push rdi
	xor rcx, rcx
	not rcx
	xor al, al
	cld
	repne scasb
	not rcx
	lea rax, [rcx - 0x1]
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
