export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
export PATH="/usr/local/opt/bison@2.7/bin:$PATH"
export ICU_CFLAGS="$ICU_CFLAGS -DU_DEFINE_FALSE_AND_TRUE=1"
export CXXFLAGS="-DU_DEFINE_FALSE_AND_TRUE=1"
export CFLAGS="-DU_DEFINE_FALSE_AND_TRUE=1"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/bin:/usr/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# for ((i=2;i<256;i++))
# do
#     sudo ifconfig lo0 alias 127.0.0.$i up
# done

export PS1="%C %n %# "

export CLICOLOR=1


function left-prompt {
    name_t='179m%}'      # user name text color
    name_b='000m%}'    # user name background color
    path_t='255m%}'     # path text color
    path_b='031m%}'   # path background color
    arrow='087m%}'   # arrow color
    text_color='%{\e[38;5;'    # set text color
    back_color='%{\e[30;48;5;' # set background color
    reset='%{\e[0m%}'   # reset
    sharp="\uE0B0"      # triangle

    user="${back_color}${name_b}${text_color}${name_t}"
    dir="${back_color}${path_b}${text_color}${path_t}"
    echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}> ${reset}"
}

PROMPT=`left-prompt`

# コマンドの実行ごとに改行
function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}


# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
    local branch_name st branch_status

    branch='\ue0a0'
    color='%{\e[38;5;' #  文字色を設定
    green='114m%}'
    red='001m%}'
    yellow='227m%}'
    blue='033m%}'
    reset='%{\e[0m%}'   # reset

    color='%{\e[38;5;' #  文字色を設定
    green='114m%}'

    # ブランチマーク
    if [ ! -e  ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
    fi
    branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${color}${green}${branch}"
    elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${color}${red}${branch}?"
    elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="${color}${red}${branch}+"
    elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="${color}${yellow}${branch}!"
    elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
    else
    # 上記以外の状態の場合
    branch_status="${color}${blue}${branch}"
    fi

    # ブランチ名を色付きで表示する
    echo "${branch_status}$branch_name${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

if (( $+commands[arch] )); then
	alias x64='exec arch -arch x86_64 "$SHELL"'
	alias a64='exec arch -arch arm64e "$SHELL"'
fi

# no matches foundの解消のため
setopt nonomatch
