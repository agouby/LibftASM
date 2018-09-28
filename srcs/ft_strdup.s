global	_ft_strdup
extern	_malloc
extern	_ft_strlen
extern	_ft_memcpy

_ft_strdup:
	push rdi
	call _ft_strlen
	inc rax
	push rax
	mov rdi, rax
	call _malloc
	and rax, rax
	je _fail
	mov rdi, rax
	pop rdx
	dec rdx
	pop rsi
	call _ft_memcpy
	mov byte[rax + rdx], 0x0
	jmp _exit
	
_fail:
	mov rax, 0x0

_exit:
	ret
