global ft_isalnum
extern ft_isdigit
extern ft_isalpha

section .text

ft_isalnum:
	call ft_isdigit
	cmp rax, 0x1
	je end
	call ft_isalpha
	cmp rax, 0x1
	je end

err:
	xor rax, rax

end:
	ret
