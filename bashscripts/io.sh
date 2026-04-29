#!/bin/bash

echo "Waiting for command!"

read com

if [ $com == "start" ]

then

echo "Starting..."

elif [ $com == "stop" ]

then

echo "Stopping..."

else

echo "Error: Invalid command"

fi
