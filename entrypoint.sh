#!/bin/sh -l
declare -a arr
export LOG=log.txt
wget --no-directories --mirror --spider "$1" 2>&1 | tee "$LOG"
arr=(`grep -P -o -e '(?<=^--....-..-.. ..:..:..--  )(.*)' "$LOG"`)
echo "::set-output name=crawled-urls::$arr"
