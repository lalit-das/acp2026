#include <stdio.h>
#include <string.h>
void input(char *str) { printf("Enter password: "); scanf("%s", str); }
int is_upper(char c) { return c >= 'A' && c <= 'Z'; }
int is_lower(char c) { return c >= 'a' && c <= 'z'; }
int is_digit(char c) { return c >= '0' && c <= '9'; }
int is_valid(char *str) {
    if (strlen(str) < 8) return 0;
    int u = 0, l = 0, d = 0;
    for (int i = 0; str[i]; i++) {
        if (is_upper(str[i])) u = 1;
        if (is_lower(str[i])) l = 1;
        if (is_digit(str[i])) d = 1;
    }
    return u && l && d;
}
void display(char *str, int res) { printf("Password '%s' is %s.\n", str, res ? "VALID" : "INVALID"); }
int main() { char pass[100]; input(pass); display(pass, is_valid(pass)); return 0; }
