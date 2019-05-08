NAME		= libfts.a
CC			= nasm
FLAGS		= -f
UNAME		= $(shell uname -s)
LINUX_FLAG	= elf64
MACOS_FLAG	= macho64

INC_FOLDER	= ./include/
SRC_FOLDER	= ./src/
OBJ_FOLDER	= ./build/

TEST=./test

SRC_FILES =	 ft_bzero.s \
			 ft_cat.s \
			 ft_isalnum.s \
			 ft_isalpha.s \
			 ft_isascii.s \
			 ft_isdigit.s \
			 ft_islower.s \
			 ft_isprint.s \
			 ft_isupper.s \
			 ft_memcpy.s \
			 ft_memset.s \
			 ft_puts.s \
			 ft_strcat.s \
			 ft_strchr.s \
			 ft_strcmp.s \
			 ft_strcpy.s \
			 ft_strdup.s \
			 ft_strequ.s \
			 ft_strlen.s \
			 ft_swapc.s \
			 ft_swapi.s \
			 ft_swaps.s \
			 ft_tolower.s \
			 ft_toupper.s

SRC = $(addprefix $(SRC_FOLDER), $(SRC_FILES))
OBJS = $(addprefix $(OBJ_FOLDER), $(SRC_FILES:.s=.o))
INC = $(addprefix $(INC_FOLDER), libfts.h)

ifeq ($(UNAME), Linux)
	FLAGS += $(LINUX_FLAG)
else
	FLAGS += $(MACOS_FLAG)
endif

all: $(NAME)

$(NAME): $(OBJS)
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)
	@printf "\e[33m$(NAME)\e[92m successfully created\n\e[39m"

$(OBJ_FOLDER):
	@printf "\e[33mObject folder\e[92m successfully created\n\e[39m"
	@mkdir -p $(OBJ_FOLDER)

$(SRC): $(OBJ_FOLDER)

$(OBJS): $(OBJ_FOLDER)%.o: $(SRC_FOLDER)%.s $(INC)
	@printf "\e[96mCompiling \e[4m$<\e[24m \e[4m$@\e[24m\n\e[39m"
	@$(CC) $(FLAGS) $< -o $@ 

clean:
	@rm -rf $(OBJ_FOLDER)
	@printf "\e[91mObject files deleted\n\e[39m"

fclean: clean
	@printf "\e[91m$(NAME) deleted\n\e[39m"
	@rm -rf $(NAME)

re:
	@make fclean
	@make all

test: $(NAME) test.c
	@printf "Compiling test file"
	@gcc test.c -o test -I$(INC_FOLDER) libfts.a


.PHONY: all re fclean clean
