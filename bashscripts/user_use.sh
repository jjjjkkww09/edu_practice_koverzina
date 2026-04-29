#!/bin/bash

echo "Анализ дискового пространства в каталоге /home..."

data=$(sudo du -sk /home/* | sort -rn)

echo "$data" | while read size path

do

username=$(basename "$path")

echo "Пользователь: $username | Объем: $size KB"

done

