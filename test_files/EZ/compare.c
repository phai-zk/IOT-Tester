#include <stdio.h>

int	main(void) {
	int	a;
	int	b;

	scanf("%d", &a);
	scanf("%d", &b);
	if (a > b)
	{
		printf("%d more than %d\n", a, b);
	}
	else if (a < b)
	{
		printf("%d less than %d\n", a, b);
	}
	else
	{
		printf("Both are equal\n");
	}
}
