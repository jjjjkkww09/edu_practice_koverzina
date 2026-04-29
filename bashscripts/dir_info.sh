#!/bin/bash

putkdirectorii=${1:-.}

size=$(du -sk "$putkdirectorii" | awk '{print $1}')

echo "Общий размер: $size КВ"
