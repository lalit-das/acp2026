#include <stdio.h>
typedef struct { char player_name[50]; int jersey_number, runs_scored; } Player;
void readPlayers(int n, Player p[]) {
    for (int i = 0; i < n; i++) {
        printf("Player %d name, jersey, runs: ", i+1);
        scanf("%s %d %d", p[i].player_name, &p[i].jersey_number, &p[i].runs_scored);
    }
}
float calculateAverageRuns(int n, Player p[]) {
    int total = 0;
    for (int i = 0; i < n; i++) total += p[i].runs_scored;
    return (float)total / n;
}
int main() {
    Player team[11]; readPlayers(11, team);
    printf("Average runs: %.2f\n", calculateAverageRuns(11, team)); return 0;
}
