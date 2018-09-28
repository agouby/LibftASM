global ft_isalpha
extern ft_islower
extern ft_isupper

section .text

ft_isalpha:
	call ft_islower
	cmp rax, 0x1
	je end
	call ft_isupper
	cmp rax, 0x1
	je end
	
err:
	xor rax, rax

end:
	ret
