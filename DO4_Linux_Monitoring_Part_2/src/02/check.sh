#!/bin/bash

if [[ "${#folder_chars}" -gt 7 ]];
then
        echo "Ошибка, параметр 1 не должен превышать 7 символов"
        exit 1
fi

if [[ "$file_chars" != "$file_name.$file_ext" ]];
then
        echo "Ошибка, параметр 2 должен быть в формате 'имя.расширение'"
        exit 1
fi

if [[ "${#file_name}" -gt 7 ]];
then
        echo "Ошибка, параметр 2 (имя) не должен превышать 7 символов"
        exit 1
fi

if [[ "${#file_ext}" -gt 3 ]];
then
        echo "Ошибка, параметр 2 (расширения) не должен превышать 3 символов"
        exit 1
fi

if [ "$file_size_mb" -gt 100 ];
then
        echo "Ошибка, размер файла не должен превышать 100Mb!"
        exit 1
fi

if ! [[ "$file_size_mb" =~ ^[0-9]+$ ]];
then
        echo "Ошибка, параметр 3 должен быть числом!"
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
