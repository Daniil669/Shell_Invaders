#!/bin/bash

#TODO
#2 Make ship to shoot; Make enemy disappear;
#3 Make enemy move from left to right and go down and then go from right to left do this until it hits the enemy or killed;
#4 Add score when enemy is hit;
#5 Make enemy to shoot; If starship is hit, decrease remaining lives;
#6 When no lives left, print GAME OVER!; When no enemies left, spawn them again at the top.


ascii_art=(" " "_" "_" "_" "_" "_" " " "_" " " " " " " " " " " " " " " " " " " " " "_" " " "_" " " " " " " "_" "_" "_" "_" "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "/" " " " " "_" "_" "_" "|" " " "|" " " " " " " " " " " " " " " " " "|" " " "|" " " "|" " " "|" "_" " " " " " " "_" "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "|" " " "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " "\\" " " "\`" "-" "-" "." "|" " " "|" "_" "_" " " " " " " "_" "_" "_" "|" " " "|" " " "|" " " " " " " "|" " " "|" " " "_" " " "_" "_" "_" "_" " " " " " " "_" "_" "_" "_" " " "_" " " " " "_" "_" "|" " " "|" " " "_" "_" "_" " " "_" " " "_" "_" " " "_" "_" "_" " " " " "\`" "-" "-" "." " " "\\" " " "'" "_" " " "\\" " " "/" " " "_" " " "\\" " " "|" " " "|" " " " " " " "|" " " "|" "|" " " "'" "_" " " "\\" " " "\\" " " "/" " " "/" " " "_" "\`" " " "|" "/" " " "_" "\`" " " "|" "/" " " "_" " " "\\" " " "'" "_" "_" "/" " " "_" "_" "|" "/" "\\" "_" "_" "/" " " "/" " " "|" " " "|" " " "|" " " " " "_" "_" "/" " " "|" " " "|" " " " " "_" "|" " " "|" "|" " " "|" " " "|" " " "\\" " " "V" " " "/" " " "(" "_" "|" " " "|" " " "(" "_" "|" " " "|" " " " " "_" "_" "/" " " "|" " " " " "\\" "_" "_" " " "\\" "\\" "_" "_" "_" "_" "/" "|" "_" "|" " " "|" "_" "|" "\\" "_" "_" "_" "|" "_" "|" "_" "|" " " " " "\\" "_" "_" "_" "/" "_" "|" " " "|" "_" "|" "\\" "_" "/" " " "\\" "_" "_" "," "_" "|" "\\" "_" "_" "," "_" "|" "\\" "_" "_" "_" "|" "_" "|" " " " " "|" "_" "_" "_" "/")

start_string=('p' 'r' 'e' 's' 's' ' ' 'S' ' ' 't' 'o' ' ' '[' 'S' 'T' 'A' 'R' 'T' ']')
ending_string=('p' 'r' 'e' 's' 's' ' ' 'F' ' ' 't' 'o' ' ' '[' 'F' 'I' 'N' 'I' 'S' 'H' ']')
score_string=('s' 'c' 'o' 'r' 'e' ':' ' ') #l=7
lives_string=('l' 'i' 'v' 'e' 's' ':' ' ') #l=7
shoot_string=('s' ' ' '-' ' ' 's' 'h' 'o' 'o' 't') #l=9
move_string=('j' ' ' '-' ' ' 'm' 'o' 'v' 'e' ' ' 'l' 'e' 'f' 't' ';' ' ' 'l' ' ' '-' ' ' 'm' 'o' 'v' 'e' ' ' 'r' 'i' 'g' 'h' 't') #l=28

lives=3
score=0

art_char_index=0
start_string_index=0
ending_string_index=0
score_string_index=0
lives_string_index=0
shoot_string_index=0
move_string_index=0

ship_position=32 #3<=sp<=67
enemies_i_position=(14 15 16) #rows
enemies_j_position=(3 6 9 12 15) #colmns
enemies_i_position_index=0
enemies_j_position_index=0

are_going_right=true
are_going_left=false

score_length=0

draw_home_screen() {
    art_char_index=0
    start_string_index=0
    ending_string_index=0
    for i in {1..36}; do
        for j in {1..69}; do
            if [ $i -eq 1 ] || [ $i -eq 36 ]; then
                echo -n "*"
            elif [ $j -eq 1 ] || [ $j -eq 69 ]; then
                echo -n "*"
            elif [ $i -ge 15 ] && [ $i -le 20 ] && [ $j -ge 3 ] && [ $j -le 67 ]; then
                echo -n "${ascii_art[$art_char_index]}"
                ((art_char_index++))
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
lives=3
score=0

art_char_index=0
start_string_index=0
ending_string_index=0
score_string_index=0
lives_string_index=0
shoot_string_index=0
move_string_index=0

ship_position=32 #3<=sp<=67
enemies_i_position=(14 15 16) #rows
enemies_j_position=(3 6 9 12 15) #colmns
enemies_i_position_index=0
enemies_j_position_index=0

are_going_right=true
are_going_left=false

score_length=0
    while true; do
        tput clear
        for i in {1..36}; do
        score_string_index=0
        lives_string_index=0
        move_string_index=0
        shoot_string_index=0
        enemies_j_position_index=0
            if [ $score -gt 9 ] && [ $score -lt 100 ]; then
                score_length=2
            elif [ $score -gt 99 ] && [ $score -le 999 ]; then
                score_length=3
            else
                score_length=1
            fi
            for j in {1..69}; do
                if [ $i -eq 1 ] || [ $i -eq 36 ]; then
                    echo -n "*"
                elif [ $i -eq 3 ] && [ $j -ge 3 ] && [ $j -le $((9 + $score_length)) ]; then
                    if [ $score_string_index -eq 8 ]; then
                        continue
                    fi
                    if [ $score_string_index -eq 7 ]; then
                        echo -n "$score"
                        ((score_string_index++))
                        continue
                    fi
                    echo -n "${score_string[$score_string_index]}"
                    ((score_string_index++))
                elif [ $i -eq 3 ] && [ $j -ge 60 ] && [ $j -le 67 ]; then
                    if [ $lives_string_index -eq 7 ]; then
                        echo -n "$lives"
                        continue
                    fi
                    echo -n "${lives_string[$lives_string_index]}"
                    ((lives_string_index++))
                elif [ $i -eq 5 ] ||  [ $i -eq 32 ] && [ $j -ge 3 ] && [ $j -le 67 ]; then
                    echo -n "-"
                elif [ $i -eq 34 ] && [ $j -ge 3 ] && [ $j -le 11 ]; then
                    echo -n "${shoot_string[$shoot_string_index]}"
                    ((shoot_string_index++))
                elif [ $i -eq 34 ] && [ $j -ge 40 ] && [ $j -le 67 ]; then
                    echo -n "${move_string[$move_string_index]}"
                    ((move_string_index++))
                elif [ $i -eq 30 ] && [ $j -eq $ship_position ]; then
                    echo -n "A"
                elif [ $i -eq ${enemies_i_position[$enemies_i_position_index]} ] && [ $j -eq ${enemies_j_position[$enemies_j_position_index]} ]; then
                    echo -n "W"
                    if [ $enemies_j_position_index -eq 4 ] && [ $enemies_i_position_index -lt 2 ]; then
                        ((enemies_i_position_index++))
                    fi
                    if [ $enemies_j_position_index -lt 4 ]; then
                        ((enemies_j_position_index++))
                    fi
                elif [ $j -eq 1 ] || [ $j -eq 69 ]; then
                    echo -n "*"
                else
                    echo -n " "
                fi
            done
        echo ""
        done
        if $are_going_left; then
            ((enemies_j_position[0]--))
            ((enemies_j_position[1]--))
            ((enemies_j_position[2]--))
            ((enemies_j_position[3]--))
            ((enemies_j_position[4]--))
        elif $are_going_right; then
            ((enemies_j_position[0]++))
            ((enemies_j_position[1]++))
            ((enemies_j_position[2]++))
            ((enemies_j_position[3]++))
            ((enemies_j_position[4]++))
        fi
        if [ ${enemies_j_position[4]} -eq 67 ]; then
            ((enemies_i_position[0]++))
            ((enemies_i_position[1]++))
            ((enemies_i_position[2]++))
            are_going_right=false
            are_going_left=true
        elif [ ${enemies_j_position[0]} -eq 3 ]; then
            ((enemies_i_position[0]++))
            ((enemies_i_position[1]++))
            ((enemies_i_position[2]++))
            are_going_right=true
            are_going_left=false
        fi
        enemies_i_position_index=0
        read -n 1 -s -t 1 action
        if [[ "$action" == "s" ]] || [[ "$action" == "S" ]]; then
            echo "Shoot"
        elif [[ "$action" == "j" ]] || [[ "$action" == "J" ]]; then
            if [ $ship_position -gt 3 ]; then
                ((ship_position--))
            fi
        elif [[ "$action" == "l" ]] || [[ "$action" = "L" ]]; then
            if [ $ship_position -lt 67 ]; then
                ((ship_position++))
            fi
        elif [[ "$action" == "f" ]] || [[ "$action" == "F" ]]; then
            echo "Game Over!"
            break
        else
        continue
        fi
    done
}

main() {
    tput setaf 2
    while true; do
        tput clear
        draw_home_screen
        read -n 1 -s key
        if [[ "$key" == "s" ]] || [[ "$key" == "S" ]]; then
            game
            continue
        elif [[ "$key" == "F" ]] || [[ "$key" == "f" ]]; then
            tput clear
            echo "YOU SHALL NOT BE INVADED!"
            break
        fi
    done
    tput sgr0
}

main
