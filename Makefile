# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlaranje <tlaranje@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/12 16:40:03 by tlaranje          #+#    #+#              #
#    Updated: 2025/11/12 16:40:04 by tlaranje         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Diretórios
SRC_DIR_MANDATORY := src/Mandatory
SRC_DIR_BONUS := src/Bonus
OBJ_DIR := obj
INC_DIR := inc

# Compilador e flags
CC := gcc
CFLAGS := -Wall -Wextra -Werror -I$(INC_DIR)

# Fontes
MANDATORY_SRC := $(wildcard $(SRC_DIR_MANDATORY)/*.c)
BONUS_SRC := $(wildcard $(SRC_DIR_BONUS)/*.c)

# Objetos
MANDATORY_OBJ := $(patsubst $(SRC_DIR_MANDATORY)/%.c,$(OBJ_DIR)/%.o,$(MANDATORY_SRC))
BONUS_OBJ := $(patsubst $(SRC_DIR_BONUS)/%.c,$(OBJ_DIR)/bonus_%.o,$(BONUS_SRC))

# Executáveis
NAME := so_long
BONUS_NAME := so_long_bonus

# Targets
.PHONY: all bonus clean fclean re

all: $(OBJ_DIR) $(NAME)

bonus: $(OBJ_DIR) $(BONUS_NAME)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Regras para objetos
$(OBJ_DIR)/%.o: $(SRC_DIR_MANDATORY)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/bonus_%.o: $(SRC_DIR_BONUS)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Linkagem final
$(NAME): $(MANDATORY_OBJ)
	$(CC) $(MANDATORY_OBJ) -o $@

$(BONUS_NAME): $(BONUS_OBJ)
	$(CC) $(BONUS_OBJ) -o $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME) $(BONUS_NAME)

re: fclean all
