#include <stdio.h>
#include "libfts.h"

int	main(int ac, char **av)
{
	(void)ac;
	(void)av;
	if (ac < 2)
	{
		printf("No args.\n");
		return (0);
	}
	printf("Res = %d\n", ft_isascii(0));
	return (0);
}
