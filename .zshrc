# anyenv用
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# 工事中
export PATH="/bin:/usr/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# archの切り替え
if (( $+commands[arch] )); then
	alias x64='exec arch -arch x86_64 "$SHELL"'
	alias a64='exec arch -arch arm64e "$SHELL"'
fi

# no matches foundの解消のため
setopt nonomatch
