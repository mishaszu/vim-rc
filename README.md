# VIM package with configuration

## List of content
- [Installation](#installation)
    - [Rust racer installation for you complete me](#YouCompleteMe-for-Rust)
    - [Setting up ReasonML language server](#ReasonML-language-server-setup)
- [Update](#update)

## Installation
1. **Installation command**
```sh
sh ./install.sh
```
*this command will:*
- move vimrc file to main directory
- create .vim folder
- install vim-plug
2. **Plugins Installation**
  - enter vim
  - type :PlugInstall
or
  - vim -c PlugInstall

### YouCompleteMe for Rust
1. Install nightly build
2. Install racer:
```sh
cargo +nightly install racer
```
3. Add racer to PATH
    - $HOME/.cargo/bin/racer
4. Add RUST_SRC_PATH to PATH
    - /lib/rustlib/src/rust/src
5. Vim-Plug should run installation with racer completer if not: 
6. Run YCM installation with Rust parameter manually
```sh
./install.py --racer-completer
```

### ReasonML language server setup
1. Get Language server:
    1.  [Instruction website](https://github.com/jaredly/reason-language-server#vim)
    2. [Download website](https://github.com/jaredly/reason-language-server/releases)
    3. Place *reason-language-server.exe* in your dedicated directory (yes it's *.exe* even for macos and linux)
    4. Set *$REASONSERVER* system variable with path to server
2. Get Client (installed via Vim-plug)

## Update
1. **Update command**
```
sh ./update.sh
```
*this command will:*
  - backup old vimrc file
  - move vimrc file to main directory
2. **Install new plugins** (if there are some)
  - enter vim
  - type :PlugInstall
or
  - vim -v PlugInstall

3. **Update plugins**
  - enter vim
  - type 

## System variables
1. **$REASONSERVER** - path to reason-language-server file
2. **$NERDTREE_WIDTH** - NERDTree width
  
