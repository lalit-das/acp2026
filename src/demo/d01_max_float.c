#include <stdio.h>
void input(int n, float arr[n]) {
    printf("Enter %d float values:\n", n);
    for (int i = 0; i < n; i++) { printf(" arr[%d]: ", i); scanf("%f", &arr[i]); }
}
int find_max_index(int n, float arr[n]) {
    int max_idx = 0;
    for (int i = 1; i < n; i++) if (arr[i] > arr[max_idx]) max_idx = i;
    return max_idx;
}
void output(float arr[], int max_index) {
    printf("Maximum value = %.2f at index %d\n", arr[max_index], max_index);
}
int main() {
    int n; printf("Enter number of elements: "); scanf("%d", &n);
    float arr[n]; input(n, arr);
    int idx = find_max_index(n, arr);
    output(arr, idx); return 0;
}
