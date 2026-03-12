#include <stdio.h>
typedef struct { int id; char name[50]; float price; } Product;
void inputProducts(Product p[], int n) {
    for (int i = 0; i < n; i++) {
        printf("Product %d - ID, name, price: ", i+1);
        scanf("%d %s %f", &p[i].id, p[i].name, &p[i].price);
    }
}
void saveToBinaryFile(Product p[], int n, const char *file) {
    FILE *fp = fopen(file, "wb");
    fwrite(&n, sizeof(int), 1, fp); fwrite(p, sizeof(Product), n, fp); fclose(fp);
}
float calculateTotalValue(const char *file) {
    FILE *fp = fopen(file, "rb"); int n;
    fread(&n, sizeof(int), 1, fp); Product p[n]; fread(p, sizeof(Product), n, fp); fclose(fp);
    float total = 0; for (int i = 0; i < n; i++) total += p[i].price; return total;
}
void displayTotalValue(float total) { printf("Total Stock Value: Rs. %.2f\n", total); }
int main() {
    int n; printf("Products: "); scanf("%d", &n);
    Product p[n]; inputProducts(p, n);
    saveToBinaryFile(p, n, "./inventory_test.bin");
    displayTotalValue(calculateTotalValue("./inventory_test.bin")); return 0;
}
