#!/bin/bash

folder_chars="$1"
file_chars="$2"
file_size_mb="${3/Mb/}"
file_name=$(sed 's/\..*$//' <<< "$file_chars")
file_ext=$(sed 's/^.*\.//' <<< "$file_chars")
log_file="log_file_$(date +'%d%m%y_%H%M%S').log"
start_readable=$(date +"%H:%M:%S")

source ./check.sh
source ./funk.sh

path=$(get_random_path)

for (( i=1; ; i++ )); do
    check_disk_space
    folder_name=$(generate_name "$folder_chars")_$(date +"%d%m%y")
    mkdir -p "$path/$folder_name"
    folder_creation_date=$(date +"%Y-%m-%d %H:%M:%S")

    file_count=$((RANDOM % 100 + 1))
    
    echo "Папка: $path/$folder_name $folder_creation_date" >> "$log_file"

    for (( j=1; j<=$file_count; j++ )); do
        file_base=$(generate_name "$file_name")_$(date +"%d%m%y")
        file_full="$file_base.$file_ext"
        file_path="$path/$folder_name/$file_full"
        fallocate -l "$file_size_mb"MB "$file_path"
        file_creation_date=$(date +"%Y-%m-%d %H:%M:%S")

        actual_size=$(du -b "$file_path" | cut -f1)
        actual_size_mb=$((actual_size / 1000 / 1000))

        echo "  Файл: $file_path, $file_creation_date, $actual_size_mb"Mb"" >> "$log_file"
    done
done
