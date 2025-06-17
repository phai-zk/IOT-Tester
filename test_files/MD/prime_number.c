#include <stdio.h>

int main(void)
{
    int n;

    scanf("%d", &n);
    if (n == 2)
    {
        printf("It prime\n");
        return 0;
    }
    if (n < 2 || n % 2 == 0)
    {
        printf("Not prime\n");
        return 0;
    }
    for (int i = 3; i <= n / i; i += 2)
    {
        if (n % i == 0)
        {
            printf("Not prime\n");
            return 0;
        }
    }
    printf("It prime\n");
    return 0;
}
