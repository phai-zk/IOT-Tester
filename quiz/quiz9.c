/*                                  ✧     ✦       ✧          ✦        */
/*  _._     _,-'""`-._                       ✧         ✦    ✦     ✧   */
/* (,-.`._,'(       |\`-/|              ✦       ✦          ✧    ✦     */
/*     `-.-' \ )-`( , o o)                 ✧   ✦      ✧          ✦    */
/*           `-    \`_`"'-           ✦     *       ✧      *            */
/*                                          ✧      *       ✦           */
/*          P'Pern gift to IoT04      ✧   ✦      ✧          ✦         */
/*         Have fun with it!             ✧         ✦    ✦       ✧     */
/*     contract ig: jidapa_pern       ✦     ✦       ✧          ✦      */

#include <stdio.h>
#include <stdlib.h>

#define MAX_DISKS 64

typedef struct
{
    int data[MAX_DISKS];
    int size;
    char name[10];
} Rod;

int main()
{
    int N;
    scanf("%d", &N);

    Rod a = {{0}, 0, "SRC"};
    Rod b = {{0}, 0, "TMP"};
    Rod c = {{0}, 0, "DES"};

    /* YOUR CODE HERE */
    return 0;
}