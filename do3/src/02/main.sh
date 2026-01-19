#!/bin/bash

source function.sh
source filename.sh

filename=$(generate)
sysinfo=$(information)

echo "$sysinfo"
echo "Записать данные в файл? Ответьте y/n"
read answer

if [[ "$answer" =~ ^[yY]$ ]];
then
        echo "$sysinfo" > "$filename"
        echo "Сохранение успешно! Имя файла: $filename"
else
        echo "Сохранение отменено"
fi