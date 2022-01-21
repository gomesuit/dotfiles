install rcm:

```bash
brew install rcm
```

install the dotfiles:
```bash
env RCRC=$PWD/rcrc rcup -d $PWD
```

ex)
```bash
mkrc .vimrc
rcdn .vimrc
lsrc -d $PWD # dry-run
```

- https://github.com/thoughtbot/dotfiles

初めにインストールするときは下記のコマンドを実行する

```bash
cd ~/.vim/bundle/vimproc.vim
git pull
make
```
