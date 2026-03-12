#include <stdio.h>
typedef struct { int id; char name[50]; float price; } Product;
void inputProducts(Product p[], int n) {
    for (int i = 0; i < n; i++) {
        printf("Product %d - ID, name, price: ", i+1);
        scanf("%d %s %f", &p[i].id, p[i].name, &p[i].price);
    }
}
void saveToFile(Product p[], int n, const char *file) {
    FILE *fp = fopen(file, "w"); fprintf(fp, "%d\n", n);
    for (int i = 0; i < n; i++) fprintf(fp, "%d %s %.2f\n", p[i].id, p[i].name, p[i].price);
    fclose(fp);
}
float calculateTotalValue(const char *file) {
    FILE *fp = fopen(file, "r"); int n; fscanf(fp, "%d", &n);
    float total = 0, pr; int id; char name[50];
    for (int i = 0; i < n; i++) { fscanf(fp, "%d %s %f", &id, name, &pr); total += pr; }
    fclose(fp); return total;
}
void displayTotalValue(float total) { printf("Total Stock Value: Rs. %.2f\n", total); }
int main() {
    int n; printf("Products: "); scanf("%d", &n);
    Product p[n]; inputProducts(p, n);
    saveToFile(p, n, "./inventory_test.txt");
    displayTotalValue(calculateTotalValue("./inventory_test.txt")); return 0;
}
