#!/bin/bash

echo "Введите первое число..."

read a

echo "Введите второе число..."

read b

echo "Считаем..."

sum=$((a + b))

razn=$((a - b))

proizv=$((a * b))

echo "По результатам подсчета:"

echo "$a + $b = $sum"

echo "$a - $b = $razn"

echo "$a * $b = $proizv"
