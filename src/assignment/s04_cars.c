#include <stdio.h>
typedef struct { int car_id, manufacture_year; char model_name[50]; float price; } Car_t;
void readCars(int n, Car_t c[]) {
    for (int i = 0; i < n; i++) {
        printf("Car %d - ID, model, year, price: ", i+1);
        scanf("%d %s %d %f", &c[i].car_id, c[i].model_name, &c[i].manufacture_year, &c[i].price);
    }
}
void displayModernCars(int n, Car_t c[]) {
    printf("Modern Cars (after 2022):\n");
    int found = 0;
    for (int i = 0; i < n; i++) {
        if (c[i].manufacture_year > 2022) {
            printf("ID:%d %s %d Rs.%.2f\n", c[i].car_id, c[i].model_name, c[i].manufacture_year, c[i].price);
            found = 1;
        }
    }
    if (!found) printf("No modern cars found.\n");
}
int main() { Car_t cars[4]; readCars(4, cars); displayModernCars(4, cars); return 0; }
