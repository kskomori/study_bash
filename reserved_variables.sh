#!/bin/bash
#set -Ceuo pipefail

# https://qiita.com/dskshmz/items/c01f29f8398cc7f5c396
# https://qiita.com/laikuaut/items/1daa06900ad045d119b4


# プロセスID
echo "This Process" $$
echo $BASHPID

# 親プロセスID
echo "PPID" $PPID

# 最後に実行されたコマンドの終了ステータス
echo $?

# 最後に呼び出されたバックグラウンドプロセスのプロセス番号
: &
echo "Background Process" $!

# シェルに与えられたフラグ
echo "flag" $-

# シェル実行時にに与えられた引数の1つ目
echo $1

# シェルスクリプト実行時に指定された引数、もしくはsetコマンド実行時に指定された全パラメータが設定される変数を格納する変数。
echo $#

# シェル自身のフルパス
echo $0

# シェルスクリプトに与えられた引数を格納する変数。nは1,2,3…と指定できる。
echo $n

# シェルスクリプト実行時に指定された全引数が設定される変数を格納する変数。
# デリミタを格納する環境変数 IFS にセットされた値で区切られて表示される。
echo $@

# シェルスクリプト実行時に指定された全引数が設定される変数を格納する変数。
# 出力に関してはデリミタを格納する環境変数 IFS の影響を受けない。
echo $*


