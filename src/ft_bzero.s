global	_ft_bzero
extern	_ft_puts

_ft_bzero:
	push rbp
	mov rbp, rsp
	and rsi, rsi
	je _exit

_while:
	mov byte[rdi], 0x0
	dec rsi
	inc rdi
	and rsi, rsi
	jne _while

_exit:
	mov rsp, rbp
	pop rbp
	ret
