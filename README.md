# VIM package with configuration

## init vim configuration
```
sh ./install.sh
```

to:
  - move vimrc file to main directory
  - create .vim folder
  - install vim-plug

## update vim file
```
sh ./update.sh
```
to:
  - backup old vimrc file
  - move vimrc file to main directory

## to install all packages
  - enter vim
  - type :PlugInstall

## youcompleteme rust completion:
*cargo +nightly install racer*
Add *racer* to Path
Add *RUST_SRC_PATH* (lib/rustlib/src/rust/src)
```
./install.py --racer-completer
```
