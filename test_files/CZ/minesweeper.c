#include <stdio.h>
#include "../../utils/utils.h"

int	bomb_count(int map[9][9], int row, int col)
{
	int	count;

	count = 0;
	for (int x = -1; x <= 1; x++)
	{
		for (int y = -1; y <= 1; y++)
		{
			/*
			 * (row - 1, col - 1) (row - 1, col + 0) (row - 1, col + 1)
			 * (row + 0 , col - 1) (row + 0 , col + 0) (row + 0 , col + 1)
			 * (row + 1, col - 1) (row + 1, col + 0) (row + 1, col + 1)
			 */
			if (row + x < 0 || row + x >= 9 || col + y < 0 || col + y >= 9)
				continue;
			if (row == row + x && col == col + y)
				continue;
			if (map[row + x][col + y] == 9)
				count++;
		}
	}
	return (count);
}

void	minesweeper(int board[9][9])
{
	int	count;

	for (int row = 0; row < 9; row++)
	{
		for (int col = 0; col < 9; col++)
		{
			if (board[row][col] == 9)
				continue;
			count = bomb_count(board, row, col);
			board[row][col] = count;
		}
	}
}

// File for testing only
// Do not submit this file
// #include "YOUR_FILES_PATH/IOT-Tester/utils/utils.h"
// int main()
// {
// 	int board[9][9] =  {{0, 0, 0, 0, 0, 0, 0, 0, 0},
// 						{0, 0, 0, 0, 0, 0, 0, 0, 0},
// 						{0, 0, 0, 0, 0, 0, 0, 0, 0},
// 						{0, 0, 0, 0, 0, 0, 0, 0, 0},
// 						{0, 0, 0, 0, 0, 0, 0, 0, 0},
// 						{0, 0, 0, 0, 0, 0, 0, 0, 0},
// 						{0, 0, 0, 0, 0, 0, 0, 0, 0},
// 						{0, 0, 0, 0, 0, 0, 0, 0, 0},
// 						{0, 0, 0, 0, 0, 0, 0, 0, 0}};
// 	ft_get_minesweeper_board(board);
// 	minesweeper(board);
// 	ft_print_minesweeper_board(board);
// }
