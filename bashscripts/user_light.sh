#!/bin/bash

user=kwk

if grep $user /etc/passwd

then

echo "Ура! Пользователь $user найден, поздравляем!"

fi
