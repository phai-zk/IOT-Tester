# ifndef UTILS_H
# define UTILS_H
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <time.h>

# define ROOT "√"

char	*ft_sqrt(int a);
char	*ft_ltoa(long n);
void	ft_get_minesweeper_board(int board[9][9]);
void	ft_print_minesweeper_board(int board[9][9]);

# endif