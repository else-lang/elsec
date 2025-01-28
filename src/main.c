#include <stdio.h>
#include <stdlib.h>

void usage(char **argv)
{
    printf("Usage: else %s [parsing file]\n", argv[0]);
}

int main(int argc, char **argv)
{
    if (argc != 2) {
        usage(argv);
        return EXIT_FAILURE;
    }

    //printf("ENV: %s\n", version);
    printf("argc: %d\n", argc);
    printf("argv0: %s\n", argv[0]);
    printf("argv1: %s\n", argv[1]);


    return EXIT_SUCCESS;
}
