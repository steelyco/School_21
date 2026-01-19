#!/bin/bash

bg_title() {
case "$1" in
        1) echo -e "\033[107m" ;; # white
        2) echo -e "\033[41m"  ;; # red
        3) echo -e "\033[42m"  ;; # green
        4) echo -e "\033[44m"  ;; # blue
        5) echo -e "\033[45m"  ;; # purple
        6) echo -e "\033[40m"  ;; # black
esac
}

font_title() {
case "$1" in
        1) echo -e "\033[97m"  ;; # white
        2) echo -e "\033[31m"  ;; # red
        3) echo -e "\033[32m"  ;; # green
        4) echo -e "\033[34m"  ;; # blue
        5) echo -e "\033[35m"  ;; # purple
        6) echo -e "\033[30m"  ;; # black
esac
}

bg_values() {
case "$1" in
        1) echo -e "\033[107m" ;; # white
        2) echo -e "\033[41m"  ;; # red
        3) echo -e "\033[42m"  ;; # green
        4) echo -e "\033[44m"  ;; # blue
        5) echo -e "\033[45m"  ;; # purple
        6) echo -e "\033[40m"  ;; # black
esac
}

font_values() {
case "$1" in
        1) echo -e "\033[97m"  ;; # white
        2) echo -e "\033[31m"  ;; # red
        3) echo -e "\033[32m"  ;; # green
        4) echo -e "\033[34m"  ;; # blue
        5) echo -e "\033[35m"  ;; # purple
        6) echo -e "\033[30m"  ;; # black
esac                                                                                                                                 }