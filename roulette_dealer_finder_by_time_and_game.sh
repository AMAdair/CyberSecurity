#! bin/bash

read -p "Date (MMDD) " Date
read -p "TIME (XX:00:00) " TIME
read -p "AM/PM " AP

echo
echo "Date : $Date "
echo "TIME : $TIME "
echo "AM/PM : $AP "
echo

grep "$TIME" "$Date"_Dealer_schedule | grep -iw "$AP" | awk '{print "BlackJack",$1,$2,$3,$4}'

grep "$TIME" "$Date"_Dealer_schedule | grep -iw "$AP"| awk '{print "Roulette",$1,$2,$5,$6}'

grep "$TIME" "$Date"_Dealer_schedule | grep -iw "$AP"| awk '{print "Texas",$1,$2,$7,$8}'

