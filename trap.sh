#!/bin/bash
set -Ceuo pipefail

# https://shellscript.sunone.me/signal_and_trap.html

function on_exit() {
    echo "ON EXIT"
}

function on_hup() {
    echo "ON HUP"
}

function on_int() {
    echo "ON INT"
}

function on_quit() {
    echo "ON QUIT"
}

function on_term() {
    echo "ON TERM"
}


function main() {
    trap 'on_exit $?' EXIT
    trap 'on_hup $?' HUP
    trap 'on_int $?' INT
    trap 'on_quit $?' QUIT
    trap 'on_term $?' TERM

    counter=0
    STEP=1
    LIMIT=30
    while [ $counter -lt $LIMIT ]; do
        echo ${counter}
        sleep $STEP
        let ++counter
    done
}

main
