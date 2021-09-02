#!/bin/bash -l

export LOG=log.txt
wget --mirror --spider "$1" 2>&1 | tee "$LOG"
arr=(`grep -P -o -e '(?<=^--....-..-.. ..:..:..--  )(.*)' "$LOG"`)
echo "::set-output name=crawled-urls::$arr"
