#include <stdio.h>
#include <stdlib.h>

#define ARRAY_SIZE 2048
#define STACK_SIZE 1024
typedef short bool;

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        perror("i need a file\n");
        return 1;
    }

    FILE *bffile = fopen(argv[1], "r");
    if (bffile == NULL)
    {
        perror("Error opening file\n");
        return 1;
    }

    int array[ARRAY_SIZE] = {0};
    size_t index = 0;
    int stack[STACK_SIZE] = {0};
    size_t index_stack = 0;

    int ch;
    while ((ch = getc(bffile)) != EOF)
    {
        if (ch == '>')
        {
            if (index < ARRAY_SIZE - 1)
                index++;
        }
        else if (ch == '<')
        {
            if (index > 0)
                index--;
        }
        else if (ch == '+')
        {
            array[index]++;
        }
        else if (ch == '-')
        {
            array[index]--;
        }
        else if (ch == '.')
        {
            putchar(array[index]);
        }
        else if (ch == ',')
        {
            array[index] = getchar();
        }
        else if (ch == '[')
        {
            if (array[index] == 0)
            {
                int depth = 1;
                while (depth > 0)
                {
                    ch = getc(bffile);
                    if (ch == '[')
                        depth++;
                    else if (ch == ']')
                        depth--;
                }
            }
            else
            {
                stack[index_stack++] = ftell(bffile);
            }
        }
        else if (ch == ']')
        {
            if (array[index] != 0)
            {
                fseek(bffile, stack[index_stack - 1], SEEK_SET);
            }
            else
            {
                index_stack--;
            }
        }
        else
        {
            // comment
        }
    }
    fclose(bffile);
    return 0;
}