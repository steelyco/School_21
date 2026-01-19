#!/bin/bash

get_hostname() {
    host=$HOSTNAME
    echo "$host"
}

get_timezone() {
    time=$(timedatectl | grep / | awk '{print $3, $4, $5}')
    echo "$time"
}

get_user() {
    user=$(whoami)
    echo "$user"
}

get_os() {
        os=$(cat /etc/issue)
    echo "$os"
}

get_date() {
    date=$(date)
    echo "$date"
}

get_uptime() {
    uptime=$(uptime -p)
    echo "$uptime"
}

get_uptime_sec() {
    uptime_sec=$(cat /proc/uptime | awk '{print $1}')
    echo "$uptime_sec"
}

get_ip() {
    ip=$(ifconfig | grep inet | awk 'NR==1 {printf $2}')
    echo "$ip"
}

get_mask() {
    mask=$(ifconfig | grep -m 1 netmask | awk '{print $4}')
    echo "$mask"
}

get_gateway() {
    gateway=$(ip r show default | awk '{print $3}')
    echo "$gateway"
}

get_ram_total() {
    rtotal=$(free -m | awk '/Mem:/ {printf "%.3f GB", $2 / 1024}')
    echo "$rtotal"
}

get_ram_used() {
    rused=$(free -m | awk '/Mem:/ {printf "%.3f GB", $3 / 1024}')
    echo "$rused"
}

get_ram_free() {
    rfree=$(free -m | awk '/Mem:/ {printf "%.3f GB", $4 / 1024}')
    echo "$rfree"
}

get_space_root() {
    stotal=$(df / | awk '/dev/ {printf "%.2f MB\n", $2 / 1024}')
    echo "$stotal"
}

get_space_root_used() {
    sused=$(df / | awk '/dev/ {printf "%.2f MB\n", $3 / 1024}')
    echo "$sused"
}

get_space_root_free() {
    sfree=$(df / | awk '/dev/ {printf "%.2f MB\n", $4 / 1024}')
    echo "$sfree"
}