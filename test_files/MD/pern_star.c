#include <stdio.h>

int main()
{
	int n;
	int mid;

	scanf("%d", &n);
	if (n < 3)
	{
		printf("Least value is 3\n");
		return 0;
	}
	if (n % 2 == 0)
		mid = (n / 2) - 1;
	else
		mid = n / 2;
	for (int i = 0; i < mid; i++)
	{
		for (int j = n - 1; j > i; j--)
			printf(" ");
		for (int j = 0; j < i * 2 + 1; j++)
			printf("*");
		printf("\n");
	}

	int center = n - mid;
	for (int i = 0; i < center; i++)
	{
		int k = (n - 1) * 2;
		for (int j = 0; j < k + 1; j++)
		{
			if ((j < i || j > k - i) && i < (center / 2) + (center % 2))
				printf(" ");
			else if ((j < center - i - 1 || j > k - center + i + 1) && (i >= center / 2))
				printf(" ");
			else
				printf("*");
		}
		printf("\n");
	}

	for (int i = mid; i > 0; i--)
	{
		for (int j = i; j < n; j++)
			printf(" ");
		for (int j = (i - 1) * 2 + 1; j > 0; j--)
			printf("*");
		printf("\n");
	}

	return 0;
}