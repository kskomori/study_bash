#!/bin/bash
set -u

# https://qiita.com/koara-local/items/04d3efd1031ea62d8db5

hoge="abcdef"

# 0番目から2つ
echo ${hoge:0:2}  # -> ab

echo ${hoge:2:2}  # -> cd

echo ${hoge:4:2}  # -> ef

echo ${hoge:2}    # -> cdef

# 長さをマイナスにすると、最後からマイナス分を引いた長さになる
echo ${hoge:0:-2} # abcd

echo ${hoge:-2}

