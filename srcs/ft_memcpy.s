global ft_memcpy

section .text

ft_memcpy:
	mov rcx, rdx
	cld
	rep movsb

end:
	ret
