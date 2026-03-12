#include <stdio.h>
typedef struct { float length, width, area; } Rectangle;
void input(int n, Rectangle rects[n]) {
    for (int i = 0; i < n; i++) {
        printf("Rectangle %d - length, width: ", i+1);
        scanf("%f %f", &rects[i].length, &rects[i].width);
    }
}
void calculate_area(int n, Rectangle rects[n]) {
    for (int i = 0; i < n; i++) rects[i].area = rects[i].length * rects[i].width;
}
int findLargestArea(int n, Rectangle rects[n]) {
    int idx = 0;
    for (int i = 1; i < n; i++) if (rects[i].area > rects[idx].area) idx = i;
    return idx;
}
void output(int largestIndex, Rectangle rects[]) {
    printf("Largest area: %.2f (Rectangle %d)\n", rects[largestIndex].area, largestIndex + 1);
}
int main() {
    int n; scanf("%d", &n);
    Rectangle rects[n]; input(n, rects); calculate_area(n, rects);
    output(findLargestArea(n, rects), rects); return 0;
}
