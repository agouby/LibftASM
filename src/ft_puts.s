section .text
global	_ft_puts
extern	_ft_strlen

_ft_puts:
	push rbp
	mov rbp, rsp
	and rdi, rdi
	je	_null
	mov rsi, rdi
	call _ft_strlen
	mov rdi, 0x1
	mov rdx, rax
	mov rax, 0x2000004
	syscall
	jc	_fail
	mov rax, 0x2000004
	lea rsi, [rel endline]
	mov rdx, 0x1
	syscall
	jc	_fail
	jmp _exit

_null:
	mov rax, 0x2000004
	mov rdi, 0x1
	lea rsi, [rel null]
	mov rdx, 0x7
	syscall
	jc	_fail
	jmp	_exit

_fail:
	mov rax, -1

_exit:
	mov rsp, rbp
	pop rbp
	ret

section .rodata
endline	db 0xa
null	db "(null)", 0xa
