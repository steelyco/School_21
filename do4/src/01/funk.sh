#!/bin/bash

generate_name() {
    local chars=$1
    local min_length=4
    local length=$(( RANDOM % (20 - min_length + 1) + min_length )) 
    local name=""

    for (( i=0; i<${#chars}; i++ )); do
        name+=${chars:$i:1}
    done
    
    while (( ${#name} < length )); do
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
    
    local ordered_name=""
    for (( i=0; i<${#chars}; i++ )); do
        local char=${chars:$i:1}
        for (( j=0; j<${#name}; j++ )); do
            if [[ "${name:$j:1}" == "$char" ]]; then
                ordered_name+="$char"
            fi
        done
    done
    
    echo "$ordered_name"
}
