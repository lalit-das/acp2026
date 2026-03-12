#include <stdio.h>
typedef struct { int units; float rate, total_bill; } ElectricityBill;
ElectricityBill input() {
    ElectricityBill b;
    printf("Units consumed: "); scanf("%d", &b.units);
    printf("Rate per unit (Rs): "); scanf("%f", &b.rate); return b;
}
ElectricityBill calculate_bill(ElectricityBill b) {
    b.total_bill = b.units * b.rate;
    if (b.units > 100) { b.total_bill += (b.units - 100) * 5.0f; printf("High consumption alert! Extra charge applied.\n"); }
    return b;
}
void output(ElectricityBill b) {
    printf("Units: %d\nRate: %.2f\nTotal Bill: Rs. %.2f\n", b.units, b.rate, b.total_bill);
}
int main() { ElectricityBill b = input(); b = calculate_bill(b); output(b); return 0; }
