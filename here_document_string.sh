#!/bin/bash
set -u

word=$(cat << "EOS"
abc
def
123
456
EOS
)

echo $word
