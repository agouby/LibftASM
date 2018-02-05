global	_ft_swapc

_ft_swapc:
	push rbp
	mov rbp, rsp
	mov cl, [rdi]
	mov dl, [rsi]
	mov [rdi], dl
	mov [rsi], cl

_exit:
	mov rsp, rbp
	pop rbp
