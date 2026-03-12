#include <stdio.h>
#include <string.h>
typedef struct { char name[50]; int age; } Person;
void read_person(Person *p) { printf("Name Age: "); scanf("%s %d", p->name, &p->age); }
void print_person(Person *p) { printf("Name: %-15s Age: %d\n", p->name, p->age); }
void swap_person(Person *p1, Person *p2) { Person tmp = *p1; *p1 = *p2; *p2 = tmp; }
int main() {
    Person p1, p2;
    printf("Person 1: "); read_person(&p1);
    printf("Person 2: "); read_person(&p2);
    swap_person(&p1, &p2);
    printf("After swap:\nP1: "); print_person(&p1);
    printf("P2: "); print_person(&p2); return 0;
}
