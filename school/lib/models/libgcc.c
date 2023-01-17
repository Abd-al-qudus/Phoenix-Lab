#include<stdio.h>

int main(int argc, char const *argv[])
{
    if (argc <= 1)
        printf("ARGV ARRAY NOT BIG ENOUGH");
    for (int i = 0; i < argc; i++)
        printf("[*] %s\n", argv[i]);
    return 0;
}