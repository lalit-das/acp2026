#include <stdio.h>
typedef struct { float length, width, area, costPerUnit, totalCost; } Floor;
void inputDetails(int n, Floor floors[n]) {
    for (int i = 0; i < n; i++) {
        printf("Floor %d - l, w, cost/unit: ", i+1);
        scanf("%f %f %f", &floors[i].length, &floors[i].width, &floors[i].costPerUnit);
    }
}
void calculateCosts(int n, Floor floors[n]) {
    for (int i = 0; i < n; i++) {
        floors[i].area = floors[i].length * floors[i].width;
        floors[i].totalCost = floors[i].area * floors[i].costPerUnit;
    }
}
void displayHighestCost(int index, Floor floors[]) {
    printf("Highest cost floor %d: Rs. %.2f\n", index + 1, floors[index].totalCost);
}
void highestCostFloor(int n, Floor floors[n]) {
    int idx = 0;
    for (int i = 1; i < n; i++) if (floors[i].totalCost > floors[idx].totalCost) idx = i;
    displayHighestCost(idx, floors);
}
int main() {
    int n; printf("Floors: "); scanf("%d", &n);
    Floor floors[n]; inputDetails(n, floors); calculateCosts(n, floors);
    highestCostFloor(n, floors); return 0;
}
