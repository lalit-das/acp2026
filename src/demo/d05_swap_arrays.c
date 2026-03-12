#include <stdio.h>
void read_array(int n, int arr[]) { for (int i = 0; i < n; i++) scanf("%d", &arr[i]); }
void print_array(int n, int arr[]) { for (int i = 0; i < n; i++) printf("%d ", arr[i]); printf("\n"); }
void swap_array(int n, int a[n], int b[n]) {
    for (int i = 0; i < n; i++) { int tmp = a[i]; a[i] = b[i]; b[i] = tmp; }
}
int main() {
    int n; printf("Size: "); scanf("%d", &n);
    int a[n], b[n];
    printf("Array A: "); read_array(n, a);
    printf("Array B: "); read_array(n, b);
    swap_array(n, a, b);
    printf("After swap:\nA: "); print_array(n, a);
    printf("B: "); print_array(n, b);
    return 0;
}
