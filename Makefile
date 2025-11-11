# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlaranje <tlaranje@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/11 15:14:39 by tlaranje          #+#    #+#              #
#    Updated: 2025/11/11 16:13:37 by tlaranje         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# NAME
NAME		= so_long.a

# COMMANDS
CC			= cc
CFLAGS		= -Wall -Wextra -Werror -I$(INC_DIR) -I$(LIBFT_DIR)
AR			= ar rcs
RM			= rm -rf
MD			= mkdir -p

# DIRECTORIES
SRC_DIR		= src/
INC_DIR		= inc/
OBJS_DIR	= obj/

# MANDATORY
MDT_DIR		= $(SRC_DIR)Mandatory/
MDT_SRC		= $(wildcard $(MDT_DIR)*.c)
MDT_OBJ		= $(patsubst $(MDT_DIR)%.c,$(OBJS_DIR)$(MD)so_long%.o,$(MDT_SRC))

# BONUS
BONUS_DIR	= $(SRC_DIR)Bonus/
BONUS_SRC	= $(wildcard $(BONUS_DIR)*.c)
BONUS_OBJ	= $(patsubst $(BONUS_DIR)%.c,$(OBJS_DIR)so_long%.o,$(MDT_SRC))

LIBFT_DIR	= libft/
LIBFT		= $(LIBFT_DIR)libft.a

# SOURCES
MDT_OBJS		= $(MDT_SRC:$(MDT_DIR)%.c=$(OBJS_DIR)%.o)
BONUS_OBJS		= $(BONUS_SRC:$(BONUS_DIR)%.c=$(OBJS_DIR)%.o)

# RULES
all: $(NAME)

$(NAME): $(MDT_OBJS)
	@make -C $(LIBFT_DIR) --no-print-directory
	@cp $(LIBFT) $(NAME)
	@$(AR) $@ $^

$(OBJS_DIR)%.o: $(MDT_DIR)%.c
	@$(MD) $(OBJS_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(BONUS_OBJS)
	@make -C $(LIBFT_DIR) --no-print-directory
	@cp $(LIBFT) $(NAME)
	@$(AR) $@ $^

$(OBJS_DIR)%.o: $(BONUS_DIR)%.c
	@$(MD) $(OBJS_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@$(RM) $(OBJS_DIR)
	@make -C $(LIBFT_DIR) clean

fclean: clean
	@$(RM) $(NAME)
	@make -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re
