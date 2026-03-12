#include <stdio.h>
typedef struct { int flight_number; char destination[50]; float ticket_price; } Flight;
void inputFlights(Flight f[], int n) {
    for (int i = 0; i < n; i++) {
        printf("Flight %d - number, destination, price: ", i+1);
        scanf("%d %s %f", &f[i].flight_number, f[i].destination, &f[i].ticket_price);
    }
}
void saveToBinary(Flight f[], int n, const char *filename) {
    FILE *fp = fopen(filename, "wb");
    fwrite(&n, sizeof(int), 1, fp); fwrite(f, sizeof(Flight), n, fp); fclose(fp);
}
Flight findMostExpensive(const char *filename) {
    FILE *fp = fopen(filename, "rb"); int n;
    fread(&n, sizeof(int), 1, fp); Flight f[n]; fread(f, sizeof(Flight), n, fp); fclose(fp);
    int idx = 0;
    for (int i = 1; i < n; i++) if (f[i].ticket_price > f[idx].ticket_price) idx = i;
    return f[idx];
}
void displayTopFlight(Flight f) {
    printf("Most Expensive: Flight %d to %s - Rs. %.2f\n", f.flight_number, f.destination, f.ticket_price);
}
int main() {
    int n; printf("Flights: "); scanf("%d", &n); Flight f[n];
    inputFlights(f, n); saveToBinary(f, n, "./flights_test.bin");
    displayTopFlight(findMostExpensive("./flights_test.bin")); return 0;
}
