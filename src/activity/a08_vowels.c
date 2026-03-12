#include <stdio.h>
#include <ctype.h>
void input(char *str) { printf("Enter string: "); fgets(str, 200, stdin); }
void count(char *str, int *vowels, int *consonants) {
    *vowels = *consonants = 0;
    for (int i = 0; str[i]; i++) {
        char c = tolower(str[i]);
        if (c=='a'||c=='e'||c=='i'||c=='o'||c=='u') (*vowels)++;
        else if (c>='a' && c<='z') (*consonants)++;
    }
}
void display(char *str, int vowels, int consonants) {
    printf("String: %s", str);
    printf("Vowels: %d Consonants: %d\n", vowels, consonants);
}
int main() {
    char str[200]; int v, c;
    input(str); count(str, &v, &c); display(str, v, c); return 0;
}
