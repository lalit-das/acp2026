#include <stdio.h>
#include <string.h>
typedef struct { int flight_number, available_seats; char destination[50]; } Flight_t;
void readFlights(int n, Flight_t f[]) {
    for (int i = 0; i < n; i++) {
        printf("Flight %d - number, destination, seats: ", i+1);
        scanf("%d %s %d", &f[i].flight_number, f[i].destination, &f[i].available_seats);
    }
}
void searchByDestination(int n, Flight_t f[], char searchDest[]) {
    int found = 0;
    for (int i = 0; i < n; i++) {
        if (strcasecmp(f[i].destination, searchDest) == 0) {
            printf("Flight %d available to %s (%d seats)\n",
                   f[i].flight_number, f[i].destination, f[i].available_seats);
            found = 1;
        }
    }
    if (!found) printf("No flight to %s found.\n", searchDest);
}
int main() {
    Flight_t f[4]; readFlights(4, f);
    char dest[50]; printf("Enter destination to search: "); scanf("%s", dest);
    searchByDestination(4, f, dest); return 0;
}
