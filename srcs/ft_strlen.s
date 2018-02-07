global	_ft_strlen

_ft_strlen:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rdx, rdx
	xor rcx, rcx
	push rdi

_while:
	mov cl, byte[rdi]
	and cl, 0xFF
	je _ret
	mov ecx, dword[rdi]
	and ecx, 0xFF00
	je _ret1
	mov ecx, dword[rdi]
	and ecx, 0xFF0000
	je _ret2
	mov ecx, dword[rdi]
	and ecx, 0xFF000000
	je _ret3
	add rdx, 0x4
	add rdi, 0x4
	jmp	_while

_ret:
	mov rax, rdx
	jmp _exit

_ret1:
	mov rax, rdx
	inc rax
	jmp _exit
	 
_ret2:
	mov rax, rdx
	add rax, 0x2
	jmp _exit

_ret3:
	mov rax, rdx
	add rax, 0x3

_exit:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
