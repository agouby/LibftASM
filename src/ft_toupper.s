section .text
global	_ft_toupper

_ft_toupper:
	push rbp
	mov rbp, rsp
	mov eax, edi
	cmp rdi, 0x61
	jl _fail
	cmp rdi, 0x7A
	jg _fail
	jmp _success
	
_fail:
	jmp _exit

_success:
	sub eax, 0x20
	jmp _exit

_exit:
	mov rsp, rbp
	pop rbp
	ret
