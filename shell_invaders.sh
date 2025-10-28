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

start_string=('p' 'r' 'e' 's' 's' ' ' 'S' 'P' 'A' 'C' 'E' ' ' 't' 'o' ' ' '[' 'S' 'T' 'A' 'R' 'T' ']')


lives=3
enemies=1
score=0

art_char_index=0
start_string_index=0

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
elif [ $i -eq 29 ] && [ $j -ge 22 ] && [ $j -le 43 ]; then
echo -n "${start_string[$start_string_index]}"
((start_string_index++))
else
echo -n " "
fi
done
echo ""
done
}

game() {
echo -n "Game"
}

main() {
tput setaf 2
draw_home_screen
game
tput sgr0
}

main
