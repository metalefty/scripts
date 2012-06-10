#!/bin/sh
# 東京電力の場合はこっち
# API_URI=http://tepco-usage-api.appspot.com/quick.txt
# 九州電力用API
API_URI=http://www.club.kyutech.ac.jp/~meta/kyuden/quick.cgi?tmux
# curl を使用する場合
#RESULT=$(curl -s --max-time 1 --retry 10 ${API_URI})
# wget を使用する場合
RESULT=$(wget -q -O - --timeout=1 --tries 10 ${API_URI})
LASTUPDATE=$(echo ${RESULT}|cut -f1 -d,)

echo $(echo "scale=1; $(echo ${RESULT} | cut -f2,3 -d, | sed -e 's/,/ \* 100 \/ /')" | bc)%"(${LASTUPDATE})"
