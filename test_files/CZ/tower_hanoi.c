#include <stdio.h>
#include <stdlib.h>

#define MAX_DISKS 64

typedef struct
{
    int data[MAX_DISKS];
    int size;
    char name[10];
} Rod;

void push(Rod *rod, int value)
{
    if (rod->size >= MAX_DISKS)
    {
        printf("Rod is full!\n");
        return;
    }
    for (int i = rod->size; i > 0; --i)
    {
        rod->data[i] = rod->data[i - 1];
    }
    rod->data[0] = value;
    rod->size++;
}

int pop(Rod *rod)
{
    if (rod->size == 0)
        return -1;
    int value = rod->data[0];
    for (int i = 0; i < rod->size - 1; ++i)
    {
        rod->data[i] = rod->data[i + 1];
    }
    rod->size--;
    return value;
}

void printRod(const char *label, Rod *rod)
{
    printf("%s [", label);
    for (int i = 0; i < rod->size; ++i)
    {
        printf("%d", rod->data[i]);
        if (i != rod->size - 1)
            printf(", ");
    }
    printf("]\n");
}

void printState(Rod *src, Rod *aux, Rod *dest)
{
    // printRod("SRC", src);
    // printRod("TEM", aux);
    // printRod("DES", dest);
    printRod(src->name, src);
    printRod(aux->name, aux);
    printRod(dest->name, dest);
    printf("Form %s to %s\n", src->name, dest->name);
    printf("------------------------------------------------------------\n");
}

void towerOfHanoi(int n, Rod *from, Rod *to, Rod *aux)
{
    if (n == 0)
        return;

    towerOfHanoi(n - 1, from, aux, to);

    int disk = pop(from);
    push(to, disk);
    printState(from, aux, to);

    towerOfHanoi(n - 1, aux, to, from);
}

int main()
{

    int N;
    scanf("%d", &N);

    Rod a = {{0}, 0, "SRC"};
    Rod b = {{0}, 0, "TMP"};
    Rod c = {{0}, 0, "DES"};

    for (int i = N; i > 0; i--)
    {
        push(&a, i);
    }

    printState(&a, &b, &c);
    towerOfHanoi(N, &a, &c, &b);

    return 0;
}
