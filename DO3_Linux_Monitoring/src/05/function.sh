#!/bin/bash

source ./get_function.sh

information() {
        echo "Total number of folders (including all nested ones) = ${Total_dir}"
        echo "TOP 5 folders of maximum size arranged in descending order (path and size):
${Top5}"
        echo "Total number of files = ${Total_files}"
        echo "Number of:"
        echo "Configuration files (with the .conf extension) = ${Conf}"
        echo "Text files = ${Textfiles}"
        echo "Executable files = ${Executable}"
        echo "Log files (with the extension .log) = ${Logfiles}"
        echo "Archive files = ${Archive}"
        echo "Symbolic links = ${Symbol}"
        echo "TOP 10 files of maximum size arranged in descending order (path, size and type):
${Top10_1}"
        echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):
${Top10_2}"
        echo "Script execution time (in seconds) =  ${Time}"
}