section .text
global	_ft_isupper

_ft_isupper:
	push rbp
	mov rbp, rsp
	cmp rdi, 0x41
	jl _fail
	cmp rdi, 0x5A
	jg _fail
	jmp _success
	
_fail:
	xor eax, eax
	jmp _exit

_success:
	mov eax, 0x1
	jmp _exit

_exit:
	mov rsp, rbp
	pop rbp
	ret
