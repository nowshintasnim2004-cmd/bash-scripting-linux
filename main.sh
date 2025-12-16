#!/bin/bash

check_prime() {
  local n=$1
  (( n <= 1 )) && { echo "Not Prime"; return; }

  for ((i=2; i*i<=n; i++)); do
    (( n % i == 0 )) && { echo "Not Prime"; return; }
  done
  echo "Prime"
}

check_leap() {
  local y=$1
  (( y%400==0 || (y%4==0 && y%100!=0) )) \
    && echo "Leap Year" || echo "Not Leap Year"
}

sum_series() {
  local n=$1 sum=0
  for ((i=1;i<=n;i++)); do
    ((sum+=i))
  done
  echo "Sum = $sum"
}

read -p "Enter a number: " num

while true; do
  echo "1. Prime Check"
  echo "2. Leap Year Check"
  echo "3. Sum of Series"
  echo "4. Exit"
  read -p "Choice: " ch

  case $ch in
    1) check_prime "$num" ;;
    2) check_leap "$num" ;;
    3) sum_series "$num" ;;
    4) exit ;;
 *)
echo "Invalid choice" ;;
  esac
done
