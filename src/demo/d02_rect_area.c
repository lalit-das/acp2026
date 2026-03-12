#include <stdio.h>
#include <string.h>
typedef struct { char name[50]; float length, width, area; } Rectangle;
Rectangle input() {
    Rectangle r;
    printf("Enter name, length, width: ");
    scanf("%s %f %f", r.name, &r.length, &r.width); return r;
}
float calculate_area(Rectangle rect) { return rect.length * rect.width; }
void compare_areas(Rectangle r1, Rectangle r2, Rectangle r3) {
    r1.area = calculate_area(r1); r2.area = calculate_area(r2); r3.area = calculate_area(r3);
    if (r1.area >= r2.area && r1.area >= r3.area) printf("Largest: %s (%.2f)\n", r1.name, r1.area);
    else if (r2.area >= r1.area && r2.area >= r3.area) printf("Largest: %s (%.2f)\n", r2.name, r2.area);
    else printf("Largest: %s (%.2f)\n", r3.name, r3.area);
}
int main() {
    Rectangle r1 = input(), r2 = input(), r3 = input();
    compare_areas(r1, r2, r3); return 0;
}
