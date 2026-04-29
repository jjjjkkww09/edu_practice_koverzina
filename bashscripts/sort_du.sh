#!/bin/bash

dir=${1:-.}

echo "3 самых старых файла в директории $dir:"

find "$dir" -maxdepth 1 -type f -exec stat --printf="%y %n\n" {} + | sort | head -n 3

