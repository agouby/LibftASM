global	_ft_swapc

section .text

_ft_swapc:
	mov cl, [rdi]
	mov dl, [rsi]
	mov [rdi], dl
	mov [rsi], cl

_exit:
	ret
