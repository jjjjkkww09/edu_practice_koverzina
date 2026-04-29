#!/bin/bash

echo "Введите имя пользователя, которого необходимо найти..."

read username

if grep $username /etc/passwd

then

echo "Поздравляем! Пользователь $username найден!"

else

echo "Не повезло. Пользователь $username не найден..."

fi

