#!/bin/bash

source ./function.sh
source ./color.sh

DEFAULT_BG_TITLE=6
DEFAULT_FONT_TITLE=1
DEFAULT_BG_VALUES=2
DEFAULT_FONT_VALUES=4

CONFIG_FILE="config.conf"

if [ -f "$CONFIG_FILE" ];
then
    source "$CONFIG_FILE"
else
    echo "Используются цвета по умолчанию"
fi

COL1_BG=${column1_background:-$DEFAULT_BG_TITLE}
COL1_FONT=${column1_font_color:-$DEFAULT_FONT_TITLE}
COL2_BG=${column2_background:-$DEFAULT_BG_VALUES}
COL2_FONT=${column2_font_color:-$DEFAULT_FONT_VALUES}

if [[ "$COL1_BG" == "$COL1_FONT" || "$COL2_BG" == "$COL2_FONT" ]];
then
    echo "Ошибка, цвет фона и шрифта не должны совпадать!"
    exit 1
fi

information "$COL1_BG" "$COL1_FONT" "$COL2_BG" "$COL2_FONT"

echo
echo "Column 1 background = $([ "$column1_background" ] && echo "$COL1_BG" || echo "default" ) ($(get_color_name $COL1_BG))"
echo "Column 1 font color = $([ "$column1_font_color" ] && echo "$COL1_FONT" || echo "default" ) ($(get_color_name $COL1_FONT))"
echo "Column 2 background = $([ "$column2_background" ] && echo "$COL2_BG" || echo "default" ) ($(get_color_name $COL2_BG))"
echo "Column 2 font color = $([ "$column2_font_color" ] && echo "$COL2_FONT" || echo "default" ) ($(get_color_name $COL2_FONT))"