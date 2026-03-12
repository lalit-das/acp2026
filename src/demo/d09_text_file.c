#include <stdio.h>
#include <string.h>
typedef struct { int id; char name[50]; float marks; } Student;
void inputStudents(Student s[], int n) {
    for (int i = 0; i < n; i++) {
        printf("ID Name Marks: ");
        scanf("%d %s %f", &s[i].id, s[i].name, &s[i].marks);
    }
}
void writeToTextFile(Student s[], int n, const char *f) {
    FILE *fp = fopen(f, "w");
    fprintf(fp, "%d\n", n);
    for (int i = 0; i < n; i++) fprintf(fp, "%d %s %.2f\n", s[i].id, s[i].name, s[i].marks);
    fclose(fp);
}
int readFromTextFile(Student s[], const char *f) {
    FILE *fp = fopen(f, "r"); int n; fscanf(fp, "%d", &n);
    for (int i = 0; i < n; i++) fscanf(fp, "%d %s %f", &s[i].id, s[i].name, &s[i].marks);
    fclose(fp); return n;
}
void printStudents(Student s[], int n) {
    printf("%-5s %-15s %s\n", "ID", "Name", "Marks");
    for (int i = 0; i < n; i++) printf("%-5d %-15s %.2f\n", s[i].id, s[i].name, s[i].marks);
}
int main() {
    int n; printf("Students: "); scanf("%d", &n);
    Student s[n], s2[n];
    inputStudents(s, n);
    writeToTextFile(s, n, "./students_test.txt");
    int m = readFromTextFile(s2, "./students_test.txt");
    printStudents(s2, m); return 0;
}
