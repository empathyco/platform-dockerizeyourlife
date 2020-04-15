#!/bin/bash
set -xeu
VERSION=$(cat package.json | jq '.version')
MESSAGE_PATH=Message.txt
sed -i 's/VERSION/'${VERSION}'/' /opt/Message.txt
sed -i 's/EMAIL/'${1}'/g' /opt/Message.txt
cat /opt/Message.txt



