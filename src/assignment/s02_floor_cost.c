#include <stdio.h>
typedef struct { char name[50]; float length, width, cost_per_unit, total_cost; } Floor;
Floor input() {
    Floor f; printf("Name, length, width, cost/unit: ");
    scanf("%s %f %f %f", f.name, &f.length, &f.width, &f.cost_per_unit); return f;
}
float calculate_cost(Floor f) { return f.length * f.width * f.cost_per_unit; }
void compare_costs(Floor f1, Floor f2, Floor f3) {
    f1.total_cost = calculate_cost(f1); f2.total_cost = calculate_cost(f2); f3.total_cost = calculate_cost(f3);
    if (f1.total_cost >= f2.total_cost && f1.total_cost >= f3.total_cost)
        printf("Most expensive: %s (Rs. %.2f)\n", f1.name, f1.total_cost);
    else if (f2.total_cost >= f1.total_cost && f2.total_cost >= f3.total_cost)
        printf("Most expensive: %s (Rs. %.2f)\n", f2.name, f2.total_cost);
    else printf("Most expensive: %s (Rs. %.2f)\n", f3.name, f3.total_cost);
}
int main() { Floor f1 = input(), f2 = input(), f3 = input(); compare_costs(f1, f2, f3); return 0; }
