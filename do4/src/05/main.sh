#!/bin/bash

source ./funk.sh

if [ "$#" -ne 1 ];
then
        echo "Ошибка, введите 1 аргумент!"
        exit 1
fi

case "$1" in
1)
  sort_code
  ;;
2)
  sort_unic_ip
  ;;
3)
  sort_err
  ;;
4)
  sort_unic_err
  ;;
*)
  echo "Ошибка, введите число от 1 до 4!"
  exit 1
  ;;
esac


