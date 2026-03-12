#include <stdio.h>
void inputStrings(char str1[], char str2[]) {
    printf("String 1: "); scanf("%s", str1);
    printf("String 2: "); scanf("%s", str2);
}
int compareStrings(char str1[], char str2[]) {
    int i = 0;
    while (str1[i] != '\0' && str2[i] != '\0') {
        if (str1[i] > str2[i]) return 1;
        if (str1[i] < str2[i]) return -1;
        i++;
    }
    if (str1[i] != '\0') return 1;
    if (str2[i] != '\0') return -1;
    return 0;
}
void output(int result) {
    if (result == 0) printf("Strings are equal.\n");
    else if (result == 1) printf("String 1 is greater.\n");
    else printf("String 2 is greater.\n");
}
int main() {
    char s1[100], s2[100];
    inputStrings(s1, s2); output(compareStrings(s1, s2)); return 0;
}
