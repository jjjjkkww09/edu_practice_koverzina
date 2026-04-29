#!/bin/bash

echo "Введите имя файла, тип которого нужно определить..."

read filename

if [ -L $filename ]

then

echo "Файл $filename является симлинком."

elif [ -d $filename ]

then

echo "Файл $filename является директорией."

elif [ -f $filename ]

then

echo "Файл $filename является файлом."

else

echo "Файл не найден или имеет другой тип."

fi
