##
## EPITECH PROJECT, 2021
## B-ASM-400-BDX-4-1-asmminilibc-mathis.fayet
## File description:
## Makefile
##

CC			=	gcc -o

ASM			= 	nasm -f elf64

CFLAGS		= 	ld -fPIC -shared

RM_F		= 	rm -f

TESTFLAGS	=	--coverage -lcriterion -ldl

SRC			=		src/strlen.asm		\
					src/strchr.asm		\
					src/memset.asm		\
					src/memcpy.asm		\
					src/memmove.asm		\
					src/rindex.asm		\
					src/strstr.asm		\
					src/strpbrk.asm		\
					src/strcmp.asm		\
					src/strncmp.asm		\
					src/strcspn.asm

SRC_TEST    =	tests/test_strlen.c

OBJ			=	$(SRC:.asm=.o)

OBJ_TEST	=	$(SRC_TEST:.c=.o)

NAME		= libasm.so

TESTNAME	=	unit_tests

%.o: %.asm
	@$(ASM) $< -o $@ && echo "Compilation : [\033[32mOK\033[0m]" || echo -e " [\033[31mKO\033[0m]"

%.o : %.c
	@echo -n "Compiling: $<"
	@gcc -c $< -o $@ && echo -e " [\033[32mOK\033[0m]" || echo -e " [\033[32mKO\033[0m]"

all: $(NAME)

$(NAME): $(OBJ)
	@$(CFLAGS) -o $(NAME) $(OBJ)

tests_run: all $(OBJ_TEST)
	@$(CC) $(TESTNAME) $(OBJ_TEST) $(TESTFLAGS)
	@./$(TESTNAME)

clean:
	@$(RM_F) $(OBJ)
	@$(RM_F) $(OBJ_TEST)

fclean: clean
	@$(RM_F) $(NAME)
	@$(RM_F) $(TESTNAME)

re:	fclean all

.PHONY: all clean fclean re tests_run