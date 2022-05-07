YELLOW = \033[0;33m
PURPLE = \033[0;35m
GREEN = \033[0;32m
RESET = \033[0m

NAME = push_swap
SRCS_DIR = src/
SRCS_LIST = \
	actions.c \
	parse_input.c \
	push_swap.c \
	sort_big.c \
	sort_small.c \
	sort_utils.c \
	print_list.c
SRCS = $(addprefix $(SRCS_DIR), $(SRCS_LIST))
OBJS = $(SRCS:.c=.o)
FLAGS = -Wall -Werror -Wextra
INC = -I ./inc -I ./libft
LIB = -L ./libft -l ft

all: $(NAME)
	@make graphic

$(NAME): libft/libft.a $(OBJS) 
	@echo "$(PURPLE) compiling push_swap $(RESET)"
	$(CC) $(FLAGS) $(INC) $(LIB) $(SRCS) -o $(NAME)
	@echo "$(RESET)"

%.o: %.c
	$(CC) -c $(INC) $< -o $@

libft/libft.a:
	@echo "$(YELLOW) compiling libft $(RESET)"
	$(MAKE) -C ./libft bonus
	@echo ""

clean:
	rm -f $(OBJS)
	$(MAKE) -C ./libft clean

fclean: clean
	rm -f $(NAME)
	rm -f libft/libft.a

re: clean fclean all

graphic:
	@echo "$(GREEN)  ________  ___  ___  ________  ___  ___           ________  ___       __   ________  ________    "
	@echo "$(GREEN) |\   __  \|\  \|\  \|\   ____\|\  \|\  \         |\   ____\|\  \     |\  \|\   __  \|\   __  \   "
	@echo "$(GREEN) \ \  \|\  \ \  \\\  \ \  \___|\ \ \   \\\   \        \ \  \___|\ \  \    \ \  \ \  \|\  \ \  \|\  \  "
	@echo "$(GREEN)  \ \   ____\ \  \\\  \ \_____  \ \ \  __   \        \ \_____  \ \  \  __\ \  \ \   __  \ \   ____\ "
	@echo "$(GREEN)   \ \  \___|\ \  \\\  \|____|\  \ \ \ \ \   \        \|____|\  \ \  \|\__\_\  \ \  \ \  \ \  \___| "
	@echo "$(GREEN)    \ \__\    \ \_______\____\_\  \ \_\ \__ \           ____\_\  \ \____________\ \__\ \__\ \__\    "
	@echo "$(GREEN)     \|__|     \|_______|\_________\|__|\|__|          |\_________\|____________|\|__|\|__|\|__|    "
	@echo "$(GREEN)                        \|_________|                   \|_________|    $(RESET)\n"