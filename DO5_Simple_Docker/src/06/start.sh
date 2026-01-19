#!/bin/bash

gcc -o server server.c -lfcgi
spawn-fcgi -p 81 ./server
nginx -g "daemon off;"
