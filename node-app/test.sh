#!/bin/bash
set -xeu
VERSION=$(cat package.json | jq '.version')
sed 's/VERSION/'${VERSION}'/' Message.txt > msg.txt
sed 's/EMAIL/'${1}'/g' msg.txt > msg2.txt
cat msg2.txt
