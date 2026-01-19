#!//bin/bash

source ./funk.sh

if [ "$#" -ne 1 ];
then
        echo "Ошибка, введите 1 аргумент!"
        exit 1
fi

case "$1" in
1)
  clean_log
  ;;
2)
  clean_date
  ;;
3)
  clean_mask
  ;;
*)
  echo "Ошибка, введите число от 1 до 3!"
  exit 1
  ;;
esac


