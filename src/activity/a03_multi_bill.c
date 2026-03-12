#include <stdio.h>
typedef struct { int consumerID; float unitsConsumed, billAmount; } Bill;
void input(int n, Bill bills[n]) {
    for (int i = 0; i < n; i++) {
        printf("Consumer %d ID, units: ", i+1);
        scanf("%d %f", &bills[i].consumerID, &bills[i].unitsConsumed);
    }
}
void calculate_Bills(int n, Bill bills[n]) {
    for (int i = 0; i < n; i++) bills[i].billAmount = bills[i].unitsConsumed * 5.0f;
}
int findHighestBillIndex(int n, Bill bills[n]) {
    int idx = 0;
    for (int i = 1; i < n; i++) if (bills[i].billAmount > bills[idx].billAmount) idx = i;
    return idx;
}
void displayHighestBill(int index, Bill bills[]) {
    printf("Highest Bill -> Consumer %d: Rs. %.2f\n", bills[index].consumerID, bills[index].billAmount);
}
int main() {
    int n; printf("Consumers: "); scanf("%d", &n);
    Bill bills[n]; input(n, bills); calculate_Bills(n, bills);
    displayHighestBill(findHighestBillIndex(n, bills), bills); return 0;
}
