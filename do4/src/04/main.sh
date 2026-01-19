#!/bin/bash

source ./funk.sh

for i in {1..5};
do
	lines=$((RANDOM%901 + 100))
	log_file="access_${i}.log"

	echo "Создан файл $log_file - $lines строк."

	for ((j=1; j<=lines; j++));
	do
		generate_log >> "$log_file"
	done
done

echo "Файлы успешно созданы!"

