#include <stdio.h>
#include <string.h>
void read_string(char str[], int size) { fgets(str, size, stdin); str[strcspn(str, "\n")] = '\0'; }
void print_string(char str[]) { printf("%s\n", str); }
void swap_strings(char str1[], char str2[]) {
    char tmp[200]; strcpy(tmp, str1); strcpy(str1, str2); strcpy(str2, tmp);
}
int main() {
    char s1[200], s2[200];
    printf("String 1: "); read_string(s1, 200);
    printf("String 2: "); read_string(s2, 200);
    swap_strings(s1, s2);
    printf("After swap:\nS1: "); print_string(s1);
    printf("S2: "); print_string(s2); return 0;
}
