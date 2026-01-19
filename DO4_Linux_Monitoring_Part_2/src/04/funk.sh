#!/bin/bash

generate_log() {
get_addr=$[RANDOM%256].$[RANDOM%256].$[RANDOM%256].$[RANDOM%256]
get_time=$(date +\[%d/%b/%Y:%H:%M:%S\ %z\])
get_status=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
get_request1=("GET" "POST" "PUT" "PATCH" "DELETE")
get_request2=("/page-1.html" "/page-2.html" "/page-3.html" "/page-4.html" "/page-5.html" "/page-6.html" "/page-7.html" "/page-8.html")
get_referer=("https://www.google.com/" "https://www.facebook.com/" "https://example.com/products" "https://shop.example.com/checkout" "https://cpc.yandex.ru/promo" "https://outlook.live.com/mail/" "https://mail.google.com/mail/u/0/" "https://yandex.ru/search/?text=nginx+logs")
get_agent=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")

echo "$get_addr" "$get_time" \""${get_request1[RANDOM%5]} ${get_request2[RANDOM%8]} HTTP/1.1"\" "${get_status[RANDOM%10]}" \""${get_referer[RANDOM%8]}"\" \""${get_agent[RANDOM%8]}"\"
}
