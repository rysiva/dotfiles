#!/bin/bash

# Variables
REPO_URL="https://github.com/rysiva/dotfiles.git"
DOTFILES_DIR="$HOME/workspace/dotfiles"
BREWFILE="$DOTFILES_DIR/Brewfile"
ZSHRC="$DOTFILES_DIR/.zshrc"
GITCONFIG="$DOTFILES_DIR/.gitconfig"

# 1. Xcode Command Line Toolsのインストール
echo "Installing Xcode Command Line Tools..."
xcode-select --install

# 2. Homebrewのインストール
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. dotfilesリポジトリをクローン
echo "Cloning dotfiles repository..."
git clone $REPO_URL $DOTFILES_DIR

# 4. Brewfileを使ってHomebrewパッケージをインストール
echo "Installing packages from Brewfile..."
brew bundle --file=$BREWFILE

# 5. シンボリックリンクの作成
echo "Creating symbolic links..."
ln -sf $ZSHRC $HOME/.zshrc
ln -sf $GITCONFIG $HOME/.gitconfig

# 6. シェルをZshに変更
echo "Changing shell to Zsh..."
chsh -s /bin/zsh

# 7. anyenvのインストールと初期化
echo "Initializing anyenv..."
if [ ! -d "$HOME/.anyenv" ]; then
  git clone https://github.com/anyenv/anyenv ~/.anyenv
  ~/.anyenv/bin/anyenv init
fi

# 8. nodenvのインストールと初期化
echo "Installing nodenv..."
if [ ! -d "$HOME/.nodenv" ]; then
  anyenv install nodenv
  eval "$(nodenv init -)"
fi

# 9. Zshの再読み込み
echo "Reloading Zsh configuration..."
source $HOME/.zshrc

echo "Setup complete! Please restart your terminal."
