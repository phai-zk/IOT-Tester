#include "./utils.h"

char *ft_sqrt(int nb)
{
	long 	result;
	size_t 	len;
	char 	*str;
	char 	*str_res;

	if (nb <= 0)
		return (0);
	result = 0;
	while (nb != result * result)
	{
		if (nb < result * result)
		{
			str_res = ft_ltoa(nb);
			len = strlen(str_res) + 1;
			str = malloc(len + 1);
			if (!str)
				return ("\0");
			strcpy(str, ROOT);
			return (strcat(str, str_res));
		}
		result++;
	}
	return (ft_ltoa(result));
}

char *ft_ltoa(long n)
{
	int count;
	char *str;

	if (n == 0)
		return ("0");
	count = 0;
	for (int i = n; i > 0; i /= 10)
		count++;
	str = malloc(count + 1);
	if (!str)
		return ('\0');
	for (int i = 0; i < count; i++)
	{
		str[count - i - 1] = (n % 10) + '0';
		n /= 10;
	}
	str[count] = '\0';
	return (str);
}

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