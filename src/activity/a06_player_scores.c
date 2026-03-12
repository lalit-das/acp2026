#include <stdio.h>
#include <stdlib.h>
int* allocate_scores(int n) {
    int *arr = (int*)malloc(n * sizeof(int));
    if (!arr) { printf("Allocation failed!\n"); exit(1); } return arr;
}
void read_scores(int *arr, int n) {
    for (int i = 0; i < n; i++) { printf("Player %d score: ", i+1); scanf("%d", &arr[i]); }
}
int calculate_total(int *arr, int n) { int t = 0; for (int i = 0; i < n; i++) t += arr[i]; return t; }
void display_scores(int *arr, int n) { for (int i = 0; i < n; i++) printf("Player %d: %d\n", i+1, arr[i]); }
void delete_scores(int **arr) { free(*arr); *arr = NULL; }
int main() {
    int n; printf("Number of players: "); scanf("%d", &n);
    int *scores = allocate_scores(n);
    read_scores(scores, n); display_scores(scores, n);
    printf("Total: %d\n", calculate_total(scores, n));
    delete_scores(&scores); return 0;
}
