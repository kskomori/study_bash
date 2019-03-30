#!/bin/bash
#--------------------------------------
#
#
#
#--------------------------------------
# 参考
# https://sousaku-memo.net/php-system/1817

# -C
#   > でリダイレクトしたときの既存ファイルへの上書き禁止
#   >| で上書きできる
# -e
#   スクリプト実行中にエラーが発生すると、そこで終了する
#   エラーは、実行したコマンドの終了ステータスで非0の値が返ってくることを指す
#   これがないと、エラーが起きても突き進む
# -u
#   未定義の変数を使うと、そこで終了する
# -o pipefail
#   パイプの途中でエラーが起きた場合もエラーが発生するようになる
#   set -e と組み合わせると、スクリプトも終了するようになる
set -Ceuo pipefail

# ロケールをデフォルトロケールにする
export LC_ALL=C
export LANG=C

function usage() {
    echo "Usage:"
    echo "  $(basename "${BASH_SOURCE[0]}") [options] [--] arg1 arg2"
    echo
    echo "Options:"
    echo "  --debug"
    echo "    Enable debug mode."
    echo "  --env (production|staging)"
    echo "    Target environment name."
    echo "  --help, -h"
    echo "    This help."
}


function error_exit() {
    {
        echo "[ERROR] $*"
        echo
        usage
    } 1>&2
    exit 1
}

# 引数の配列を定義
declare -a ARGS=()

#
IS_DEBUG="false"
ENV=


# コマンドラインオプションのパース
while (($# > 0)); do
    case "$1" in
    --help | -h)
        usage
        exit 0
        ;;
    --debug)
        IS_DEBUG="true"
        shift
        ;;
    --env)
        # 必須オプション
        if (($# < 2)) || [[ $2 =~ ^-+ ]]; then
            error_exit "Optional arguments are required -- $1"
        fi
        ENV=$2
        shift 2
        ;;
    --)
        # ダブルダッシュは以降を引数とみなす
        shift
        while (($# > 0)); do
            ARGS+=("$1")
            shift
        done
        break
        ;;
    -*)
        error_exit "Illegal option -- $1"
        ;;
    *)
        if [[ $1 != "" ]] && [[ ! $1 =~ ^-+ ]]; then
            ARGS+=("$1")
        fi
        shift
        ;;
    esac
done

# 引数の検証
# この例では引数は2つ以上、5以下
if ((${#ARGS[@]} < 2 || ${#ARGS[@]} > 5)); then
    error_exit "Insufficient number of script arguments."
fi

if [[ ! $ENV =~ ^(production|staging)$ ]]; then
    # ENVはproductionかstagingじゃないとダメ
    error_exit "Invalid argument of --env opotion -- $ENV"
fi 

# スクリプト自身のディレクトリに移動する
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
echo $(pwd)

# デバッグモードの場合はコマンド引数を表示
if [[ $IS_DEBUG == "true" ]]; then
    echo "Dump options:"
    echo "  ENV=${ENV}"
    echo "  IS_DEBUG=${IS_DEBUG}"
    echo
    echo "Dump arguments:"
    for ((i = 0; i < ${#ARGS[@]}; i++)); do
        echo '  $'"$((i + 1))=${ARGS[$i]}"
    done
    echo
fi

function sub_process() {
    echo "do something"

    echo "配列をまわしてみる"
    declare -ar array=("sub1" "sub2" "sub 3")
    echo "${array[@]}"
    i=0
    for e in "${array[@]}"; do
        echo "  array[$i] = ${e}"
        # letは最後に評価したときにゼロだと1がステータスで返る
        # 0スタートの場合、後置だとset -e をしている場合に1つ目で終了してしまう
        let ++i
    done
}

function debug_process() {
    echo "do something for debug"
}

# スクリプト終了時に呼ばれるハンドラ関数
function on_exit() {
    local exit_code=$1

    echo "do finally block..."

    exit "$exit_code"
}

function main() {
    sub_process

    if [[ $IS_DEBUG == "true" ]]; then
        debug_process
    fi
}

main
