#include <stdio.h>
void input(char *str) { scanf("%s", str); }
void concatenate_strings(char *str1, char *str2) {
    int i = 0;
    while (str1[i] != '\0') i++;
    int j = 0;
    while (str2[j] != '\0') str1[i++] = str2[j++];
    str1[i] = '\0';
}
void display(char *str) { printf("Result: %s\n", str); }
int main() {
    char s1[200], s2[100];
    printf("String 1: "); input(s1);
    printf("String 2: "); input(s2);
    concatenate_strings(s1, s2); display(s1); return 0;
}
