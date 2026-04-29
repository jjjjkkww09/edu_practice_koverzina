#!/bin/bash

line1=$(cat ~/.bash_history | sort | uniq -c | sort -rn | head -n 5 | sed -n '1p')

line2=$(cat ~/.bash_history | sort | uniq -c | sort -rn | head -n 5 | sed -n '2p')

line3=$(cat ~/.bash_history | sort | uniq -c | sort -rn | head -n 5 | sed -n '3p')

line4=$(cat ~/.bash_history | sort | uniq -c | sort -rn | head -n 5 | sed -n '4p')

line5=$(cat ~/.bash_history | sort | uniq -c | sort -rn | head -n 5 | sed -n '5p')

echo "ТОП 5 наиболее используемых и крутых команд истории:"

echo "1 место: $line1"

echo "2 место: $line2"

echo "3 место: $line3"

echo "4 место: $line4"

echo "5 место: $line5"

