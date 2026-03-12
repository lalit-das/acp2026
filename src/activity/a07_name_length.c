#include <stdio.h>
void input(char *name) { scanf("%s", name); }
int calculate_name_length(char *name) { int len = 0; while (name[len] != '\0') len++; return len; }
void compare_output(int len1, int len2) {
    if (len1 > len2) printf("Student 1 has a longer name.\n");
    else if (len2 > len1) printf("Student 2 has a longer name.\n");
    else printf("Both names are equally long.\n");
}
int main() {
    char n1[100], n2[100];
    printf("Student 1 name: "); input(n1);
    printf("Student 2 name: "); input(n2);
    compare_output(calculate_name_length(n1), calculate_name_length(n2)); return 0;
}
