global ft_memset

section .text

ft_memset:
	mov rcx, rdx
	mov rax, rsi
	cld
	rep stosb
end:
	ret
