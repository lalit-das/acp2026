#!/usr/bin/env bats
# =============================================================================
# SECTION B — Activity Program Tests (A01–A10)
# =============================================================================

BIN="$BATS_TEST_DIRNAME/../bin"

# ---------------------------------------------------------------------------
# A01 · Weekly temperature — min and max of 7 floats
# ---------------------------------------------------------------------------
@test "A01: finds correct max and min from 7 temperatures" {
  run bash -c "printf '36.5\n37.0\n38.2\n35.0\n39.1\n37.5\n36.8\n' | $BIN/a01_temperature.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Max temp: 39.10"* ]]
  [[ "$output" == *"Min temp: 35.00"* ]]
}

@test "A01: identifies max when first day is hottest" {
  run bash -c "printf '45.0\n30.0\n32.0\n28.0\n31.0\n29.0\n33.0\n' | $BIN/a01_temperature.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Max temp: 45.00"* ]]
}

@test "A01: identifies min when last day is coldest" {
  run bash -c "printf '20.0\n21.0\n19.0\n22.0\n23.0\n18.0\n10.0\n' | $BIN/a01_temperature.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Min temp: 10.00"* ]]
}

@test "A01: all identical temperatures report same max and min" {
  run bash -c "printf '25.0\n25.0\n25.0\n25.0\n25.0\n25.0\n25.0\n' | $BIN/a01_temperature.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Max temp: 25.00"* ]]
  [[ "$output" == *"Min temp: 25.00"* ]]
}

# ---------------------------------------------------------------------------
# A02 · Electricity bill — single consumer with extra charge logic
# ---------------------------------------------------------------------------
@test "A02: calculates normal bill for 80 units at Rs 2.50/unit" {
  run bash -c "printf '80\n2.5\n' | $BIN/a02_electricity_bill.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Bill: Rs. 200.00"* ]]
}

@test "A02: applies extra charge when units exceed 100" {
  run bash -c "printf '150\n2.0\n' | $BIN/a02_electricity_bill.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"High consumption alert! Extra charge applied."* ]]
  [[ "$output" == *"Total Bill: Rs. 550.00"* ]]
}

@test "A02: no extra charge for exactly 100 units" {
  run bash -c "printf '100\n3.0\n' | $BIN/a02_electricity_bill.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Bill: Rs. 300.00"* ]]
  [[ "$output" != *"Extra charge"* ]]
}

@test "A02: prints units and rate in output" {
  run bash -c "printf '60\n4.0\n' | $BIN/a02_electricity_bill.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Units: 60"*  ]]
  [[ "$output" == *"Rate: 4.00"* ]]
}

# ---------------------------------------------------------------------------
# A03 · Electricity bills for multiple consumers — highest bill
# ---------------------------------------------------------------------------
@test "A03: identifies consumer with highest bill among 3" {
  run bash -c "printf '3\n1 200\n2 80\n3 350\n' | $BIN/a03_multi_bill.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Highest Bill -> Consumer 3: Rs. 1750.00"* ]]
}

@test "A03: identifies first consumer when they have highest bill" {
  run bash -c "printf '3\n10 500\n20 100\n30 200\n' | $BIN/a03_multi_bill.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Highest Bill -> Consumer 10: Rs. 2500.00"* ]]
}

@test "A03: works for single consumer" {
  run bash -c "printf '1\n99 120\n' | $BIN/a03_multi_bill.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Highest Bill -> Consumer 99: Rs. 600.00"* ]]
}

# ---------------------------------------------------------------------------
# A04 · Cricket team — average runs for 11 players
# ---------------------------------------------------------------------------
@test "A04: calculates average of 11 player runs correctly" {
  run bash -c "printf \
    'Rohit 45 120\nVirat 18 95\nDhoni 7 85\nSachin 10 100\nDravid 19 75\nGanguly 99 60\nKohli 11 80\nShami 11 30\nBumrah 93 10\nIyer 41 50\nPant 17 70\n' \
    | $BIN/a04_cricket.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Average runs: 70.45"* ]]
}

@test "A04: all-zero runs give 0.00 average" {
  run bash -c "printf \
    'P1 1 0\nP2 2 0\nP3 3 0\nP4 4 0\nP5 5 0\nP6 6 0\nP7 7 0\nP8 8 0\nP9 9 0\nP10 10 0\nP11 11 0\n' \
    | $BIN/a04_cricket.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Average runs: 0.00"* ]]
}

# ---------------------------------------------------------------------------
# A05 · Swap two strings
# ---------------------------------------------------------------------------
@test "A05: swaps Hello and World correctly" {
  run bash -c "printf 'Hello\nWorld\n' | $BIN/a05_swap_strings.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"S1: World"* ]]
  [[ "$output" == *"S2: Hello"* ]]
}

@test "A05: swap of identical strings yields same strings" {
  run bash -c "printf 'same\nsame\n' | $BIN/a05_swap_strings.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"S1: same"* ]]
  [[ "$output" == *"S2: same"* ]]
}

@test "A05: prints 'After swap' label" {
  run bash -c "printf 'alpha\nbeta\n' | $BIN/a05_swap_strings.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"After swap"* ]]
}

# ---------------------------------------------------------------------------
# A06 · Dynamic player scores — total and display
# ---------------------------------------------------------------------------
@test "A06: reads 3 scores and computes correct total" {
  run bash -c "printf '3\n50 70 90\n' | $BIN/a06_player_scores.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total: 210"* ]]
}

@test "A06: displays individual player scores" {
  run bash -c "printf '3\n50 70 90\n' | $BIN/a06_player_scores.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Player 1: 50"* ]]
  [[ "$output" == *"Player 2: 70"* ]]
  [[ "$output" == *"Player 3: 90"* ]]
}

@test "A06: single player with score 100 gives total 100" {
  run bash -c "printf '1\n100\n' | $BIN/a06_player_scores.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total: 100"* ]]
}

# ---------------------------------------------------------------------------
# A07 · Name length comparison
# ---------------------------------------------------------------------------
@test "A07: identifies student 1 has longer name" {
  run bash -c "printf 'Alexander\nAlex\n' | $BIN/a07_name_length.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Student 1 has a longer name."* ]]
}

@test "A07: identifies student 2 has longer name" {
  run bash -c "printf 'Alex\nAlexander\n' | $BIN/a07_name_length.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Student 2 has a longer name."* ]]
}

@test "A07: equal-length names are detected" {
  run bash -c "printf 'Alex\nJohn\n' | $BIN/a07_name_length.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Both names are equally long."* ]]
}

# ---------------------------------------------------------------------------
# A08 · Vowel and consonant count
# ---------------------------------------------------------------------------
@test "A08: counts vowels and consonants in 'Hello World'" {
  run bash -c "printf 'Hello World\n' | $BIN/a08_vowels.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Vowels: 3"*      ]]
  [[ "$output" == *"Consonants: 7"*  ]]
}

@test "A08: all-vowel string has zero consonants" {
  run bash -c "printf 'aeiou\n' | $BIN/a08_vowels.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Vowels: 5"*     ]]
  [[ "$output" == *"Consonants: 0"* ]]
}

@test "A08: non-alphabetic characters are not counted" {
  run bash -c "printf 'a1b2c3\n' | $BIN/a08_vowels.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Vowels: 1"*     ]]
  [[ "$output" == *"Consonants: 2"* ]]
}

# ---------------------------------------------------------------------------
# A09 · Payroll — text file total salary
# ---------------------------------------------------------------------------
@test "A09: calculates total payroll for 2 employees" {
  run bash -c "printf '2\n1 Alice 30000.0\n2 Bob 25000.0\n' | $BIN/a09_payroll.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Payroll Expenditure: Rs. 55000.00"* ]]
}

@test "A09: single employee payroll is correct" {
  run bash -c "printf '1\n1 Charlie 50000.0\n' | $BIN/a09_payroll.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Payroll Expenditure: Rs. 50000.00"* ]]
}

@test "A09: three employees sum correctly" {
  run bash -c "printf '3\n1 A 10000.0\n2 B 20000.0\n3 C 30000.0\n' | $BIN/a09_payroll.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Payroll Expenditure: Rs. 60000.00"* ]]
}

# ---------------------------------------------------------------------------
# A10 · Flights binary file — most expensive flight
# ---------------------------------------------------------------------------
@test "A10: identifies most expensive flight among 3" {
  run bash -c "printf '3\n101 Delhi 5000.0\n102 Mumbai 8000.0\n103 Paris 12000.0\n' | $BIN/a10_flights_bin.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Most Expensive: Flight 103 to Paris - Rs. 12000.00"* ]]
}

@test "A10: identifies most expensive when it is first flight" {
  run bash -c "printf '3\n201 London 15000.0\n202 Dubai 9000.0\n203 Singapore 11000.0\n' | $BIN/a10_flights_bin.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Most Expensive: Flight 201 to London - Rs. 15000.00"* ]]
}

@test "A10: single flight is the most expensive by default" {
  run bash -c "printf '1\n301 NewYork 20000.0\n' | $BIN/a10_flights_bin.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Most Expensive: Flight 301 to NewYork - Rs. 20000.00"* ]]
}
