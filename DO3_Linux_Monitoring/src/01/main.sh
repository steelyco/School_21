#!/bin/bash

if [[ "$1" =~ ^[0-9] ]];
then
    echo "Некорректный ввод!"
else
    echo "$1"
fi