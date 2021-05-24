#!/bin/bash

if [ -z "$1" ]
then
    echo "You need to specify a language"
    exit 128
fi

if [ -z "$2" ]
then
    echo "You need to specify an inputfolder"
    exit 128
fi

if [ -z "$3" ]
then
    echo "You need to specify an outputfolder"
    exit 128
fi

language=$1
folder=$2
outputfolder=$3

shopt -s globstar
for i in **/*.mkv; do
    # Do not process symbolic links
    if [[ -L "$i" ]]
    then
        continue
    fi

    output=$(mkvmerge -F json --identify "$i" | jq '.tracks[] | select(.type=="audio") | select(.properties.language=="'"$language"'")')
    if [ ! -z "$output" ]
    then

        filename=$(basename -- "$i")
        dirn=$(dirname -- "$i")
        echo "Found file $filename in $dirn"
        mkdir -p "$3/$dirn"
        ln -rsf "$i" "$3/$dirn/$filename"
    fi
done

