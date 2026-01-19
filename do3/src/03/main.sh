#!/bin/bash

source ./function.sh
source ./color.sh

if [ "$#" -ne 4 ];
then
        echo "Ошибка, введите 4 аргумента: числа от 1 до 6!"
    exit 1
fi

if [[ "$1" == "$2" || "$3" == "$4" ]];
then
    echo "Ошибка, цвет фона и шрифта не должны совпадать!"
    exit 1
fi

for arg in "$@";
do
    if ! [[ "$arg" =~ ^[1-6]$ ]];
    then
        echo "Ошибка, аргументы должны быть числом от 1 до 6!"
        exit 1
    fi
done

information "$1" "$2" "$3" "$4"