#!/bin/bash

    source ./color.sh                                                                                                                     
    source ./get_function.sh

information() {                                                                                                                                                                                                                                                                   
    local bg_title_color=$(bg_title "$1")                                                                                                
    local font_title_color=$(font_title "$2")                                                                                            
    local bg_values_color=$(bg_values "$3")                                                                                              
    local font_values_color=$(font_values "$4")                                                                                          
    local reset="\033[0m"      

        echo -e "${bg_title_color}${font_title_color}HOSTNAME${reset} = ${bg_values_color}${font_values_color}$(get_hostname)${reset}"
        echo -e "${bg_title_color}${font_title_color}TIMEZONE${reset} = ${bg_values_color}${font_values_color}$(get_timezone)${reset}"
        echo -e "${bg_title_color}${font_title_color}USER${reset} = ${bg_values_color}${font_values_color}$(get_user)${reset}"
        echo -e "${bg_title_color}${font_title_color}OS${reset} = ${bg_values_color}${font_values_color}$(get_os)${reset}"
        echo -e "${bg_title_color}${font_title_color}DATE${reset} = ${bg_values_color}${font_values_color}$(get_date)${reset}"
        echo -e "${bg_title_color}${font_title_color}UPTIME${reset} = ${bg_values_color}${font_values_color}$(get_uptime)${reset}"
        echo -e "${bg_title_color}${font_title_color}UPTIME_SEC${reset} = ${bg_values_color}${font_values_color}$(get_uptime_sec)${reset}"
        echo -e "${bg_title_color}${font_title_color}IP${reset} = ${bg_values_color}${font_values_color}$(get_ip)${reset}"
        echo -e "${bg_title_color}${font_title_color}MASK${reset} = ${bg_values_color}${font_values_color}$(get_mask)${reset}"
        echo -e "${bg_title_color}${font_title_color}GATEWAY${reset} = ${bg_values_color}${font_values_color}$(get_gateway)${reset}"
        echo -e "${bg_title_color}${font_title_color}RAM_TOTAL${reset} = ${bg_values_color}${font_values_color}$(get_ram_total)${reset}"
        echo -e "${bg_title_color}${font_title_color}RAM_USED${reset} = ${bg_values_color}${font_values_color}$(get_ram_used)${reset}"
        echo -e "${bg_title_color}${font_title_color}RAM_FREE${reset} = ${bg_values_color}${font_values_color}$(get_ram_free)${reset}"
        echo -e "${bg_title_color}${font_title_color}SPACE_ROOT${reset} = ${bg_values_color}${font_values_color}$(get_space_root)${reset}"
        echo -e "${bg_title_color}${font_title_color}SPACE_ROOT_USED${reset} = ${bg_values_color}${font_values_color}$(get_space_root_used)${reset}" 
        echo -e "${bg_title_color}${font_title_color}SPACE_ROOT_FREE${reset} = ${bg_values_color}${font_values_color}$(get_space_root_free)${reset}"
}