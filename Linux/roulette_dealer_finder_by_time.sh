#! bin/bash
read -p "Enter Date (MMDD) " Date
read -p "Time (XX:00:00) " Time

echo
echo "Date : $Date "
echo "Time : $Time "
echo

cat "$Date"_Dealer_schedule | awk -F" " '{print $1,$2,$5,$6}' | grep "$Time" 


