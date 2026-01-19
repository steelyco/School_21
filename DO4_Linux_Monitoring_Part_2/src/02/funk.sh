#!/bin/bash

generate_name() {
    local chars=$1
    local min_length=5
    local max_length=20
    local length=$(( RANDOM % (max_length - min_length + 1) + min_length ))
    local name=""

    for (( i=0; i<${#chars}; i++ )); do
        name+=${chars:$i:1}
    done

    while [ ${#name} -lt $length ]; do
        local pos=$(( RANDOM % ${#chars} ))
        local char=${chars:$pos:1}
	local insert_pos=${#name}

        for (( i=0; i<${#name}; i++ )); do
            if [[ "${chars#*${name:$i:1}}" == *"$char"* ]]; then
                insert_pos=$i
                break
            fi
        done

        name="${name:0:$insert_pos}$char${name:$insert_pos}"
    done

    echo "$name"
}

check_disk_space() {
space=$(df -h / | awk 'NR==2 {printf "%.0f\n", $4 * 1024 }')
        if [ "$space" -lt 1024 ]; then
                echo "Недостаточно свободного места на диске. Завершение скрипта!"
                echo "Время начала: $start_readable"  | tee -a "$log_file"
                echo "Время окончания: $(date +"%H:%M:%S")"  | tee -a "$log_file"
                echo "Общее время работы: $SECONDS секунд" | tee -a "$log_file"
                exit 0

        fi
}

get_random_path() {
    local exclude_dirs=("/bin" "/sbin" "/usr/bin" "/usr/sbin" "/boot" "/dev" "/proc" "/sys" "/root")
    local potential_dirs=()
    while IFS= read -r dir; do
        if [[ ! " ${exclude_dirs[@]} " =~ " ${dir} " ]] && [ -w "$dir" ]; then
            potential_dirs+=("$dir")
        fi
    done < <(find / -type d -maxdepth 3 -writable 2>/dev/null | grep -v -e "/bin" -e "/sbin" -e "/proc" -e "/sys" -e "/dev")

    if [ ${#potential_dirs[@]} -gt 0 ]; then
        echo "${potential_dirs[RANDOM % ${#potential_dirs[@]}]}"
    else
        echo "$HOME" 
        fi
}
