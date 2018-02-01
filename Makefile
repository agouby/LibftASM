NAME		= libfts.a
CC		= nasm
FLAGS		= -f
UNAME		= $(shell uname -s)
LINUX_FLAG	= elf64
MACOS_FLAG	= macho64

INC_FOLDER	= ./includes/
SRC_FOLDER	= ./srcs/
OBJ_FOLDER	= ./builds/

SRC_FILES	=	ft_isalpha.s \
				ft_islower.s \
				ft_isupper.s \
				ft_isprint.s \
				ft_isascii.s \
				ft_isdigit.s \
				ft_isalnum.s \
				ft_tolower.s \
				ft_toupper.s \

SRCS = $(addprefix $(SRC_FOLDER), $(SRC_FILES))
OBJS = $(addprefix $(OBJ_FOLDER), $(SRC_FILES:.s=.o))

ifeq ($(UNAME), Linux)
	FLAGS += $(LINUX_FLAG)
else
	FLAGS += $(MACOS_FLAG)
endif

all: $(NAME)

$(NAME): $(OBJ_FOLDER) $(OBJS)
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)

$(OBJ_FOLDER):
	@mkdir -p $(OBJ_FOLDER)

$(OBJ_FOLDER)%.o: $(SRC_FOLDER)%.s
	@printf "Compiling $< as $@\n"
	@$(CC) $(FLAGS) $< -o $@

clean:
	@rm -rf $(OBJ_FOLDER)

fclean: clean
	@rm -rf $(NAME)

re: fclean all
