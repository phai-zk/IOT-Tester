#include "./utils.h"

void ft_get_minesweeper_board(int board[9][9])
{
	int x;
	int y;

	srand(time(NULL));
	for (int i = 0; i < 20; i++)
	{
		x = rand() % 9;
		y = rand() % 9;
		board[x][y] = 9;
	}
}

void ft_print_minesweeper_board(int board[9][9])
{
	for (int i = 0; i < 9; i++)
	{
		for (int j = 0; j < 9; j++)
		{
			printf(" %d ", board[i][j]);
		}
		printf("\n");
	}
}
