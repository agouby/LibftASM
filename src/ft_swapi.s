global	_ft_swapi

_ft_swapi:
	push rbp
	mov rbp, rsp
	mov ecx, [rdi]
	mov eax, [rsi]
	mov [rdi], eax
	mov [rsi], ecx

_exit:
	mov rsp, rbp
	pop rbp
	ret
