#!/usr/bin/env bats
# =============================================================================
# SECTION A — Demo Program Tests (D01–D10)
# =============================================================================

BIN="$BATS_TEST_DIRNAME/../bin"

# ---------------------------------------------------------------------------
# D01 · Find maximum float value and its index
# ---------------------------------------------------------------------------
@test "D01: finds max value 3.20 at index 1 in [1.5, 3.2, 2.1]" {
  run bash -c "printf '3\n1.5\n3.2\n2.1\n' | $BIN/d01_max_float.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Maximum value = 3.20 at index 1"* ]]
}

@test "D01: finds max at index 0 when first element is largest" {
  run bash -c "printf '3\n9.9\n1.1\n5.5\n' | $BIN/d01_max_float.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Maximum value = 9.90 at index 0"* ]]
}

@test "D01: finds max at last index in single-element array" {
  run bash -c "printf '1\n42.0\n' | $BIN/d01_max_float.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Maximum value = 42.00 at index 0"* ]]
}

@test "D01: finds max at last index when last element is largest" {
  run bash -c "printf '4\n1.0\n2.0\n3.0\n4.0\n' | $BIN/d01_max_float.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Maximum value = 4.00 at index 3"* ]]
}

# ---------------------------------------------------------------------------
# D02 · Compare areas of 3 named rectangles
# ---------------------------------------------------------------------------
@test "D02: identifies RectA as largest when its area is greatest" {
  run bash -c "printf 'RectA 3.0 4.0\nRectB 5.0 2.0\nRectC 2.0 2.0\n' | $BIN/d02_rect_area.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Largest: RectA (12.00)"* ]]
}

@test "D02: identifies RectB as largest correctly" {
  run bash -c "printf 'A 2.0 2.0\nB 6.0 6.0\nC 3.0 3.0\n' | $BIN/d02_rect_area.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Largest: B (36.00)"* ]]
}

@test "D02: identifies RectC as largest correctly" {
  run bash -c "printf 'P 1.0 1.0\nQ 2.0 2.0\nR 5.0 5.0\n' | $BIN/d02_rect_area.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Largest: R (25.00)"* ]]
}

# ---------------------------------------------------------------------------
# D03 · Array of n rectangles — largest area
# ---------------------------------------------------------------------------
@test "D03: finds rectangle 1 as largest in a 3-element array" {
  run bash -c "printf '3\n3.0 4.0\n5.0 2.0\n2.0 2.0\n' | $BIN/d03_rect_array.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Largest area: 12.00 (Rectangle 1)"* ]]
}

@test "D03: finds rectangle 2 as largest when it has max area" {
  run bash -c "printf '3\n2.0 2.0\n7.0 3.0\n3.0 3.0\n' | $BIN/d03_rect_array.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Largest area: 21.00 (Rectangle 2)"* ]]
}

@test "D03: handles single rectangle" {
  run bash -c "printf '1\n5.0 6.0\n' | $BIN/d03_rect_array.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Largest area: 30.00 (Rectangle 1)"* ]]
}

# ---------------------------------------------------------------------------
# D04 · Flight search by destination (case-insensitive)
# ---------------------------------------------------------------------------
@test "D04: finds flight to Mumbai (exact case)" {
  run bash -c "printf '101 Delhi 50\n102 Mumbai 30\n103 Paris 20\n104 London 10\nMumbai\n' | $BIN/d04_flight_search.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight 102 available to Mumbai (30 seats)"* ]]
}

@test "D04: finds flight to Paris (case-insensitive lower)" {
  run bash -c "printf '101 Delhi 50\n102 Mumbai 30\n103 Paris 20\n104 London 10\nparis\n' | $BIN/d04_flight_search.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight 103 available to Paris (20 seats)"* ]]
}

@test "D04: reports no flight found for unknown destination" {
  run bash -c "printf '101 Delhi 50\n102 Mumbai 30\n103 Paris 20\n104 London 10\nTokyo\n' | $BIN/d04_flight_search.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"No flight to Tokyo found."* ]]
}

# ---------------------------------------------------------------------------
# D05 · Swap two integer arrays
# ---------------------------------------------------------------------------
@test "D05: swaps two arrays correctly" {
  run bash -c "printf '3\n1 2 3\n4 5 6\n' | $BIN/d05_swap_arrays.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"A: 4 5 6"* ]]
  [[ "$output" == *"B: 1 2 3"* ]]
}

@test "D05: swaps single-element arrays" {
  run bash -c "printf '1\n7\n9\n' | $BIN/d05_swap_arrays.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"A: 9"* ]]
  [[ "$output" == *"B: 7"* ]]
}

@test "D05: output confirms 'After swap' label is printed" {
  run bash -c "printf '2\n10 20\n30 40\n' | $BIN/d05_swap_arrays.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"After swap"* ]]
  [[ "$output" == *"A: 30 40"* ]]
  [[ "$output" == *"B: 10 20"* ]]
}

# ---------------------------------------------------------------------------
# D06 · Dynamic memory allocation — integer array
# ---------------------------------------------------------------------------
@test "D06: allocates, stores and displays array correctly" {
  run bash -c "printf '3\n10 20 30\n' | $BIN/d06_dynamic_array.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array: 10 20 30"* ]]
}

@test "D06: prints memory freed message after delete" {
  run bash -c "printf '2\n5 15\n' | $BIN/d06_dynamic_array.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Memory freed. arr ="* ]]
}

@test "D06: handles 5-element array" {
  run bash -c "printf '5\n1 2 3 4 5\n' | $BIN/d06_dynamic_array.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array: 1 2 3 4 5"* ]]
}

# ---------------------------------------------------------------------------
# D07 · String comparison (user-defined, no strcmp)
# ---------------------------------------------------------------------------
@test "D07: equal strings are reported as equal" {
  run bash -c "printf 'hello\nhello\n' | $BIN/d07_str_compare.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Strings are equal."* ]]
}

@test "D07: first string greater than second" {
  run bash -c "printf 'zebra\napple\n' | $BIN/d07_str_compare.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 1 is greater."* ]]
}

@test "D07: second string greater than first" {
  run bash -c "printf 'apple\nzebra\n' | $BIN/d07_str_compare.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 2 is greater."* ]]
}

@test "D07: longer string is greater when prefix matches" {
  run bash -c "printf 'abcd\nabc\n' | $BIN/d07_str_compare.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 1 is greater."* ]]
}

# ---------------------------------------------------------------------------
# D08 · String concatenation (no strcat)
# ---------------------------------------------------------------------------
@test "D08: concatenates Hello and World into HelloWorld" {
  run bash -c "printf 'Hello\nWorld\n' | $BIN/d08_str_concat.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Result: HelloWorld"* ]]
}

@test "D08: concatenates with empty-like short strings" {
  run bash -c "printf 'foo\nbar\n' | $BIN/d08_str_concat.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Result: foobar"* ]]
}

@test "D08: handles numeric string concatenation" {
  run bash -c "printf '123\n456\n' | $BIN/d08_str_concat.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Result: 123456"* ]]
}

# ---------------------------------------------------------------------------
# D09 · Student records — text file (fprintf/fscanf)
# ---------------------------------------------------------------------------
@test "D09: writes and reads back 2 students from text file" {
  run bash -c "printf '2\n1 Alice 88.50\n2 Bob 76.00\n' | $BIN/d09_text_file.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Alice"*     ]]
  [[ "$output" == *"88.50"*     ]]
  [[ "$output" == *"Bob"*       ]]
  [[ "$output" == *"76.00"*     ]]
}

@test "D09: header row (ID Name Marks) is printed" {
  run bash -c "printf '1\n10 Carol 95.00\n' | $BIN/d09_text_file.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"ID"*    ]]
  [[ "$output" == *"Name"*  ]]
  [[ "$output" == *"Marks"* ]]
}

@test "D09: single student record round-trips correctly" {
  run bash -c "printf '1\n5 Dave 55.00\n' | $BIN/d09_text_file.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Dave"*  ]]
  [[ "$output" == *"55.00"* ]]
}

# ---------------------------------------------------------------------------
# D10 · Student records — binary file (fwrite/fread)
# ---------------------------------------------------------------------------
@test "D10: writes and reads back 2 students from binary file" {
  run bash -c "printf '2\n1 Alice 88.50\n2 Bob 76.00\n' | $BIN/d10_binary_file.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Alice"* ]]
  [[ "$output" == *"88.50"* ]]
  [[ "$output" == *"Bob"*   ]]
  [[ "$output" == *"76.00"* ]]
}

@test "D10: single student binary round-trip" {
  run bash -c "printf '1\n7 Eve 99.00\n' | $BIN/d10_binary_file.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Eve"*   ]]
  [[ "$output" == *"99.00"* ]]
}

@test "D10: marks are printed with 2 decimal places" {
  run bash -c "printf '1\n3 Frank 72.50\n' | $BIN/d10_binary_file.exe"
  [ "$status" -eq 0 ]
  [[ "$output" == *"72.50"* ]]
}
