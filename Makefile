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

SRC_FILES	=	ft_isalpha.s \
				ft_islower.s \
				ft_isupper.s \
				ft_isprint.s \
				ft_isascii.s \
				ft_isdigit.s \
				ft_isalnum.s \
				ft_tolower.s \
				ft_toupper.s \
				ft_strlen.s \
				ft_puts.s \
				ft_bzero.s \
				ft_memset.s \
				ft_memcpy.s \
				ft_strcat.s \
				ft_strdup.s \
				ft_cat.s \
				ft_strchr.s \
				ft_swapi.s \
				ft_swapc.s \
				ft_swaps.s \
				ft_strcmp.s \
				ft_strequ.s

SRC = $(addprefix $(SRC_FOLDER), $(SRC_FILES))
OBJS = $(addprefix $(OBJ_FOLDER), $(SRC_FILES:.s=.o))
INC = $(addprefix $(INC_FOLDER), libfts.h)

ifeq ($(UNAME), Linux)
	FLAGS += $(LINUX_FLAG)
else
	FLAGS += $(MACOS_FLAG)
endif

all: $(NAME)

$(NAME): $(OBJS) test.c
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)
	@printf "\e[33m$(NAME)\e[92m successfully created\n"
	gcc test.c -o test -I$(INC_FOLDER) libfts.a

test: test.c
	gcc test.c -o test -I$(INC_FOLDER) libfts.a

$(OBJ_FOLDER):
	@printf "\e[33mObject folder\e[92m successfully created\n"
	mkdir -p $(OBJ_FOLDER)

$(SRC): $(OBJ_FOLDER)

$(OBJS): $(OBJ_FOLDER)%.o: $(SRC_FOLDER)%.s
	@echo Compiling $< $@
	@$(CC) $(FLAGS) $< -o $@ 

clean:
	rm -rf $(OBJ_FOLDER)
	@printf "\e[91mObject files deleted\n"

fclean: clean
	@printf "\e[91m$(NAME) deleted\n"
	rm -rf $(NAME)

re:
	make fclean
	make all

.PHONY: all re fclean clean
