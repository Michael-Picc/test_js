#!/bin/bash

echo "This is a test" >> output.txt
cat success.js | grep Assert >> output.txt

# Define an assert function
assert() {
  local condition="$1"
  local message="$2"
  local log_file="$3"
  
  if ! eval "$condition"; then
    echo "Assertion failed: $message" >> output.txt
    exit 1
  fi
}
#function to test
add() {
  local a="$1"
  local b="$2"
  echo $((a + b))
}

result=$(add 2 3)
assert "[ \"$result\" -eq 5 ]" "Expected add(2, 3) to equal 5, but got $result"

result=$(add 0 0)
assert "[ \"$result\" -eq 0 ]" "Expected add(0, 0) to equal 0, but got $result"

result=$(add -1 1)
assert "[ \"$result\" -eq 0 ]" "Expected add(-1, 1) to equal 0, but got $result"

