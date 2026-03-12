#include <stdio.h>
void inputTemperatures(int n, float temps[n]) {
    for (int i = 0; i < n; i++) { printf("Day %d temp: ", i+1); scanf("%f", &temps[i]); }
}
float findHighest(int n, float temps[n]) {
    float max = temps[0];
    for (int i = 1; i < n; i++) if (temps[i] > max) max = temps[i];
    return max;
}
float findLowest(int n, float temps[n]) {
    float min = temps[0];
    for (int i = 1; i < n; i++) if (temps[i] < min) min = temps[i];
    return min;
}
void output(float max, float min) { printf("Max temp: %.2f\nMin temp: %.2f\n", max, min); }
int main() {
    float temps[7]; inputTemperatures(7, temps);
    output(findHighest(7, temps), findLowest(7, temps)); return 0;
}
