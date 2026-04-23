#!/bin/bash

echo "Введите свое имя..."

read name

if [ -z "$name" ]

then

echo "Вы не ввели имя!"

else

echo "Привет, $name!"

fi

