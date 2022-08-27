#!/bin/bash

gpg2 --output answers.md --decrypt answers.md.gpg

mkdir -p src/raw

n=1

while read answer; do
  echo $answer | gpg2 --cipher-algo AES256 --batch --no-tty --yes --passphrase-fd 0 --output src/raw/Problem$n.hs --decrypt src/Problem$n.hs.gpg
  n=$[$n + 1]
done < answers.md
