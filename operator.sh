#!/bin/bash

#----------------------------------
### 文字列
#----------------------------------
something="abcdef"
length_zero=""
undefined=

if [ $something = "abcdef" ]; then
    echo "文字列は等しい"
else
    echo "文字列は等しくない"
fi

###
if [ -n $something ]; then
    echo "文字列の長さは0より大きいです"
fi

if [ -z $length_zero ]; then
    echo "文字列の長さが0です"
fi

if [ -z $undefined ]; then
    echo "文字列の長さが0です"
fi

#----------------------------------
### 数値
#----------------------------------
number_1=1
number_2=2
number_3=3
other_1=1

if [ $number_1 -eq $other_1 ]; then
    echo "${number_1}と${other_1}は同じ数値です"
fi

if [ $number_1 -ne $number_2 ]; then
    echo "${number_1}と${number_2}は等しくありません"
fi

if [ $number_3 -gt $number_2 ]; then
    echo "${number_3}は${number_2}よりも大きい"
fi

if [ $number_1 -lt $number_2 ]; then
    echo "${number_1}は${number_2}よりも小さい"
fi

if [ $number_3 -ge $number_2 ]; then
    echo "${number_3}は${number_2}以上"
fi

if [ $number_1 -le $number_2 ]; then
    echo "${number_1}は${number_2}以下"
fi

#----------------------------------
### AND / OR
#----------------------------------
if [ 1 -eq 1 -a "abc" = "abc" ]; then
    echo "AND条件"
fi

if [ 1 -eq 2 -o "abc" = "abc" ]; then
    echo "OR条件"
fi
