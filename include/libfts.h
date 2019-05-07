#ifndef LIBFTS_H
# define LIBFTS_H

void	ft_bzero(void *s, size_t n);
char	*ft_strcat(char *s1, char *s2);
int		ft_isalnum(int c);
int		ft_isprint(int c);
int		ft_islower(int c);
int		ft_isupper(int c);
int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isascii(int c);
int		ft_tolower(int c);
int		ft_toupper(int c);
int		ft_puts(const char *s);
size_t	ft_strlen(const char *s);
void	*ft_memset(void *b, int c, size_t len);
void	*ft_memcpy(void *dst, const void *src, size_t n);
char	*ft_strdup(const char *s1);
void	ft_cat(int fd);
char	*ft_strchr(const char *s, int c);
void	ft_swapi(int *a, int *b);
void	ft_swapc(char *a, char *b);
void	ft_swaps(char **a, char **b);
int		ft_strcmp(const char *s1, const char *s2);
int		ft_strequ(char const *s1, char const *s2);

#endif
