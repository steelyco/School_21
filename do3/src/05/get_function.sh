#!/bin/bash

Total_dir=$(find "$1" -type d |  wc -l)
Top5=$(du -h "$1" | sort -hr | head -n 5 | awk '{printf "%d - %s, %s\n", FNR, $2, $1}')
Total_files=$(find "$1" -type f | wc -l)
Conf=$(find "$1" -type f | grep '.conf' | wc -l)
Textfiles=$(find "$1" -type f | grep '.txt' | wc -l)
Executable=$(find "$1" -type f -executable | wc -l)
Logfiles=$(find "$1" -type f | grep '.log' | wc -l)
Archive=$(find "$1" -type f | grep -E '\.(zip|tar|rar|7z)$' | wc -l)
Symbol=$(find "$1" -type l | wc -l)
Top10_1=$(find "$1" -type f -executable -print0 | xargs -0 -I{} sh -c '
    file="{}"
    type=$(file -b "$file" | awk "{print \$1}")
    size=$(du -h "$file" | awk "{print \$1}")
    echo "$file, $size, $type"
' | sort -rh | head -n 10 | nl -w1 -s" - ")
Top10_2=$(find "$1" -type f -executable -print0 | xargs -0 -I{} sh -c '
    file="{}"
    md5=$(md5sum "$file" | awk "{print \$1}")
    size=$(du -h "$file" | awk "{print \$1}")
    echo "$file, $size, $md5"
    ' | sort -rh | head -n 10 | nl -w1 -s" - ")
Time=$SECONDS
