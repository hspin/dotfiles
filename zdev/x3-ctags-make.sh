#!/usr/bin/env bash

CTMP=ctemp.txt
CTMP2=ctemp22.txt
STAMP=$(date +%T)

rm -f ./tags
echo "start ..."
find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; > "$CTMP"

sleep 1

echo "ctags generated"
echo "clean 1"
cat "$CTMP" | sed '/^$/d' > "$CTMP2"

echo "clean 2"
cat "$CTMP2" | sort > ./tags

rm "$CTMP"
rm "$CTMP2"
echo "DONE - " $STAMP
