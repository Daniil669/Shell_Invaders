#!/bin/bash

#TODO
#2 Make enemy disappear; Set limits on bullets; 
#3 Make enemy move from left to right and go down and then go from right to left do this until it hits the enemy or killed;
#5 Make enemy to shoot; If starship is hit, decrease remaining lives;
#6 When no lives left, print GAME OVER!; When no enemies left, spawn them again at the top.


# set variables and necessary stuff
ascii_art=(" " "_" "_" "_" "_" "_" " " "_" " " " " " " " " " " " " " " " " " " " " "_" " " "_" " " " " " " "_" "_" "_" "_" "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "/" " " " " "_" "_" "_" "|" " " "|" " " " " " " " " " " " " " " " " "|" " " "|" " " "|" " " "|" "_" " " " " " " "_" "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "|" " " "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " "\\" " " "\`" "-" "-" "." "|" " " "|" "_" "_" " " " " " " "_" "_" "_" "|" " " "|" " " "|" " " " " " " "|" " " "|" " " "_" " " "_" "_" "_" "_" " " " " " " "_" "_" "_" "_" " " "_" " " " " "_" "_" "|" " " "|" " " "_" "_" "_" " " "_" " " "_" "_" " " "_" "_" "_" " " " " "\`" "-" "-" "." " " "\\" " " "'" "_" " " "\\" " " "/" " " "_" " " "\\" " " "|" " " "|" " " " " " " "|" " " "|" "|" " " "'" "_" " " "\\" " " "\\" " " "/" " " "/" " " "_" "\`" " " "|" "/" " " "_" "\`" " " "|" "/" " " "_" " " "\\" " " "'" "_" "_" "/" " " "_" "_" "|" "/" "\\" "_" "_" "/" " " "/" " " "|" " " "|" " " "|" " " " " "_" "_" "/" " " "|" " " "|" " " " " "_" "|" " " "|" "|" " " "|" " " "|" " " "\\" " " "V" " " "/" " " "(" "_" "|" " " "|" " " "(" "_" "|" " " "|" " " " " "_" "_" "/" " " "|" " " " " "\\" "_" "_" " " "\\" "\\" "_" "_" "_" "_" "/" "|" "_" "|" " " "|" "_" "|" "\\" "_" "_" "_" "|" "_" "|" "_" "|" " " " " "\\" "_" "_" "_" "/" "_" "|" " " "|" "_" "|" "\\" "_" "/" " " "\\" "_" "_" "," "_" "|" "\\" "_" "_" "," "_" "|" "\\" "_" "_" "_" "|" "_" "|" " " " " "|" "_" "_" "_" "/")

start_string=('p' 'r' 'e' 's' 's' ' ' 'S' ' ' 't' 'o' ' ' '[' 'S' 'T' 'A' 'R' 'T' ']')
ending_string=('p' 'r' 'e' 's' 's' ' ' 'F' ' ' 't' 'o' ' ' '[' 'F' 'I' 'N' 'I' 'S' 'H' ']')
score_string=('s' 'c' 'o' 'r' 'e' ':' ' ') #l=7
lives_string=('l' 'i' 'v' 'e' 's' ':' ' ') #l=7
shoot_string=('s' ' ' '-' ' ' 's' 'h' 'o' 'o' 't' ';' ' ' 'f' ' ' '-' ' ' 'f' 'i' 'n' 'i' 's' 'h') #l=9 l=21
move_string=('j' ' ' '-' ' ' 'm' 'o' 'v' 'e' ' ' 'l' 'e' 'f' 't' ';' ' ' 'l' ' ' '-' ' ' 'm' 'o' 'v' 'e' ' ' 'r' 'i' 'g' 'h' 't') #l=28

lives=3
enemies_count=15
score=0

art_char_index=0
start_string_index=0
ending_string_index=0
score_string_index=0
lives_string_index=0
shoot_string_index=0
move_string_index=0

ship_position=32 #3<=sp<=67
ships_bullet=(0 29 0) #j, i, flag 0/1 is active

enemies_i_position=(14 15 16) #rows
enemies_j_position=(3 6 9 12 15) #colmns
are_enemies_alive=(1 1 1 1 1) # 1 - alive; 0 - dead
hit_leve=2
enemies_i_position_index=0
enemies_j_position_index=0

are_going_right=true
are_going_left=false

score_length=0

draw_home_screen() {
    # rest values 
    art_char_index=0
    start_string_index=0
    ending_string_index=0

    # rows
    for i in {1..36}; do

        # columns
        for j in {1..69}; do

            # top and bottom border of screen
            if [ $i -eq 1 ] || [ $i -eq 36 ]; then
                echo -n "*"
            elif [ $j -eq 1 ] || [ $j -eq 69 ]; then
                echo -n "*"
            # ascii art shell invaders
            elif [ $i -ge 15 ] && [ $i -le 20 ] && [ $j -ge 3 ] && [ $j -le 67 ]; then
                echo -n "${ascii_art[$art_char_index]}"
                ((art_char_index++))
            # instructions to start and finish
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
# reset necessary variables before game loop
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
ships_bullet=(0 29 0) #j, i, flag 0/1 is active

enemies_i_position=(14 15 16) #rows
enemies_j_position=(3 6 9 12 15) #colmns
are_enemies_alive=(1 1 1 1 1) # 1 - alive; 0 - dead
hit_level=2
enemies_i_position_index=0
enemies_j_position_index=0

are_going_right=true
are_going_left=false

score_length=0

# game loop
    while true; do

        tput clear

        # row loop
        for i in {1..36}; do

        # rest index variables
        score_string_index=0
        lives_string_index=0
        move_string_index=0
        shoot_string_index=0
        enemies_j_position_index=0

            # figure score length for later display
            if [ $score -gt 9 ] && [ $score -lt 100 ]; then
                score_length=2
            elif [ $score -gt 99 ] && [ $score -le 999 ]; then
                score_length=3
            else
                score_length=1
            fi

            # column loop
            for j in {1..69}; do

                # draw top and bottom borders of screen
                if [ $i -eq 1 ] || [ $i -eq 36 ]; then
                    echo -n "*"
                # draw score
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
                # draw lives
                elif [ $i -eq 3 ] && [ $j -ge 60 ] && [ $j -le 67 ]; then
                    if [ $lives_string_index -eq 7 ]; then
                        echo -n "$lives"
                        continue
                    fi
                    echo -n "${lives_string[$lives_string_index]}"
                    ((lives_string_index++))
                # draw line between lives/score section and game field
                elif [ $i -eq 5 ] ||  [ $i -eq 32 ] && [ $j -ge 3 ] && [ $j -le 67 ]; then
                    echo -n "-"
                # draw instructions at the bottom
                elif [ $i -eq 34 ] && [ $j -ge 3 ] && [ $j -le 23 ]; then
                    echo -n "${shoot_string[$shoot_string_index]}"
                    ((shoot_string_index++))
                elif [ $i -eq 34 ] && [ $j -ge 40 ] && [ $j -le 67 ]; then
                    echo -n "${move_string[$move_string_index]}"
                    ((move_string_index++))
                # draw character
                elif [ $i -eq 30 ] && [ $j -eq $ship_position ]; then
                    echo -n "A"
                # draw enemies
                elif [ $i -eq ${enemies_i_position[$enemies_i_position_index]} ] && [ $j -eq ${enemies_j_position[$enemies_j_position_index]} ] && [ ${are_enemies_alive[$enemies_j_position_index]} -eq 1 ]; then
                    echo -n "W"
                    if [ $enemies_j_position_index -eq 4 ] && [ $enemies_i_position_index -lt 2 ]; then
                        ((enemies_i_position_index++))
                    fi
                    if [ $enemies_j_position_index -lt 4 ]; then
                        ((enemies_j_position_index++))
                    fi
                # draw bullet
                elif [ ${ships_bullet[2]} -eq 1 ] && [ $i -eq ${ships_bullet[1]} ] && [ $j -eq ${ships_bullet[0]} ]; then
                    echo -n ":"
                # draw side borders of screen
                elif [ $j -eq 1 ] || [ $j -eq 69 ]; then
                    echo -n "*"
                else
                    echo -n " "
                fi
            done
        echo ""
        done
        # bullet collision with enemies
        if [ ${ships_bullet[1]} -eq ${enemies_i_position[$hit_leve]} ]; then
            for ejpindx in {0..4}; do
                if [ ${ships_bullet[0]} -eq ${enemies_j_position[$ejpindx]} ] && [ ${are_enemies_alive[$ejpindx]} -eq 1 ]; then
                    ships_bullet[0]=0
                    ships_bullet[1]=29
                    ships_bullet[2]=0
                    are_enemies_alive[$ejpindx]=0
                    ((score+=10))
                    if [ $score -gt 999 ]; then
                        score=999
                    fi
                fi
            done
        # bullet collision with top border of game field
        elif [ ${ships_bullet[1]} -le 6 ]; then
            ships_bullet[0]=0
            ships_bullet[1]=29
            ships_bullet[2]=0
        fi
        # make enemies move left
        if $are_going_left; then
            ((enemies_j_position[0]--))
            ((enemies_j_position[1]--))
            ((enemies_j_position[2]--))
            ((enemies_j_position[3]--))
            ((enemies_j_position[4]--))
        # make enemies move right
        elif $are_going_right; then
            ((enemies_j_position[0]++))
            ((enemies_j_position[1]++))
            ((enemies_j_position[2]++))
            ((enemies_j_position[3]++))
            ((enemies_j_position[4]++))
        fi
        # make enemies move down when hit right or left border
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
        # update position of bullet
        if [ ${ships_bullet[2]} -eq 1 ]; then
            ((ships_bullet[1]-=2))
        fi

        enemies_i_position_index=0

        # read input
        read -n 1 -s -t 1 action
        # validate input
        if [[ "$action" == "s" ]] || [[ "$action" == "S" ]]; then
            ships_bullet[0]=$ship_position
            ships_bullet[2]=1
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
    # set font color green
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
    # reset font color to default
    tput sgr0
}

main
