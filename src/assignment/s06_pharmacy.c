#include <stdio.h>
#include <stdlib.h>
typedef struct { int id, expiry_year; char name[50]; } Medicine_t;
Medicine_t* allocate_inventory(int n) {
    Medicine_t *m = (Medicine_t*)malloc(n * sizeof(Medicine_t));
    if (!m) { printf("Allocation failed!\n"); exit(1); } return m;
}
void read_inventory(Medicine_t *m, int n) {
    for (int i = 0; i < n; i++) {
        printf("Medicine %d - ID, name, expiry year: ", i+1);
        scanf("%d %s %d", &m[i].id, m[i].name, &m[i].expiry_year);
    }
}
void display_inventory(Medicine_t *m, int n) {
    printf("%-5s %-20s %s\n", "ID", "Name", "Expiry");
    for (int i = 0; i < n; i++) printf("%-5d %-20s %d\n", m[i].id, m[i].name, m[i].expiry_year);
}
void delete_inventory(Medicine_t **m) { free(*m); *m = NULL; }
int main() {
    int n; printf("Medicines: "); scanf("%d", &n);
    Medicine_t *inv = allocate_inventory(n);
    read_inventory(inv, n); display_inventory(inv, n);
    delete_inventory(&inv); return 0;
}
