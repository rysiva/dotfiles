# dotfiles 管理方法

```sh
# ~/.zshrc の場合

# オリジナルはdotfiles配下に配置する
$ mv ~/.zshrc ~/dotfiles

# ホームディレクトリに向けてシンボリックリンクを貼る
$ ln -s ~/dotfiles/.zshrc ~/.zshrc

```

# 参考
https://qiita.com/ganyariya/items/d9adffc6535dfca6784b
https://zenn.dev/tkomatsu/articles/d7d089acd29cfa4d57b4
https://coderwall.com/p/z8m3mq/gitconfig-include