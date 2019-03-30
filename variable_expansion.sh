#!/bin/bash
#--------------------------------------
#
#
#
#--------------------------------------
# 参考
# https://qiita.com/bsdhack/items/597eb7daee4a8b3276ba
# https://qiita.com/t_nakayama0714/items/80b4c94de43643f4be51

function default_not_substitution() {
    # ${parameter}がNULLの場合wordに置換。ただし代入はしない
    echo "START default_not_substitution"
    local parameter
    echo ${parameter}
    echo ${parameter:-FOO}
    parameter=BAR
    echo ${parameter:-FOO}
    echo "END default_not_substitution"
    echo
}

function default_and_substitution() {
    # ${parameter}がNULLの場合wordに置換し、さらにparameterに代入される
    echo "START default_and_substitution"
    local parameter
    echo ${parameter}
    echo ${parameter:=FOO}
    echo ${parameter}
    echo ${parameter:=BAR}
    echo "END default_and_substitution"
    echo
}

function undefined_error_message() {
    # ${parameter}がNULLの場合wordがあればその値を、指定されていなければ
    # デフォルトの値を表示して、非対話実行シェルをエラー終了させる
    echo "START undefined_error_message"
    local parameter
    echo ${parameter}
    echo ${parameter:?value not set}
    echo "END undefined_error_message"
    echo
}

function replace_not_null() {
    # ${parameter}がNULL以外の場合wordに置換される
    # いつ使うのかな…
    echo "START replace_not_null"
    local parameter
    echo ${parameter:+FOO}
    echo ${parameter}
    parameter=BAR
    echo ${parameter}
    echo ${parameter:+FOO}
    echo "END replace_not_null"
    echo
}

function length() {
    # ${parameter}の文字列としての長さ
    echo "START length"
    local parameter
    echo ${parameter}
    echo ${#parameter}
    parameter=FOO
    echo ${parameter}
    echo ${#parameter}
    echo "END length"
    echo
}

function shortest_match_from_right() {
    # ${parameter}の右からwordで示されるパターンの最短部分を削除
    echo "START shortest_match_from_right"
    local parameter
    parameter=foo.example.com
    echo ${parameter%.*}
    parameter=foo
    echo ${parameter%.*}
    echo "END shortest_match_from_right"
    echo
}

function longest_match_from_right() {
    # ${parameter}の右からwordで示されるパターンの最長部分を削除
    echo "START longest_match_from_right"
    local parameter
    parameter=foo.example.com
    echo ${parameter%%.*}
    parameter=foo
    echo ${parameter%%.*}
    echo "END longest_match_from_right"
    echo
    
}

function shortest_match_from_left() {
    # ${parameter}の左からwordで示されるパターンの最短部分を削除
    echo "START shortest_match_from_left"
    local parameter
    parameter=foo.example.com
    echo ${parameter#*.}
    parameter=foo
    echo ${parameter#*/}
    echo "END shortest_match_from_left"
    echo
}

function longest_match_from_left() {
    # ${parameter}の左からwordで示されるパターンの最長部分を削除
    echo "START longest_match_from_left"
    local parameter
    parameter=foo.example.com
    echo ${parameter##*.}
    parameter=foo
    echo ${parameter##*.}
    echo "END longest_match_from_left"
    echo
}

function main() {
    default_not_substitution
    default_and_substitution
    ## エラーを発生させるため、動作確認するときにコメントアウトを外す
    #undefined_error_message
    replace_not_null
    length
    shortest_match_from_right
    longest_match_from_right
    shortest_match_from_left
    longest_match_from_left
}

main
