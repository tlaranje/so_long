# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlaranje <tlaranje@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/11 15:14:39 by tlaranje          #+#    #+#              #
#    Updated: 2025/11/12 11:04:36 by tlaranje         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# NAME
NAME		= so_long.a
BONUS_NAME	= so_long_bonus.a
EXEC_NAME	= so_long

# COMMANDS
CC			= cc
CFLAGS		= -Wall -Wextra -Werror -I$(INC_DIR) -I$(LIBFT_DIR) -I$(MLX_DIR)
AR			= ar rcs
RM			= rm -rf
MD			= mkdir -p
CP			= cp
MAKE_C		= make -C

# DIRECTORIES
SRC_DIR		= src/
INC_DIR		= inc/
OBJS_DIR	= obj/

# MANDATORY - DIRECTORIES and SOURCES
MDT_DIR		= $(SRC_DIR)Mandatory/
MDT_SRC		= $(wildcard $(MDT_DIR)*.c)
MDT_OBJS	= $(MDT_SRC:$(MDT_DIR)%.c=$(OBJS_DIR)%.o)

# BONUS - DIRECTORIES AND SOURCES
BONUS_DIR	= $(SRC_DIR)Bonus/
BONUS_SRC	= $(wildcard $(BONUS_DIR)*.c)
BONUS_OBJS	= $(BONUS_SRC:$(BONUS_DIR)%.c=$(OBJS_DIR)%.o)

# LIBFT
LIBFT_DIR	= libft/
LIBFT		= $(LIBFT_DIR)libft.a

# MLX
MLX_DIR		= mlx_linux
MLX_REPO	= https://github.com/42Paris/minilibx-linux.git
MLX_LIB		= -L$(MLX_DIR) -lmlx -lXext -lX11 -lm

# RULES
all: $(MLX_DIR) $(NAME) $(EXEC_NAME)

bonus: all $(BONUS_NAME)

# MANDATORY RULES
$(NAME): $(MDT_OBJS)
	@$(MAKE_C) $(LIBFT_DIR)
	@$(MAKE_C) $(MLX_DIR)
	@$(CP) $(LIBFT) $(NAME)
	@$(AR) $@ $^

$(OBJS_DIR)%.o: $(MDT_DIR)%.c
	@$(MD) $(OBJS_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

# BONUS RULES
$(BONUS_NAME): $(BONUS_OBJS)
	@$(RM) $(NAME)
	@$(MD) $(OBJS_DIR)
	@$(AR) $@ $^

$(OBJS_DIR)%.o: $(BONUS_DIR)%.c
	@$(MD) $(OBJS_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

# EXEC RULES
$(EXEC_NAME): $(NAME)
	@$(CC) $(CFLAGS) $(NAME) $(MLX_LIB) -o $(EXEC_NAME)

# MINILIBX RULES
$(MLX_DIR):
	@git clone $(MLX_REPO) $(MLX_DIR)

# OTHERS RULES
clean:
	@$(RM) $(OBJS_DIR)
	@$(MAKE_C) $(LIBFT_DIR) clean
	@$(MAKE_C) $(MLX_DIR) clean

fclean: clean
	@$(RM) $(NAME) $(BONUS_NAME) $(EXEC_NAME) $(MLX_DIR)
	@$(MAKE_C) $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re
