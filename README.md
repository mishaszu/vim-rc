# VIM package with configuration

## master you configuration
**on master branch run:**
```
sh ./install.sh
```

to:
  - move vimrc file to main directory
  - create .vim folder
  - install pathogen

## bundle your bundles
**on bundle branch:**

1) move to .vim folder
2) clone repo
```
git clone https://github.com/mishaszu/vim-bundle.git
```
3) checkout branch
```
git checkout bundle
```
4) init all submodules
```
git submodule update --init
```

to update all submodules just type:
```
git submodule update
```
