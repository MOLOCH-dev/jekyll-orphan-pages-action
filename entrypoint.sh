#!/bin/sh -l

export LOG=log.txt
echo "Url is $1"
wget --no-directories --mirror --spider "$1" 2>&1 | tee "$LOG"
arr=(`grep -P -o -e '(?<=^--....-..-.. ..:..:..--  )(.*)' "$LOG"`)
echo "::set-output name=crawled-urls::$arr"
