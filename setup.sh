#!/bin/bash


OPTION=""
ALIAS_FLAG=0
LINK_FLAG=0


check_alias_link() {
    # check alias 
    if grep -q 'shellinvaders' ~/.bashrc; then
        ALIAS_FLAG=1
    fi

    # check link
    if [ -L /usr/local/bin/shellinvaders ]; then
        LINK_FLAG=1
    fi
}


# check for a cli option
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --alias)
            check_alias_link
            if [ $ALIAS_FLAG -eq 1 ]; then
                echo "there is already alias"
            elif [ $LINK_FLAG -eq 1 ]; then
                echo "there is already link"
            else
                OPTION=$1
            fi
            break
            ;;
        --link)
            check_alias_link
            if [ $ALIAS_FLAG -eq 1 ]; then
                echo "there is already alias"
            elif [ $LINK_FLAG -eq 1 ]; then
                echo "there is already link"
            else
                OPTION=$1
            fi
            break
            ;;
        --uninstall)
            check_alias_link
            if [ $ALIAS_FLAG -eq 1 ]; then
                OPTION="--uninstall_alias"
            elif [ $LINK_FLAG -eq 1 ]; then
                OPTION="--uninstall_link"
            else
                echo "There is neither link nor alias"
            fi
            break
            ;;
        -h|--help)
            echo "./setup.sh --<option>"
            echo "you can create either alias or link"
            echo "--alias - creates alias for shell_invaders.sh in .bashrc"
            echo "--link - creates a soft link in /usr/local/bin/ (use sudo)"
            echo "--uninstall - removes either alias or link (use sudo if link)"
            OPTION="--help"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
        esac
done


if [[ "$OPTION" == "--alias" ]]; then
    echo alias shellinvaders=$PWD/shell_invaders.sh >> ~/.bashrc && source ~/.bashrc
    echo "Alias created at .bashrc"
    echo "To play just type shellinvaders"
    echo "Restart your terminal"
elif [[ "$OPTION" == "--link" ]]; then
    if ln -s $PWD/shell_invaders.sh /usr/local/bin/shellinvaders; then
        echo "Link created at /usr/local/bin/"
        echo "To play just type shellinvaders"
        echo "Restart your terminal"
    else
        echo "For the link use sudo"
    fi
elif [[ "$OPTION" == "--uninstall_alias" ]]; then
    sed -i '/shellinvaders/d' ~/.bashrc && source ~/.bashrc
    echo "Alias removed"
    echo "Restart your terminal"
elif [[ "$OPTION" == "--uninstall_link" ]]; then
    if rm /usr/local/bin/shellinvaders; then
        echo "Link removed"
        echo "Restart your terminal"
    else
        echo "For the link use sudo"
    fi
else 
    echo "./setup.sh --help"
fi