#!/bin/sh -l
export LOG=log.txt;
echo "got after export";
wget --mirror --spider "$1" 2>&1 | tee "$LOG";
echo "got after log";
arr=(`grep -P -o -e '(?<=^--....-..-.. ..:..:..--  )(.*)' "$LOG"`);
echo "::set-output name=crawled-urls::$arr