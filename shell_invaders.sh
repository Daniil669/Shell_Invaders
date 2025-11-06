#!/bin/bash

# set global variables
ascii_art=(" " "_" "_" "_" "_" "_" " " "_" " " " " " " " " " " " " " " " " " " " " "_" " " "_" " " " " " " "_" "_" "_" "_" "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "/" " " " " "_" "_" "_" "|" " " "|" " " " " " " " " " " " " " " " " "|" " " "|" " " "|" " " "|" "_" " " " " " " "_" "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "|" " " "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " "\\" " " "\`" "-" "-" "." "|" " " "|" "_" "_" " " " " " " "_" "_" "_" "|" " " "|" " " "|" " " " " " " "|" " " "|" " " "_" " " "_" "_" "_" "_" " " " " " " "_" "_" "_" "_" " " "_" " " " " "_" "_" "|" " " "|" " " "_" "_" "_" " " "_" " " "_" "_" " " "_" "_" "_" " " " " "\`" "-" "-" "." " " "\\" " " "'" "_" " " "\\" " " "/" " " "_" " " "\\" " " "|" " " "|" " " " " " " "|" " " "|" "|" " " "'" "_" " " "\\" " " "\\" " " "/" " " "/" " " "_" "\`" " " "|" "/" " " "_" "\`" " " "|" "/" " " "_" " " "\\" " " "'" "_" "_" "/" " " "_" "_" "|" "/" "\\" "_" "_" "/" " " "/" " " "|" " " "|" " " "|" " " " " "_" "_" "/" " " "|" " " "|" " " " " "_" "|" " " "|" "|" " " "|" " " "|" " " "\\" " " "V" " " "/" " " "(" "_" "|" " " "|" " " "(" "_" "|" " " "|" " " " " "_" "_" "/" " " "|" " " " " "\\" "_" "_" " " "\\" "\\" "_" "_" "_" "_" "/" "|" "_" "|" " " "|" "_" "|" "\\" "_" "_" "_" "|" "_" "|" "_" "|" " " " " "\\" "_" "_" "_" "/" "_" "|" " " "|" "_" "|" "\\" "_" "/" " " "\\" "_" "_" "," "_" "|" "\\" "_" "_" "," "_" "|" "\\" "_" "_" "_" "|" "_" "|" " " " " "|" "_" "_" "_" "/")
ascii_art2=(" " "_" "_" "_" "_" "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "_" "_" "_" "_" "_" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "|" " " " " "_" "_" " " "\\" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "|" " " " " "_" " " " " "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "|" " " "|" " " " " "\\" "/" " " "_" "_" " " "_" " " "_" " " "_" "_" " " "_" "_" "_" " " " " " " "_" "_" "_" " " " " "|" " " "|" " " "|" " " "|" "_" " " " " " " "_" "_" "_" "_" "_" " " "_" " " "_" "_" " " "|" " " "|" " " "_" "_" " " "/" " " "_" "\`" " " "|" " " "'" "_" " " "\`" " " "_" " " "\\" " " "/" " " "_" " " "\\" " " "|" " " "|" " " "|" " " "\\" " " "\\" " " "/" " " "/" " " "_" " " "\\" " " "'" "_" "_" "|" "|" " " "|" "_" "\\" " " "\\" " " "(" "_" "|" " " "|" " " "|" " " "|" " " "|" " " "|" " " "|" " " " " "_" "_" "/" " " "\\" " " "\\" "_" "/" " " "/" "\\" " " "V" " " "/" " " " " "_" "_" "/" " " "|" " " " " " " " " "\\" "_" "_" "_" "_" "/" "\\" "_" "_" "," "_" "|" "_" "|" " " "|" "_" "|" " " "|" "_" "|" "\\" "_" "_" "_" "|" " " " " "\\" "_" "_" "_" "/" " " " " "\\" "_" "/" " " "\\" "_" "_" "_" "|" "_" "|" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " ")

start_string=('p' 'r' 'e' 's' 's' ' ' 'S' ' ' 't' 'o' ' ' '[' 'S' 'T' 'A' 'R' 'T' ']')
ending_string=('p' 'r' 'e' 's' 's' ' ' 'F' ' ' 't' 'o' ' ' '[' 'F' 'I' 'N' 'I' 'S' 'H' ']')
score_string=('s' 'c' 'o' 'r' 'e' ':' ' ') #l=7
lives_string=('l' 'i' 'v' 'e' 's' ':' ' ') #l=7
shoot_string=('s' ' ' '-' ' ' 's' 'h' 'o' 'o' 't' ';' ' ' 'f' ' ' '-' ' ' 'f' 'i' 'n' 'i' 's' 'h') #l=9 l=21
move_string=('j' ' ' '-' ' ' 'm' 'o' 'v' 'e' ' ' 'l' 'e' 'f' 't' ';' ' ' 'l' ' ' '-' ' ' 'm' 'o' 'v' 'e' ' ' 'r' 'i' 'g' 'h' 't') #l=28

lives=1
enemies_count=15
score=0

art_char_index=0
art2_char_index=0
start_string_index=0
ending_string_index=0
score_string_index=0
lives_string_index=0
shoot_string_index=0
move_string_index=0

ship_position=32 #3<=sp<=67
ships_bullet=(0 28 0) #j, i, flag 0/1 is active

enemies_i_position=(7 8 9) #rows
enemies_j_position=(3 6 9 12 15) #colmns
are_enemies_alive=(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1) # 1 - alive; 0 - dead; first 5 top row, second 5 middle row, last 5 bottom
#are_enemies_alive=(30 30 30 30 30) # 30 - alive bottom, 20 - alive middle, 10 - alive top, 0 - no enemies in column
# hit_level=2
enemies_i_position_index=0
enemies_j_position_index=0
enemies_alive_index=0

are_going_right=true
are_going_left=false

score_length=0
exit_code=0

game_over=false


reset_enemies() {
    enemies_count=15
    enemies_i_position=(7 8 9) #rows
    enemies_j_position=(3 6 9 12 15) #colmns
    are_enemies_alive=(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1) # 1 - alive; 0 - dead; first 5 top row, second 5 middle row, last 5 bottom
    enemies_i_position_index=0
    enemies_j_position_index=0
    enemies_alive_index=0

    are_going_right=true
    are_going_left=false
}


reset_indexes() {
    score_string_index=0
    lives_string_index=0
    move_string_index=0
    shoot_string_index=0
}


reset_info_art() {
    art_char_index=0
    start_string_index=0
    ending_string_index=0
}


reset_states() {

    lives=1
    score=0

    reset_info_art

    reset_indexes

    ship_position=32 #3<=sp<=67
    ships_bullet=(0 28 0) #j, i, flag 0/1 is active

    reset_enemies

    score_length=0
    exit_code=0

    game_over=false
}


draw_game_over_screen() {

    tput clear
# rest values 
    art2_char_index=0

    # rows
    for i in {1..36}; do

        # columns
        for j in {1..69}; do

            # top and bottom border of screen
            if [ $i -eq 1 ] || [ $i -eq 36 ]; then
                echo -n "*"
            elif [ $j -eq 1 ] || [ $j -eq 69 ]; then
                echo -n "*"
            # ascii art game over
            elif [ $i -ge 15 ] && [ $i -le 20 ] && [ $j -ge 11 ] && [ $j -le 61 ]; then
                echo -n "${ascii_art2[$art2_char_index]}"
                ((art2_char_index++))
            else
                echo -n " "
            fi
        done
        echo ""
    done
}


draw_home_screen() {

    tput clear

    # rest values 
    reset_info_art

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


render_game() {
tput clear

    # row loop
    for i in {1..36}; do

    # rest index variables
    reset_indexes
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
            elif [ $i -eq 29 ] && [ $j -eq $ship_position ]; then
                echo -n "A"
            # draw enemies
            elif [ $i -eq ${enemies_i_position[$enemies_i_position_index]} ] && [ $j -eq ${enemies_j_position[$enemies_j_position_index]} ]; then

                if [ ${are_enemies_alive[$enemies_alive_index]} -eq 1 ]; then
                    echo -n "W"
                else
                    echo -n " "
                fi

                # increase indexies for rows, columns, alive_state
                if [ $enemies_j_position_index -eq 4 ] && [ $enemies_i_position_index -lt 2 ]; then
                    ((enemies_i_position_index++))
                fi
                if [ $enemies_j_position_index -lt 4 ]; then
                    ((enemies_j_position_index++))
                fi
                if [ $enemies_alive_index -lt 14 ]; then
                    ((enemies_alive_index++))
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
}


bullet_update() {
    case "$1" in
        "reset")
                ships_bullet[0]=0
                ships_bullet[1]=29
                ships_bullet[2]=0
        ;;
        "move")
            if [ ${ships_bullet[2]} -eq 1 ]; then
                ((ships_bullet[1]-=1))
            fi
        ;;
    esac

}


collision_detection() {
    # bullet collision with enemies
    for hit_level in {2..0}; do

        local increment=0
        local is_hit=false

        if [ ${ships_bullet[1]} -eq ${enemies_i_position[$hit_level]} ]; then
            if [ $hit_level -eq 2 ]; then
                increment=10
            elif [ $hit_level -eq 1 ]; then
                increment=5
            fi
                
            for ejpindx in {0..4}; do

                local eai=$(($ejpindx+$increment))

                if [ ${ships_bullet[0]} -eq ${enemies_j_position[$ejpindx]} ] && [ ${are_enemies_alive[$eai]} -eq 1 ]; then
                    bullet_update "reset"
                    are_enemies_alive[$eai]=0
                    is_hit=true
                    ((enemies_count-=1))
                    ((score+=10))
                    if [ $score -gt 999 ]; then
                        score=999
                    fi
                    break
                fi
            done
            if $is_hit; then
                break
            fi
        fi
    done

    # bullet collision with top border of game field
    if [ ${ships_bullet[1]} -le 6 ]; then
        bullet_update "reset"
    fi

    # enemies collision with the spaceship
    if [ ${enemies_i_position[2]} -ge 29 ]; then
        for eali in {0..14}; do
            if [ ${are_enemies_alive[$eali]} -eq 1 ]; then
                if [ $eali -ge 10 ]; then
                    if [ ${enemies_i_position[2]} -eq 29 ]; then
                        game_over=true
                        break
                    fi
                elif [ $eali -ge 5 ]; then
                    if [ ${enemies_i_position[1]} -eq 29 ]; then
                        game_over=true
                        break
                    fi
                else
                    if [ ${enemies_i_position[0]} -eq 29 ]; then
                        game_over=true
                        break
                    fi
                fi
            fi
        done
    fi
}


update_enemies_row() {
    ((enemies_i_position[0]++))
    ((enemies_i_position[1]++))
    ((enemies_i_position[2]++))
}


enemies_movements() {
    # make enemies move left
    local movement_speed=1
    if [ ${enemies_i_position[2]} -ge 12 ]; then
        movement_speed=2
    fi
    if $are_going_left; then
        for jp in {0..4}; do
        ((enemies_j_position[$jp]-=$movement_speed))
        done
    # make enemies move right
    elif $are_going_right; then
        for jp in {0..4}; do
        ((enemies_j_position[$jp]+=$movement_speed))
        done
    fi

    # make enemies move down when hit right or left border
    if [ ${enemies_j_position[4]} -ge 67 ]; then
        update_enemies_row
        are_going_right=false
        are_going_left=true
    elif [ ${enemies_j_position[0]} -le 3 ]; then
        update_enemies_row
        are_going_right=true
        are_going_left=false
    fi
    
}

new_level() {
# reset enemies if all were killed
    if [ $enemies_count -eq 0 ]; then
        ((score+=100))
        reset_enemies
    fi
}

read_input() {
# read input
    read -n 1 -s -t 0.7 action

    # validate input
    if [[ "$action" == "s" ]] || [[ "$action" == "S" ]] && [ ${ships_bullet[2]} -eq 0 ]; then
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
        exit_code=1
    fi
}


game() {
# reset necessary variables before game loop
reset_states

# game loop
    while true; do
        #draw game field
        render_game

        # check collisions
        collision_detection
        
        # rest enemies when all are dead
        new_level

        # update nemeies positions
        enemies_movements

        # update position of bullet
        bullet_update "move"

        enemies_i_position_index=0
        enemies_alive_index=0

        if $game_over; then
            draw_game_over_screen
            break
        fi

        read_input

        if [ $exit_code -eq 0 ]; then
            continue
        else
            break
        fi
    done
}


main() {
    # set font color green
    tput setaf 2
    tput clear

    while true; do

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
