#!/bin/bash

echo "Введите имя для создаваемой директории..."

read dir

if [ -d "$dir" ]

then

echo "Директория $dir уже существует."

else

mkdir $dir

echo "Директория $dir успешно создана!"

fi
