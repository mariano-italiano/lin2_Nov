#!/bin/bash

# Przychwycenie SIGINT
CTRLC=0
KILL=0

function przechwyc_SIGINT {
        CTRLC=$(( $CTRLC + 1 ))
        if [[ $CTRLC > 0 ]] && [[ $CTRLC < 3 ]] ; then
                echo "`date +'%m-%d-%Y %H:%M:%S'` - INFO - Przechwycony sygnał SIGINT" >> /tmp/script.signals
        fi
	if [[ $CTRLC -eq 3 ]] ; then
		echo "`date +'%m-%d-%Y %H:%M:%S'` - INFO - Przechwycony sygnał SIGINT po raz 3 - przerywam program" >> /tmp/script.signals
		exit 0
	fi
}

# Przechwycenie SIGKILL 
function przechwyc_SIGTERM {
        KILL=$(( $KILL + 1 ))
        if [[ $KILL > 0 ]] ; then
                echo "`date +'%m-%d-%Y %H:%M:%S'` - INFO - Przechwycony sygnał SIGKILL" >> /tmp/script.signals
        fi
}

# Przechwycenie sygnałów
trap przechwyc_SIGINT SIGINT
trap przechwyc_SIGTERM SIGTERM


# Program główny
while true
do 
	sleep 10
done
