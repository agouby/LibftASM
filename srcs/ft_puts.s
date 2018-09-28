global ft_puts
extern ft_strlen

section .text

ft_puts:
	cmp rdi, 0x0
	je empty
	call ft_strlen
	mov rdx, rax
	mov rsi, rdi
	mov rdi, 0x1
	mov rax, 0x1
	syscall

	mov rdx, 0x1
	lea rsi, [rel nl]
	mov rax, 0x1
	syscall
	jmp end

empty:
	mov rdx, 0x7
	mov rsi, null
	mov rdi, 0x1
	mov rax, 0x1
	syscall

end:
	ret

section .rodata
	null db "(null)", 0xA
	nl db 0xA
