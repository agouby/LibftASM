#include <stdio.h>
#include <unistd.h>
#include <ctype.h>
#include <libfts.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>

#define EOC		"\e[0m"
#define RED		"\e[91m"
#define GREEN	"\e[32m"
#define YELLOW	"\e[93m"
#define CHAR	"\e[36m"
#define INT		"\e[35m"

#define A_S		0
#define A_E		10

size_t s_cnt = 0;

#define JL		printf("\n")

#define COUNT_OF(array) (sizeof(array) / sizeof(*array))

#define PRINT(X,...) printf(X,__VA_ARGS__);fflush(stdout);

#define PRINT_RES(X) \
	if (!X) \
		printf("%sSuccess !\n%s", GREEN, EOC); \
	else \
		printf("%sFailure !\n%s", RED,EOC);

# define GIMMESTR(X) \
	if (gimme_str(X) == -1) { \
		printf("\n"); \
		return ;}

void	name(char *name)
{
	printf("\nTesting %s%s%s:\n\n", YELLOW, name, EOC);
}

void	test_islower(void)
{
	int  i = A_S;
	name("ft_islower");
	while (i < A_E)
	{
		PRINT_RES(!(ft_islower(i) == islower(i)))
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
		PRINT_RES(!(ft_isupper(i) == isupper(i)))
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
		PRINT_RES(!(ft_isalpha(i) == isalpha(i)))
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
		PRINT_RES(!(ft_isprint(i) == isprint(i)))
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
		PRINT_RES(!(ft_isascii(i) == isascii(i)))
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
		PRINT_RES(!(ft_isdigit(i) == isdigit(i)))
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
		PRINT_RES(!(ft_isalnum(i) == isalnum(i)))
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
		PRINT_RES(!(ft_tolower(i) == tolower(i)))
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
		PRINT_RES(!(ft_toupper(i) == toupper(i)))
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
		PRINT_RES(!(ft_strlen(test_str[i]) == strlen(test_str[i])));
		i++;
	}
	JL;
}

void	test_memset(void)
{
	char buf1[4096];
	char buf2[4096];
	
	name("ft_memset");

	memset(buf1, 0xFF, 4096);
	memset(buf2, 0xFF, 4096);
	
	memset(buf1, 0, 12);
	ft_memset(buf2, 0, 12);
	PRINT_RES(memcmp(buf1, buf2, 12));

	memset(buf1, 42, 4096);
	ft_memset(buf2, 42, 4096);
	PRINT_RES(memcmp(buf1, buf2, 4096));

	memset(buf1, 0xAC, 1);
	ft_memset(buf2, 0xAC, 1);
	PRINT_RES(memcmp(buf1, buf2, 4096));

	JL;
}

void	test_bzero(void)
{
	char buf1[4096];
	char buf2[4096];
	
	name("ft_bzero");

	memset(buf1, 0xFF, 4096);
	memset(buf2, 0xFF, 4096);
	
	bzero(buf1, 12);
	ft_bzero(buf2, 12);
	PRINT_RES(memcmp(buf1, buf2, 12));
	
	JL;
}

void	test_memcpy(void)
{
	char buf1[4096];
	char buf2[4096];
	
	name("ft_memcpy");

	
	memcpy(buf1, "Hello world\0", 12);
	ft_memcpy(buf2, "Hello world\0", 12);
	PRINT_RES(memcmp(buf1, buf2, 12));

	memcpy(buf1, "\0\0\0Hell\0\0\n\nwef\n\n\0", 18);
	ft_memcpy(buf2, "\0\0\0Hell\0\0\n\nwef\n\n\0", 18);
	PRINT_RES(memcmp(buf1, buf2, 18));

	int i = -424140;
	memcpy(buf1, &i, sizeof(int));
	ft_memcpy(buf2, &i, sizeof(int));
	PRINT_RES(memcmp(buf1, buf2, sizeof(int)));
	JL;
}

int		gimme_str(char *buf)
{
	int ret;

	printf("Enter a string : ");
	fflush(stdout);
	ret = read(0, buf, 4096);
	if (ret == -1 || !ret)
		return -11;
	buf[ret - 1] = '\0';
	return 0;
}

void	test_strcat(void)
{
	char buf1[4096];
	char buf2[4096];
	char buf3[4096];
	char *ptr1;
	char *ptr2;

	while (1) {
		name("ft_strcat");
		memset(buf1, 0, 4096);
		memset(buf2, 0, 4096);
		memset(buf3, 0, 4096);
		/*
		   if (gimme_str(buf1) == 1)
		   GETOUT
		   if (gimme_str(buf2) == 1)
		   GETOUT
		   */
		GIMMESTR(buf1)
		GIMMESTR(buf2)
		strcpy(buf3, buf1);

		ptr1 = ft_strcat(buf1, buf2);
		ptr2 = strcat(buf3, buf2);

		PRINT("agouby result : {%s}\n", ptr1);
		PRINT("System result : {%s}\n", ptr2);
	}
}

void	test_puts(void)
{
	char buf[4096];

	name("ft_puts");
	
	while (1)
	{
		name("ft_puts");

		GIMMESTR(buf);
		ft_puts(buf);
	}
}

void	test_swaps(void)
{
	char	*a = "Hello..";
	char	*b = "UWHIUWH";

	name("ft_swaps");
	
	printf("A: %s, B: %s\n", a, b);
	ft_swaps(&a, &b);
	printf("A: %s, B: %s\n", a, b);
}

void	test_swapc(void)
{
	char a = 0x45;
	char b = 0x58;

	name("ft_swapc");
	
	printf("A: %c, B: %c\n", a, b);
	ft_swapc(&a, &b);
	printf("A: %c, B: %c\n", a, b);
}

void	test_swapi(void)
{
	int a = -7879;
	int b = 2549;

	name("ft_swapi");
	
	printf("A: %d, B: %d\n", a, b);
	ft_swapi(&a, &b);
	printf("A: %d, B: %d\n", a, b);
}

void	test_cat(void){}

void	test_strchr(void)
{
	char *ptr = "Hello world ! Let's find some characters\n";
	char *ptr1;
	char *ptr2;

	name("ft_strchr");

	ptr1 = ft_strchr(ptr, 'H');
	ptr2 = strchr(ptr, 'H');
	PRINT_RES(!(ptr1 == ptr2));

	ptr1 = ft_strchr(ptr, '!');
	ptr2 = strchr(ptr, '!');
	PRINT_RES(!(ptr1 == ptr2));

	ptr1 = ft_strchr(ptr, '\0');
	ptr2 = strchr(ptr, '\0');
	PRINT_RES(!(ptr1 == ptr2));

	ptr1 = ft_strchr(ptr, 'l');
	ptr2 = strchr(ptr, 'l');
	PRINT_RES(!(ptr1 == ptr2));

	ptr1 = ft_strchr(ptr, '6');
	ptr2 = strchr(ptr, '6');
	PRINT_RES(!(ptr1 == ptr2));
}

void	test_strcmp(void)
{
	char buf1[4096];
	char buf2[4096];

	while (1)
	{
		name("ft_strcmp");
		GIMMESTR(buf1);
		GIMMESTR(buf2);
		PRINT_RES(!(ft_strcmp(buf1, buf2) == strcmp(buf1, buf2)));
	}
}

void	test_strequ(void)
{
	char buf1[4096];
	char buf2[4096];

	while (1)
	{
		name("ft_strequ");
		GIMMESTR(buf1);
		GIMMESTR(buf2);
		printf("Result: %d\n", ft_strequ(buf1, buf2));
	}
}

void	test_strdup(void)
{
	char buf[4096];
	char *ptr;

	while (1)
	{
		name("ft_strdup");
		GIMMESTR(buf);
		ptr = ft_strdup(buf);
		printf("Allocated ptr %p\n", ptr);
		if (!ptr)
			return ;
		printf("String: {%s}\n", ptr);
		free(ptr);
	}	
}

void	test_strcpy(void)
{
	char buf1[4096];
	char buf2[4096];
	char buf3[4096];
	char *ptr;

	while (1)
	{
		name("ft_strcpy");
		GIMMESTR(buf1);
		strcpy(buf3, buf1);
		ft_strcpy(buf2, buf1);
		PRINT("agouby result : {%s}\n", buf2);
		PRINT("System result : {%s}\n", buf3);
	}
}

size_t	hash(const char *str)
{
	unsigned long hash = 0;
	int c;

	hash = 5381;
	while ((c = *str++))
		hash = 1435543 * hash + (1093119221 + 7837703 * *str);
	return (hash);
}

struct tab {
	const char *name;
	void (*func)(void);
};

struct tab ft_tab[2048];

void	fill_hash(void)
{
	const struct tab tmp_tab[] = {
		{"ft_bzero",test_bzero},
		{"ft_cat",test_cat},
		{"ft_isalnum",test_isalnum},
		{"ft_isalpha",test_isalpha},
		{"ft_isascii",test_isascii},
		{"ft_isdigit",test_isdigit},
		{"ft_islower",test_islower},
		{"ft_isprint",test_isprint},
		{"ft_isupper",test_isupper},
		{"ft_memcpy",test_memcpy},
		{"ft_memset",test_memset},
		{"ft_puts",test_puts},
		{"ft_strcat",test_strcat},
		{"ft_strchr",test_strchr},
		{"ft_strcmp",test_strcmp},
		{"ft_strdup",test_strdup},
		{"ft_strequ",test_strequ},
		{"ft_strlen",test_strlen},
		{"ft_swapc",test_swapc},
		{"ft_swapi",test_swapi},
		{"ft_swaps",test_swaps},
		{"ft_tolower",test_tolower},
		{"ft_toupper",test_toupper},
		{"ft_strcpy", test_strcpy}
	};

	unsigned int h;

	for (int i = 0; i < COUNT_OF(tmp_tab); i++) {
		h = hash(tmp_tab[i].name) % COUNT_OF(ft_tab);
		if (ft_tab[h].name) {
			printf("COLLISION IN HASH !!!\n");
			exit(0);
		}
		ft_tab[h] = tmp_tab[i];
	}
}



int		main(void)
{
	char buf[4096];
	int ret;
	unsigned int n;

	fill_hash();
	while (1)
	{
		printf("Enter a function : ");
		fflush(stdout);
		ret = read(0, buf, 4096);
		if (!ret || ret == -1)
			break ;
		buf[ret - 1] = '\0';
		if (*buf) {
			n = hash(buf) % COUNT_OF(ft_tab);
			if (ft_tab[n].name)
				ft_tab[n].func();
			else
				printf("Unknown function named {%s}.. Try again !\n", buf);
		}
	}
	return (0);

}
