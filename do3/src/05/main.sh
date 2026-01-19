#!/bin/bash

source ./function.sh

if [ $# -ne 1 ];
then
    echo "Ошибка, количество переданных аргументов большо одного!"
    exit 1
fi

if [[ ! $1 =~ /$ ]];
then
    echo "Ошибка, путь должен заканчиваться на /!"
    exit 1
fi

if [ ! -d "$1" ];
then
    echo "Ошибка, директория $1 не существует"
    exit 1
fi

information