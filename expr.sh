#!/bin/bash
set -Ceuo pipefail

num=27

if (( $num > 23 )); then
    num="0"$(expr ${num} - 24)
fi

echo ${num:1-3}
echo ${num: -2}
