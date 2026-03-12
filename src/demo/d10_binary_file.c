#include <stdio.h>
typedef struct { int id; char name[50]; float marks; } Student;
void inputStudents(Student s[], int n) {
    for (int i = 0; i < n; i++) {
        printf("ID Name Marks: ");
        scanf("%d %s %f", &s[i].id, s[i].name, &s[i].marks);
    }
}
void writeToBinaryFile(Student s[], int n, const char *f) {
    FILE *fp = fopen(f, "wb");
    fwrite(&n, sizeof(int), 1, fp); fwrite(s, sizeof(Student), n, fp); fclose(fp);
}
int readFromBinaryFile(Student s[], const char *f) {
    FILE *fp = fopen(f, "rb"); int n;
    fread(&n, sizeof(int), 1, fp); fread(s, sizeof(Student), n, fp); fclose(fp); return n;
}
void printStudents(Student s[], int n) {
    for (int i = 0; i < n; i++) printf("%d %s %.2f\n", s[i].id, s[i].name, s[i].marks);
}
int main() {
    int n; printf("Students: "); scanf("%d", &n);
    Student s[n], s2[n];
    inputStudents(s, n);
    writeToBinaryFile(s, n, "./students_test.bin");
    int m = readFromBinaryFile(s2, "./students_test.bin");
    printStudents(s2, m); return 0;
}
