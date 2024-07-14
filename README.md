# dotfiles

## 管理方法

```sh
# ~/.zshrc の場合

# オリジナルはdotfiles配下に配置する
$ mv ~/.zshrc ~/dotfiles

# ホームディレクトリに向けてシンボリックリンクを貼る
$ ln -s ~/dotfiles/.zshrc ~/.zshrc

```

## 参考

[【初心者版】必要最小限のdotfilesを運用する](https://qiita.com/ganyariya/items/d9adffc6535dfca6784b)  
[dotfilesの管理を楽にする話](https://zenn.dev/tkomatsu/articles/d7d089acd29cfa4d57b4)  
[.gitconfig に include で設定を読み込めるようになった](https://coderwall.com/p/z8m3mq/gitconfig-include)  
[Brew Bundleの使い方](https://gist.github.com/yoshimana/43b9205ddedad0ad65f2dee00c6f4261)  

## その他環境構築時の留意事項

- 旧Macからkarabinerの設定をインポート。以下のファイルをコピーして同じ場所に配置する
`~/.config/karabiner/karabiner.json`
- VSCodeのカラーテーマが同期されないかも
- terminalのフォントサイズは18
- キーボード > キーボードショートカット > 修飾キー > Caps LockをControlへ割り当て
  - Functionキーも変更
  - 入力ソース > 前の入力ソースを選択をオフ
  - キーボード > 次の操作ウィンドウを操作対象にするをoption + tab
