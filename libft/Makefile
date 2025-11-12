# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlaranje <tlaranje@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/27 11:56:18 by tlaranje          #+#    #+#              #
#    Updated: 2025/11/12 13:55:57 by tlaranje         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

PART1 = ft_tolower.c ft_toupper.c ft_isprint.c ft_isascii.c ft_isalnum.c \
		ft_isdigit.c ft_isalpha.c ft_atoi.c ft_strlen.c ft_strlcat.c \
		ft_strncmp.c ft_strdup.c ft_calloc.c ft_memcpy.c ft_strchr.c \
		ft_strrchr.c ft_strnstr.c ft_bzero.c ft_memchr.c ft_memcmp.c \
		ft_memset.c ft_memmove.c ft_strlcpy.c

PART2 = ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c \
		ft_striteri.c ft_strmapi.c ft_putchar_fd.c ft_putstr_fd.c \
		ft_putendl_fd.c	ft_putnbr_fd.c

BONUS = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstadd_back_bonus.c \
		ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstiter_bonus.c \
		ft_lstsize_bonus.c ft_lstlast_bonus.c ft_lstmap_bonus.c \
		ft_utoa.c

FT_PRINTF = ft_printf.c ft_put_char_str.c ft_put_nbr_unbr.c ft_put_ptr_hex.c

SRC = $(PART1) $(PART2) $(BONUS) $(FT_PRINTF)
OBJS = $(SRC:.c=.o)

CC = cc
RM = rm -f
CFLAGS = -Wall -Wextra -Werror
INCLUDE = -I .

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

all: $(NAME)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus
