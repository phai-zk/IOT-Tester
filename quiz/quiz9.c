/*                                        ✦        ✧      ✦       ✧   */
/*  _._     _,-'""`-._                       ✧         ✦    ✦     ✧   */
/* (,-.`._,'(       |\`-/|              ✧       ✦          ✧    ✦     */
/*     `-.-' \ )-`( , o o)                 ✧   ✦      ✧          ✦    */
/*           `-    \`_`"'-           ✦     *       ✧      *            */
/*                                          ✧      *       ✦           */
/*          P'Pern gift to IoT04      ✧   ✦      ✧          ✦         */
/*         Have fun with it!             ✧         ✦    ✦       ✧     */
/*     contract ig: jidapa_pern      ✧      ✦       ✧          ✦      */
/************************************************************************/
/* ✦ Quiz 9: The Tower of Arcana ✧                                     */
/************************************************************************/
/* ✦ Description ✧                                                     */
/* Write a program that solve the Tower of Hanoi problem.               */
/************************************************************************/
/* ✦ Learnings ✧                                                       */
/* - Practice Logic (Stack)                                             */
/* - #define Syntax (MAX_DISKS)                                         */
/* - Structure Syntax (Rod)                                             */
/* - Type of Data Structure (Stack)                                     */
/* - How to use recursion (Stack)                                       */
/************************************************************************/

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

    // Your code here

    return 0;
}
