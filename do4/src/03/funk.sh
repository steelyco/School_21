#!/bin/bash

log_file="../02/log*"
pattern="[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}"
file_name="[a-z]+_[0-9]{6}"

clean_log() {
	for var in $(cat $log_file | grep Папка | awk '{print $2}')
	do 
		rm -rf "$var"
	done
}

clean_date() {
	echo "Введите дату начала поиска в формате YYYY-MM-DD HH:MM"
	read start_format
	echo "Введите дату конца поиска в формате YYYY-MM-DD HH:MM"
	read end_format
		if [[ $start_format =~ $pattern ]] && [[ $end_format =~ $pattern ]]; 
		then
			for var in $(find / -type d -newermt "$start_format" ! -newermt "$end_format")
			do 
				if [[ "$var" =~ $file_name ]];
				then
					rm -rf "$var"
				fi
			done
		else
        		echo "Неверный формат"
		fi
}

clean_mask() {
	for var in $(find / -type d -name "*_[0-9][0-9][0-9][0-9][0-9][0-9]*")
	do 
		rm -rf "$var"
	done
}
