#!/bin/bash

path="$1"
folder_count="$2"
folder_chars="$3"
file_count="$4"
file_chars="$5"
file_size_kb="${6/kb/}"
file_name=$(sed 's/\..*$//' <<< "$file_chars")
file_ext=$(sed 's/^.*\.//' <<< "$file_chars")
log_file="log_file_$(date +'%d%m%y_%H%M%S').log"

source ./funk.sh
source ./check.sh

for (( i=1; i<=$folder_count; i++ )); do
    folder_name=$(generate_name "$folder_chars")_$(date +"%d%m%y")
    mkdir -p "$path/$folder_name"
    folder_creation_date=$(date +"%Y-%m-%d %H:%M:%S")
    
    echo "Папка: $path/$folder_name, $folder_creation_date" >> "$log_file"
    
    for (( j=1; j<=$file_count; j++ )); do
        file_base=$(generate_name "$file_name")_$(date +"%d%m%y")
        file_full="$file_base.$file_ext"
        file_path="$path/$folder_name/$file_full"
        fallocate -l "$file_size_kb"KB "$file_path"
        file_creation_date=$(date +"%Y-%m-%d %H:%M:%S")
        
        actual_size=$(du -b "$file_path" | cut -f1)
	actual_size_kb=$((actual_size / 1000))

        echo "  Файл: $file_path, $file_creation_date, $actual_size_kb"Kb"" >> "$log_file"
    done
done
