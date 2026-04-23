#!/bin/bash

filename=example.sh

if grep $filename /home/user

then

echo "Файл $filename существует."

else

echo "Файл $filename не существует."

fi
