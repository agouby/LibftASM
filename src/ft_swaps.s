global	_ft_swaps

_ft_swaps:
	push rbp
	mov rbp, rsp
	
	mov rcx, [rdi]
	mov rdx, [rsi]
	mov [rdi], rdx
	mov [rsi], rcx

_exit:
	mov rsp, rbp
	pop rbp
	ret
