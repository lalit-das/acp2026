#!/usr/bin/env bats
# =============================================================================
# SECTION C — Assignment Program Tests (S01–S10)
# =============================================================================

BIN="$BATS_TEST_DIRNAME/../bin"

# ---------------------------------------------------------------------------
# S01 · Student marks — highest and lowest
# ---------------------------------------------------------------------------
@test "S01: finds highest 92.50 and lowest 67.00 from 4 marks" {
  run bash -c "printf '4\n85.0\n92.5\n67.0\n78.3\n' | $BIN/s01_student_marks.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Highest: 92.50"* ]]
  [[ "$output" == *"Lowest: 67.00"*  ]]
}

@test "S01: single student — highest equals lowest" {
  run bash -c "printf '1\n75.0\n' | $BIN/s01_student_marks.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Highest: 75.00"* ]]
  [[ "$output" == *"Lowest: 75.00"*  ]]
}

@test "S01: highest mark at last position" {
  run bash -c "printf '3\n40.0\n55.0\n90.0\n' | $BIN/s01_student_marks.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Highest: 90.00"* ]]
  [[ "$output" == *"Lowest: 40.00"*  ]]
}

# ---------------------------------------------------------------------------
# S02 · Floor tiling cost — compare 3 named floors
# ---------------------------------------------------------------------------
@test "S02: identifies Hall as most expensive floor" {
  run bash -c "printf 'Kitchen 5.0 4.0 100.0\nHall 10.0 8.0 80.0\nBedroom 6.0 5.0 120.0\n' | $BIN/s02_floor_cost.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Most expensive: Hall (Rs. 6400.00)"* ]]
}

@test "S02: identifies Bedroom as most expensive when its cost is highest" {
  run bash -c "printf 'A 2.0 2.0 10.0\nB 3.0 3.0 10.0\nC 5.0 5.0 50.0\n' | $BIN/s02_floor_cost.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Most expensive: C (Rs. 1250.00)"* ]]
}

@test "S02: identifies first floor when it has highest cost" {
  run bash -c "printf 'Grand 10.0 10.0 200.0\nSmall 2.0 2.0 50.0\nMed 5.0 5.0 30.0\n' | $BIN/s02_floor_cost.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Most expensive: Grand (Rs. 20000.00)"* ]]
}

# ---------------------------------------------------------------------------
# S03 · Floor array — highest cost floor
# ---------------------------------------------------------------------------
@test "S03: identifies floor 2 as having highest cost" {
  run bash -c "printf '3\n5.0 4.0 100.0\n10.0 8.0 80.0\n6.0 5.0 120.0\n' | $BIN/s03_floor_array.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Highest cost floor 2: Rs. 6400.00"* ]]
}

@test "S03: identifies floor 1 as highest when it has max cost" {
  run bash -c "printf '2\n10.0 10.0 50.0\n2.0 2.0 10.0\n' | $BIN/s03_floor_array.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Highest cost floor 1: Rs. 5000.00"* ]]
}

@test "S03: single floor is the highest by default" {
  run bash -c "printf '1\n4.0 3.0 200.0\n' | $BIN/s03_floor_array.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Highest cost floor 1: Rs. 2400.00"* ]]
}

# ---------------------------------------------------------------------------
# S04 · Car fleet — display cars manufactured after 2022
# ---------------------------------------------------------------------------
@test "S04: displays cars made after 2022" {
  run bash -c "printf '1 ToyotaCamry 2021 1500000.0\n2 HondaCity 2023 900000.0\n3 MarutiSwift 2024 600000.0\n4 HyundaiCreta 2020 1200000.0\n' | $BIN/s04_cars.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"HondaCity"*   ]]
  [[ "$output" == *"MarutiSwift"* ]]
}

@test "S04: excludes cars made in 2022 or earlier" {
  run bash -c "printf '1 ToyotaCamry 2021 1500000.0\n2 HondaCity 2023 900000.0\n3 MarutiSwift 2024 600000.0\n4 HyundaiCreta 2020 1200000.0\n' | $BIN/s04_cars.exe"
  [ "$status" -eq 0 ]
  [[ "$output" != *"ToyotaCamry"*  ]]
  [[ "$output" != *"HyundaiCreta"* ]]
}

@test "S04: prints 'No modern cars found' when all cars are old" {
  run bash -c "printf '1 OldCar1 2018 500000.0\n2 OldCar2 2019 600000.0\n3 OldCar3 2020 700000.0\n4 OldCar4 2021 800000.0\n' | $BIN/s04_cars.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"No modern cars found."* ]]
}

@test "S04: prints 'Modern Cars (after 2022)' header" {
  run bash -c "printf '1 A 2023 1.0\n2 B 2024 2.0\n3 C 2025 3.0\n4 D 2022 4.0\n' | $BIN/s04_cars.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Modern Cars (after 2022)"* ]]
}

# ---------------------------------------------------------------------------
# S05 · Swap two Person structs (name + age)
# ---------------------------------------------------------------------------
@test "S05: swaps names and ages of two persons" {
  run bash -c "printf 'Alice 25\nBob 30\n' | $BIN/s05_swap_person.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"P1:"*      ]]
  [[ "$output" == *"Bob"*      ]]
  [[ "$output" == *"Age: 30"*  ]]
  [[ "$output" == *"P2:"*      ]]
  [[ "$output" == *"Alice"*    ]]
  [[ "$output" == *"Age: 25"*  ]]
}

@test "S05: prints 'After swap' label" {
  run bash -c "printf 'X 10\nY 20\n' | $BIN/s05_swap_person.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"After swap"* ]]
}

# ---------------------------------------------------------------------------
# S06 · Pharmacy medicine inventory (dynamic memory)
# ---------------------------------------------------------------------------
@test "S06: displays all 3 medicines with ID, name, expiry" {
  run bash -c "printf '3\n1 Paracetamol 2025\n2 Ibuprofen 2026\n3 Amoxicillin 2024\n' | $BIN/s06_pharmacy.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Paracetamol"* ]]
  [[ "$output" == *"Ibuprofen"*   ]]
  [[ "$output" == *"Amoxicillin"* ]]
  [[ "$output" == *"2025"*        ]]
  [[ "$output" == *"2026"*        ]]
  [[ "$output" == *"2024"*        ]]
}

@test "S06: prints header row ID/Name/Expiry" {
  run bash -c "printf '1\n1 Aspirin 2027\n' | $BIN/s06_pharmacy.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"ID"*     ]]
  [[ "$output" == *"Name"*   ]]
  [[ "$output" == *"Expiry"* ]]
}

@test "S06: single medicine entry is shown correctly" {
  run bash -c "printf '1\n9 Metformin 2028\n' | $BIN/s06_pharmacy.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Metformin"* ]]
  [[ "$output" == *"2028"*      ]]
}

# ---------------------------------------------------------------------------
# S07 · Word count in a sentence
# ---------------------------------------------------------------------------
@test "S07: counts 4 words in 'Hello World from C'" {
  run bash -c "printf 'Hello World from C\n' | $BIN/s07_word_count.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Word count: 4"* ]]
}

@test "S07: counts 1 word for a single word input" {
  run bash -c "printf 'Hello\n' | $BIN/s07_word_count.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Word count: 1"* ]]
}

@test "S07: extra spaces between words do not inflate count" {
  run bash -c "printf 'one  two   three\n' | $BIN/s07_word_count.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Word count: 3"* ]]
}

@test "S07: five-word sentence is counted correctly" {
  run bash -c "printf 'the quick brown fox jumps\n' | $BIN/s07_word_count.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Word count: 5"* ]]
}

# ---------------------------------------------------------------------------
# S08 · Password validator (>=8 chars, uppercase, lowercase, digit)
# ---------------------------------------------------------------------------
@test "S08: valid password Pass@123 is accepted" {
  run bash -c "printf 'Pass@123\n' | $BIN/s08_password.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"is VALID"* ]]
}

@test "S08: password shorter than 8 chars is invalid" {
  run bash -c "printf 'Ab1\n' | $BIN/s08_password.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"is INVALID"* ]]
}

@test "S08: all-lowercase with digit is invalid (no uppercase)" {
  run bash -c "printf 'password1\n' | $BIN/s08_password.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"is INVALID"* ]]
}

@test "S08: all-uppercase with digit is invalid (no lowercase)" {
  run bash -c "printf 'PASSWORD1\n' | $BIN/s08_password.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"is INVALID"* ]]
}

@test "S08: valid password with exactly 8 characters is accepted" {
  run bash -c "printf 'Secure1x\n' | $BIN/s08_password.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"is VALID"* ]]
}

@test "S08: no digit makes a mixed-case 8-char password invalid" {
  run bash -c "printf 'Password\n' | $BIN/s08_password.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"is INVALID"* ]]
}

# ---------------------------------------------------------------------------
# S09 · Retail store — inventory text file, total stock value
# ---------------------------------------------------------------------------
@test "S09: computes total stock value of 3 products" {
  run bash -c "printf '3\n1 Apple 50.0\n2 Banana 30.0\n3 Cherry 80.0\n' | $BIN/s09_retail_text.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Stock Value: Rs. 160.00"* ]]
}

@test "S09: single product total equals its own price" {
  run bash -c "printf '1\n1 Mango 120.0\n' | $BIN/s09_retail_text.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Stock Value: Rs. 120.00"* ]]
}

@test "S09: two products sum correctly" {
  run bash -c "printf '2\n1 Rice 250.0\n2 Wheat 150.0\n' | $BIN/s09_retail_text.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Stock Value: Rs. 400.00"* ]]
}

# ---------------------------------------------------------------------------
# S10 · Warehouse binary file — total stock value
# ---------------------------------------------------------------------------
@test "S10: computes total from binary file for 3 products" {
  run bash -c "printf '3\n1 Apple 50.0\n2 Banana 30.0\n3 Cherry 80.0\n' | $BIN/s10_warehouse_bin.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Stock Value: Rs. 160.00"* ]]
}

@test "S10: single product binary file total is correct" {
  run bash -c "printf '1\n1 Gold 9999.99\n' | $BIN/s10_warehouse_bin.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Stock Value: Rs. 9999.99"* ]]
}

@test "S10: four products total computed from binary file" {
  run bash -c "printf '4\n1 A 100.0\n2 B 200.0\n3 C 300.0\n4 D 400.0\n' | $BIN/s10_warehouse_bin.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Total Stock Value: Rs. 1000.00"* ]]
}
