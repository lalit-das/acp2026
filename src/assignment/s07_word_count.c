#include <stdio.h>
void input(char *str) { printf("Enter sentence: "); fgets(str, 500, stdin); }
int count_words(char *str) {
    int count = 0, inWord = 0, i = 0;
    while (str[i] != '\0') {
        if (str[i] != ' ' && str[i] != '\n') { if (!inWord) { count++; inWord = 1; } }
        else { inWord = 0; }
        i++;
    }
    return count;
}
void display(char *str, int count) { printf("Sentence: %s", str); printf("Word count: %d\n", count); }
int main() { char str[500]; input(str); display(str, count_words(str)); return 0; }
