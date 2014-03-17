#!/bin/bash

echo $2 | openssl aes-256-cbc -salt -in src/Problem$1.hs -out src/Problem$1.hs.secret -pass stdin

printf "\n$1. $2" >> answers.md

openssl aes-256-cbc -salt -in answers.md -out answers.md.secret

if [ $? -ne 0 ]; then
    git checkout -- answers.md
    exit 1
fi

sed -i -r s/#[0-9]+/#$1/ README.md

git add README.md answers.md.secret src/Problem$1.hs.secret

git commit -m "Solved Problem $1."

git push -u origin master