global	_ft_strequ

section .text

_ft_strequ:
	xor rcx, rcx
	xor rax, rax
	xor rdx, rdx
	xor rbx, rbx

_while:
	mov dl, [rdi + rcx]
	mov bl, [rsi + rcx]
	and dl, dl
	je	_test
	and bl, bl
	je	_test
	cmp dl, bl
	jne	_test
	inc rcx
	jmp	_while

_test:
	and	dl, bl
	jne _exit

_set:
	inc al

_exit:
	ret
