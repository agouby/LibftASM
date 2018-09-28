global	_ft_swaps

section .text

_ft_swaps:
	mov rcx, [rdi]
	mov rdx, [rsi]
	mov [rdi], rdx
	mov [rsi], rcx

_exit:
	ret
