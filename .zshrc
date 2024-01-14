# Alias
alias hist='history | grep'
alias hist0='history 0 | grep'

# anyenv用
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Homebrew経由でインストールしたGitを使うためにPATHを通す
export PATH="/opt/homebrew/bin:$PATH"

# archの切り替え
if (( $+commands[arch] )); then
	alias x64='exec arch -arch x86_64 "$SHELL"'
	alias a64='exec arch -arch arm64e "$SHELL"'
fi

# no matches foundの解消のため
setopt nonomatch

# 複数のシェルセッション間でコマンド履歴を共有する
setopt SHARE_HISTORY