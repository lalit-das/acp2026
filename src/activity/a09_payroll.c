#include <stdio.h>
typedef struct { int id; char name[50]; float basic_salary; } Employee;
void inputEmployees(Employee e[], int n) {
    for (int i = 0; i < n; i++) {
        printf("ID Name Salary: ");
        scanf("%d %s %f", &e[i].id, e[i].name, &e[i].basic_salary);
    }
}
void writeToTextFile(Employee e[], int n, const char *f) {
    FILE *fp = fopen(f, "w"); fprintf(fp, "%d\n", n);
    for (int i = 0; i < n; i++) fprintf(fp, "%d %s %.2f\n", e[i].id, e[i].name, e[i].basic_salary);
    fclose(fp);
}
float calculateTotalPayroll(const char *f) {
    FILE *fp = fopen(f, "r"); int n; fscanf(fp, "%d", &n);
    float total = 0, sal; int id; char name[50];
    for (int i = 0; i < n; i++) { fscanf(fp, "%d %s %f", &id, name, &sal); total += sal; }
    fclose(fp); return total;
}
void displayExpenditure(float total) { printf("Total Payroll Expenditure: Rs. %.2f\n", total); }
int main() {
    int n; printf("Employees: "); scanf("%d", &n);
    Employee e[n]; inputEmployees(e, n);
    writeToTextFile(e, n, "./payroll_test.txt");
    displayExpenditure(calculateTotalPayroll("./payroll_test.txt")); return 0;
}
