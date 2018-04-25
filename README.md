install rcm:

```bash
brew tap thoughtbot/formulae
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
lsrc # dry-run
```

- https://github.com/thoughtbot/dotfiles
