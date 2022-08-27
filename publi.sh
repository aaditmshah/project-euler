#!/bin/bash

echo $2 | gpg2 --cipher-algo AES256 --batch --no-tty --yes --passphrase-fd 0 --output src/Problem$1.hs.gpg --symmetric src/raw/Problem$1.hs

echo "$2" >> answers.md

gpg2 --cipher-algo AES256 --output answers.md.gpg --symmetric answers.md

if [ $? -ne 0 ]; then
  git checkout -- answers.md.gpg
  exit 1
fi

sed -i -r s/#[0-9]+/#$1/ README.md

git add README.md answers.md.gpg src/Problem$1.hs.gpg

git commit -m "Solved Problem $1."

git push -u origin master
