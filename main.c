#include <stdio.h>
#include <unistd.h>
#include <ctype.h>
#include "libfts.h"
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>

#define EOC		"\e[0m"
#define RED		"\e[91m"
#define GREEN	"\e[32m"
#define YELLOW	"\e[93m"
#define CHAR	"\e[36m"
#define INT		"\e[35m"

#define A_S		97
#define A_E		105

size_t s_cnt = 0;

#define JL		printf("\n")

void	print_legend()
{
	printf("Char in %scyan%s\nInt  in %smagenta%s\n\n", CHAR, EOC, INT, EOC);
}

void	name(char *name)
{
	printf("Testing %s%s%s:\n\n", YELLOW, name, EOC);
}

void	success(int arg)
{
	if (isprint(arg))
		printf("\t| %s%4c%s | %sSUCCESS%s |\n", CHAR, (char)arg, EOC, GREEN, EOC);
	else
		printf("\t| %s%4d%s | %sSUCCESS%s |\n", INT, arg, EOC, GREEN, EOC);
}

void	fail(int arg)
{
	if (isprint(arg))
		printf("\t| %s%4c%s | %sFAIL%s    |\n", CHAR, (char)arg, EOC, RED, EOC);
	else
		printf("\t| %s%4d%s | %sFAIL%s    |\n", INT, arg, EOC, RED, EOC);
}

void	test_islower(void)
{
	int  i = A_S;
	name("ft_islower");
	while (i < A_E)
	{
		if (ft_islower(i) == islower(i))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_isupper(void)
{
	int  i = A_S;

	name("ft_isupper");
	while (i < A_E)
	{
		if (ft_isupper(i) == isupper(i))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_isalpha(void)
{
	int  i = A_S;

	name("ft_isalpha");
	while (i < A_E)
	{
		if (ft_isalpha(i) == isalpha(i))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_isprint(void)
{
	int  i = A_S;

	name("ft_isprint");
	while (i < A_E)
	{
		if (ft_isprint(i) == isprint(i))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_isascii(void)
{
	int  i = A_S;

	name("ft_isascii");
	while (i < A_E)
	{
		if (ft_isascii(i) == isascii(i))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_isdigit(void)
{
	int  i = A_S;

	name("ft_isdigit");
	while (i < A_E)
	{
		if (ft_isdigit(i) == isdigit(i))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_isalnum(void)
{
	int  i = A_S;

	name("ft_isalnum");
	while (i < A_E)
	{
		if (ft_isalnum(i) == isalnum(i))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_tolower(void)
{
	int  i = A_S;

	name("ft_tolower");
	while (i < A_E)
	{
		if (ft_tolower(i) == tolower(i))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_toupper(void)
{
	int  i = A_S;

	name("ft_toupper");
	while (i < A_E)
	{
		if (ft_toupper(i) == toupper(i))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_strlen(void)
{
	int  i = 0;
	const char *test_str[] = {
	"Hello",
	"Prout",
	"",
	"This is a very long string I guess but don't tell anyone please...\n"
	};

	int size = sizeof(test_str) / sizeof(*test_str);
	name("ft_strlen");
	while (i < size)
	{
		if (ft_strlen(test_str[i]) == strlen(test_str[i]))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}
	JL;
}

void	test_memset(void)
{
	int	i[] =
	{
		5,
		8,
		4096,
		100000,
		0,
		1
	};
	name("ft_memset");
	char *ptr = malloc(4096);
	printf("PTR ADDR = %p\n", ptr);
	memset(ptr, 42, 4096);
	ptr[2] = 0;
	printf("RET = %p\n", ft_memset(ptr, 43, 1));
	printf("STR = %s\n", ptr);
	free(ptr);
	/*
	while (i < size)
	{
		if (ft_strlen(test_str[i]) == strlen(test_str[i]))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}*/
	JL;
}

void	test_memcpy(void)
{
	int	i[] =
	{
		5,
		8,
		4096,
		100000,
		0,
		1
	};
	name("ft_memcpy");
	char *ptr = malloc(4096);
	printf("PTR ADDR = %p\n", ptr);
	memset(ptr, 0, 4096);
	printf("RET = %p\n", ft_memcpy(ptr, "Hello!", 6));
	printf("STR = %s\n", ptr);
	free(ptr);
	/*
	while (i < size)
	{
		if (ft_strlen(test_str[i]) == strlen(test_str[i]))
		{
			success(i);
			s_cnt++;
		}
		else
			fail(i);
		i++;
	}*/
	JL;
}

void	test_strcat(void)
{
	name("ft_strcat");
	char *ptr = malloc(4096);
	printf("PTR ADDR = %p\n", ptr);
	memset(ptr, 0, 4096);
	strcpy(ptr, "Hello ");
	printf("RET ADDR = %p\n", ft_strcat(ptr, "World!"));
	printf("{%s}\n", ptr);
	free(ptr);

}

void	print_bits(const size_t size, const void *arg)
{
	size_t	i;
	size_t	j;
	unsigned char *ptr = (unsigned char *)arg;

	i = size;
	while (i)
	{
		j = 0;
		while (j < 7)
		{
			printf("%d", (ptr[i - 1] >> j) & 1);
			j++;
		}
		if (i != 1)
			printf(" ");
		i--;
	}
	puts("");
}


//	printf("%d, %d\n", ft_isalnum(i), isalnum(i));

int		main(int ac, char **av)
{
	(void)ac;
	(void)av;
/*	print_legend();
	test_toupper();
	test_tolower();
	test_isalnum();
	test_isdigit();
	test_isascii();
	test_isprint();
	test_isalpha();
	test_isupper();
	test_islower();
	test_strlen();
	test_memset();
*/	test_memcpy();
//	test_strcat();
//printf("%ld/%d\n", s_cnt, 9 * (A_E - A_S));
	return (0);

}
