#include <stdio.h>
#include <stdlib.h>
int* create_array(int n) {
    int *arr = (int*)malloc(n * sizeof(int));
    if (!arr) { printf("Memory error!\n"); exit(1); } return arr;
}
void initialize_array(int *arr, int n) {
    printf("Enter %d integers:\n", n);
    for (int i = 0; i < n; i++) scanf("%d", &arr[i]);
}
void print_array(int *arr, int n) { for (int i = 0; i < n; i++) printf("%d ", arr[i]); printf("\n"); }
void delete_array(int **arr) { free(*arr); *arr = NULL; }
int main() {
    int n; printf("Size: "); scanf("%d", &n);
    int *arr = create_array(n);
    initialize_array(arr, n);
    printf("Array: "); print_array(arr, n);
    delete_array(&arr);
    printf("Memory freed. arr = %p\n", (void*)arr);
    return 0;
}
