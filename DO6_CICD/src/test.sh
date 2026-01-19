#!/bin/bash

if ./02/DO | grep -q "Bad number"; then
    echo "Без аргументов: Успешно"
else
    echo "Без аргументов: Ошибка"
    exit 1
fi

for i in {1..6}; do
    if ./02/DO $i | grep -q "Learning"; then
        echo "$i: Успешно"
    else
        echo "$i: Ошибка"
        exit 1
    fi
done

if ./02/DO 0 | grep -q "Bad number"; then
    echo "0: Успешно"
else
    echo "0: Ошибка"
    exit 1
fi

echo "Тесты пройдены!"
exit 0