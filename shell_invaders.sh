#!/bin/bash

#TODO
#0 Make home screen with ASCII Shell Invaders, press "Space" to start; make game field, display score, lives;
#1 Show ship; Make it move and update screen;
#2 Show enemy; Make ship to shoot; Make enemy disappear;
#3 Make enemy move from left to right and go down and then go from right to left do this until it hits the enemy or killed;
#4 Make multiple enemies; Add score when enemy is hit;
#5 Make enemy to shoot; If starship is hit, decrease remaining lives;
#6 When no lives left, print GAME OVER!; When no enemies left, spawn them again at the top.

#shell invaders like space invaders but in shell
game_name="Shell Invaders"

ascii_art=(" " "_" "_" "_" "_" "_" " " "_" " " " " " " " " " " " " " " " " " " " " "_" " " "_" " " " " " " "_" "_" "_" "_" "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "/" " " " " "_" "_" "_" "|" " " "|" " " " " " " " " " " " " " " " " "|" " " "|" " " "|" " " "|" "_" " " " " " " "_" "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "|" " " "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " "\\" " " "\`" "-" "-" "." "|" " " "|" "_" "_" " " " " " " "_" "_" "_" "|" " " "|" " " "|" " " " " " " "|" " " "|" " " "_" " " "_" "_" "_" "_" " " " " " " "_" "_" "_" "_" " " "_" " " " " "_" "_" "|" " " "|" " " "_" "_" "_" " " "_" " " "_" "_" " " "_" "_" "_" " " " " "\`" "-" "-" "." " " "\\" " " "'" "_" " " "\\" " " "/" " " "_" " " "\\" " " "|" " " "|" " " " " " " "|" " " "|" "|" " " "'" "_" " " "\\" " " "\\" " " "/" " " "/" " " "_" "\`" " " "|" "/" " " "_" "\`" " " "|" "/" " " "_" " " "\\" " " "'" "_" "_" "/" " " "_" "_" "|" "/" "\\" "_" "_" "/" " " "/" " " "|" " " "|" " " "|" " " " " "_" "_" "/" " " "|" " " "|" " " " " "_" "|" " " "|" "|" " " "|" " " "|" " " "\\" " " "V" " " "/" " " "(" "_" "|" " " "|" " " "(" "_" "|" " " "|" " " " " "_" "_" "/" " " "|" " " " " "\\" "_" "_" " " "\\" "\\" "_" "_" "_" "_" "/" "|" "_" "|" " " "|" "_" "|" "\\" "_" "_" "_" "|" "_" "|" "_" "|" " " " " "\\" "_" "_" "_" "/" "_" "|" " " "|" "_" "|" "\\" "_" "/" " " "\\" "_" "_" "," "_" "|" "\\" "_" "_" "," "_" "|" "\\" "_" "_" "_" "|" "_" "|" " " " " "|" "_" "_" "_" "/")

start_string=('p' 'r' 'e' 's' 's' ' ' 'S' ' ' 't' 'o' ' ' '[' 'S' 'T' 'A' 'R' 'T' ']')
ending_string=('p' 'r' 'e' 's' 's' ' ' 'F' ' ' 't' 'o' ' ' '[' 'F' 'I' 'N' 'I' 'S' 'H' ']')
score_string=('s' 'c' 'o' 'r' 'e' ':' ' ')
lives_string=('l' 'i' 'v' 'e' 's' ':' ' ')


lives=3
enemies=1
score=0

art_char_index=0
start_string_index=0
ending_string_index=0
score_string_index=0
lives_string_index=0
score_length=1

draw_home_screen() {
for i in {1..36}; do
for j in {1..69}; do
if [ $i -eq 1 ] || [ $i -eq 36 ]; then
echo -n "*"
elif [ $j -eq 1 ] || [ $j -eq 69 ]; then
echo -n "*"
elif [ $i -ge 15 ] && [ $i -le 20 ] && [ $j -ge 3 ] && [ $j -le 67 ]; then
echo -n "${ascii_art[$char_index]}"
((char_index++))
elif [ $i -eq 29 ] && [ $j -ge 25 ] && [ $j -le 42 ]; then
echo -n "${start_string[$start_string_index]}"
((start_string_index++))
elif [ $i -eq 32 ] && [ $j -ge 25 ] && [ $j -le 43 ]; then
echo -n "${ending_string[$ending_string_index]}"
((ending_string_index++))
else
echo -n " "
fi
done
echo ""
done
}

game() {
for i in {1..36}; do
score_string_index=0
lives_string_index=0
for j in {1..69}; do
if [ $i -eq 1 ] || [ $i -eq 36 ]; then
echo -n "*"
elif [ $i -eq 3 ] && [ $j -ge 3 ] && [ $j -le ((9 + $score_length)) ]; then
echo -n "${score_string[$score_string_index]}"
(($score_string_index++))
elif [ $i -eq 5 ] && ||  [ $i -eq 32 ] && [ $j -ge 3 ] && [ $j -le 67 ]; then
echo -n "-"
elif [ $j -eq 1 ] || [ $j -eq 69 ]; then
echo -n "*"
else
echo -n " "
fi
done
echo ""
done
}

main() {
tput setaf 2
draw_home_screen
while true; do
read -n 1 -s key
if [[ "$key" == "s" ]] || [[ "$key" == "S" ]]; then
game
break
elif [[ "$key" == "F" ]] || [[ "$key" == "f" ]]; then
echo "Bye!"
break
fi
done
tput sgr0
}

main
