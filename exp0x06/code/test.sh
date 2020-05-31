#!/usr/bin/env bash 

FTP_USER=virtual
path=/home/${FTP_USER}

if [[ ! -d "$path" ]]; then
   echo -e " no file"
fi

echo "end"