#include <stdio.h>

int	main(void) {
	int	b;
	int	h;
	float	result;

	scanf("%d", &b);
	scanf("%d", &h);

	result = (h * b) / 2;
	printf("%f\n", result);
	return 0;
}
