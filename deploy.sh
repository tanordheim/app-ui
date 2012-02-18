#!/bin/sh

rsync -avz --delete-after -e "ssh -p 1174" --exclude=.git --exclude=.gitignore --exclude=.rbenv-version ../app-ui trond@app-ui.binarymarbles.net:/www/binary_marbles/binarymarbles.net/
