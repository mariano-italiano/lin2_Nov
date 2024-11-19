#!/bin/bash

while getopts "o:" flaga
do
	case "${flaga}" in
		o) OPERATION=${OPTARG};;
	esac
done

if [ -z $OPERATION ] ; then
	echo
	echo "Usage: $0 {start|stop|status}"
	echo
fi

if [ $OPERATION = "start" ] ; then
	/usr/bin/script.sh & 
	echo $! > /var/run/script.pid
	echo "Script $0 started"
elif [ $OPERATION = "stop" ] ; then
	kill `cat /var/run/script.pid`
	rm /var/run/script.pid
	echo "Script $0 stopped"
elif [ $OPERATION = "status" ] ; then
	if [ -e /var/run/script.pid ] ; then 
		echo "Script $0 is running, pid=`cat /var/run/script.pid`"
	else
		echo "Script is NOT running"
		exit 0
	fi
fi

while true
do 
	echo `date` >> /tmp/my-service.log
	sleep 10
done
