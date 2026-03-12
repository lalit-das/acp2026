#include <stdio.h>
void inputMarks(int n, float marks[n]) {
    for (int i = 0; i < n; i++) { printf("Student %d mark: ", i+1); scanf("%f", &marks[i]); }
}
float findHighestMark(int n, float marks[n]) {
    float max = marks[0]; for (int i = 1; i < n; i++) if (marks[i] > max) max = marks[i]; return max;
}
float findLowestMark(int n, float marks[n]) {
    float min = marks[0]; for (int i = 1; i < n; i++) if (marks[i] < min) min = marks[i]; return min;
}
void output(float max, float min) { printf("Highest: %.2f\nLowest: %.2f\n", max, min); }
int main() {
    int n; printf("Students: "); scanf("%d", &n);
    float marks[n]; inputMarks(n, marks);
    output(findHighestMark(n, marks), findLowestMark(n, marks)); return 0;
}
