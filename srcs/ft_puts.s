global	ft_puts
extern	ft_strlen

ft_puts:
	push rbp
	mov rbp, rsp
	lea rsi, [rdi]
	call ft_strlen
	mov rdx, rax
	mov rax, 0x1
	mov rdi, 0x1
	syscall
	mov rsp, rbp
	pop rbp
	ret
