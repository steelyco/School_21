#!/bin/bash

log_file="./log.log"

sort_code() {
    local filter=$(awk '{print $0}' "$log_file" | sort -k 7)
    echo "$filter"
    echo "---------------------"
    echo "Кол-во записей: $(echo "$filter" | wc -l)"
}

sort_unic_ip() {
    local filter=$(awk '$7 !~ /^4[0-9]{2}$/ {print $1}' "$log_file" | sort -n -k 7)
    echo "$filter"
    echo "---------------------"
    echo "Кол-во записей: $(echo "$filter" | wc -l)"
}

sort_err() {
    local filter=$(awk '$7 !~ /^2[0-9]{2}$/ {print $0}' "$log_file" | sort -n -k 7)
    echo "$filter"
    echo "---------------------"
    echo "Кол-во записей: $(echo "$filter" | wc -l)"
}

sort_unic_err() {
    local filter=$(awk '$7 !~ /^2[0-9]{2}$/ && $7 !~ /^4[0-9]{2}$/ {print $1}' "$log_file" | sort -n -k 7)
    echo "$filter"
    echo "---------------------"
    echo "Кол-во записей: $(echo "$filter" | wc -l)"
}

