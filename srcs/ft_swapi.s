global	_ft_swapi

section .text

_ft_swapi:
	mov ecx, [rdi]
	mov eax, [rsi]
	mov [rdi], eax
	mov [rsi], ecx

_exit:
	ret
