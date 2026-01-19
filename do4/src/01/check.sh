#!/bin/bash

if [ "$#" -ne 6 ];
then
        echo "Ошибка, введите 6 аргументов!"
        exit 1
fi

space=$(df -BM / | awk 'NR==2 {print $4}' | tr -d 'M')

if [ "$space" -lt 1024 ]; then
    echo "Ошибка, нужно минимум 1 ГБ свободного места!"
    exit 1
fi

if [[ "$path" != /* ]];
then
        echo "Ошибка, параметр 1 должен быть абсолютным путем!"
        exit 1
fi

if ! [[ "$folder_count" =~ ^[0-9]+$ ]];
then
        echo "Ошибка, параметр 2 должен быть числом!"
        exit 1
fi

if [[ "${#folder_chars}" -gt 7 ]];
then
        echo "Ошибка, параметр 3 не должен превышать 7 символов"
        exit 1
fi

if ! [[ "$file_count" =~ ^[0-9]+$ ]];
then
        echo "Ошибка, параметр 4 должен быть числом!"                                                                                   exit 1
fi

if [[ "$file_chars" != "$file_name.$file_ext" ]];
then
        echo "Ошибка: параметр 5 должен быть в формате 'имя.расширение'"
        exit 1
fi

if [[ "${#file_name}" -gt 7 ]];
then
        echo "Ошибка, параметр 5 (имя) не должен превышать 7 символов"
        exit 1
fi

if [[ "${#file_ext}" -gt 3 ]];
then
        echo "Ошибка, параметр 5 (расширения) не должен превышать 3 символов"
        exit 1
fi

if ! [[ "$file_size_kb" =~ ^[0-9]+$ ]];
then
        echo "Ошибка, параметр 6 должен быть числом!"
        exit 1
fi

if [ "$file_size_kb" -gt 100 ];
then
        echo "Ошибка, размер файла не должен превышать 100kb!"
        exit 1
fi

if [[ "$folder_chars" =~ [^a-zA-Z] ]];
then
        echo "Ошибка, имя файла должно содержать только английские буквы"
        exit 1
fi

if [[ "$file_name" =~ [^a-zA-Z] ]];
then
        echo "Ошибка, имя файла должно содержать только английские буквы"
        exit 1
fi

if [[ "$file_ext" =~ [^a-zA-Z] ]];
then
        echo "Ошибка, расширение файла должно содержать только английские буквы"
        exit 1
fi
