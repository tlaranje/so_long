# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlaranje <tlaranje@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/13 10:52:34 by tlaranje          #+#    #+#              #
#    Updated: 2025/11/13 11:30:49 by tlaranje         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# === Executable names ===
NAME			:= so_long
BONUS			:= so_long_bonus

# === Repositories ===
MLX_REPO		:= https://github.com/42Paris/minilibx-linux.git
LIBFT_REPO		:= https://github.com/tlaranje/libft.git

# === Directories ===
MDT_SRC_DIR		:= src/Mandatory
BONUS_SRC_DIR	:= src/Bonus
OBJ_DIR			:= obj
INC_DIR			:= inc
LIBFT_DIR		:= libft
MLX_DIR			:= mlx_linux

# === Commands ===
CC				:= gcc
MAKE_C			:= make -C
RM				:= rm -rf

# === Flags ===
CFLAGS			:= -Wall -Wextra -Werror -I$(INC_DIR) -I$(LIBFT_DIR) -I$(MLX_DIR)
MXLFLAGS		:= -L$(LIBFT_DIR) -L$(MLX_DIR) -lmlx -lXext -lX11 -lm

# === Source files ===
MDT_SRC			:= $(wildcard $(MDT_SRC_DIR)/*.c)
BONUS_SRC		:= $(wildcard $(BONUS_SRC_DIR)/*.c)

# === Object files ===
MDT_OBJ			:= $(patsubst %.c,$(OBJ_DIR)/%.o,$(notdir $(MDT_SRC)))
BONUS_OBJ		:= $(patsubst %.c,$(OBJ_DIR)/%.o,$(notdir $(BONUS_SRC)))

# === Build targets ===
all: $(OBJ_DIR) mlx libft $(NAME)

bonus: $(OBJ_DIR) mlx libft $(BONUS)

# Create obj directory if it doesn't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Compile mandatory .c files into .o files
$(OBJ_DIR)/%.o: $(MDT_SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compile bonus .c files into .o files
$(OBJ_DIR)/%.o: $(BONUS_SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Link mandatory object files into final executable
$(NAME): $(MDT_OBJ)
	$(CC) $(MDT_OBJ) $(MXLFLAGS) -o $@

# Link bonus object files into final executable
$(BONUS): $(BONUS_OBJ)
	$(CC) $(BONUS_OBJ) $(MXLFLAGS) -o $@

# Build libft
libft:
	if [ ! -d "$(LIBFT_DIR)" ]; then git clone $(LIBFT_REPO) $(LIBFT_DIR); fi
	$(MAKE_C) $(LIBFT_DIR)

# Build mlx (clone if missing)
mlx:
	if [ ! -d "$(MLX_DIR)" ]; then git clone $(MLX_REPO) $(MLX_DIR); fi
	$(MAKE_C) $(MLX_DIR)

# Remove object files
clean:
	$(RM) $(OBJ_DIR)
	$(MAKE_C) $(LIBFT_DIR) clean
	$(MAKE_C) $(MLX_DIR) clean

# Remove executables and object files
fclean: clean
	$(RM) $(NAME) $(BONUS) $(MLX_DIR) $(LIBFT_DIR)

# Rebuild everything
re: fclean all

.PHONY: all bonus clean fclean re libft mlx