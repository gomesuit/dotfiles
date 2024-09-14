# Install rcm

```bash
brew install rcm
```

# Install tmux

```bash
$ brew install tmux reattach-to-user-namespace
```

# Setup the dotfiles

```bash
env RCRC=$PWD/rcrc rcup -d $PWD
```

# How to setup a new dotfile

```bash
mkrc .vimrc
rcdn .vimrc
lsrc -d $PWD # dry-run
```

# etc

```bash
$ brew install starship font-hack-nerd-font
$ brew install neovim
$ brew install ripgrep
$ brew install fd
```

# References

- https://github.com/thoughtbot/dotfiles
