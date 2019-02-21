# Mishaszu VIM configuration
Configuration is made mainly for:
- Front-End Development (with Javascript, Typescript and ReasonML)
- Rust Development

## List of content
- [Installation](#installation)
    - [Setting up Rust for VIM](#rust-setup-with-youcompleteme-and-ale)
    - [Setting up ReasonML language server](#reasonml-language-server-setup)
- [Update](#update)
- [System variables](#system-variables)
- [Useful vim commands](#useful-vim-commands)
    - [System](#system)
    - [Keybindings](#keybindings)
    - [Syntax](#syntax)
- [Plugins description](#plugins-description)

## Installation
1. **Installation command** for:
    - move vimrc file to main directory
    - create .vim folder
    - install vim-plug
```sh
sh ./install.sh
```

2. **Set System Variables** [look here](#system-variables)

3. **Plugins Installation**
```sh
vim -c PlugInstall
```
## Update
1. **Update command** for
    - backup old vimrc file
    - move vimrc file to $HOME directory as *.vimrc*
```
sh ./update.sh
```

2. **Install new plugins** (if there are some new)
```sh
vim -c PlugInstall
```

3. **Update plugins**
```sh
vim -c PlugUpdate
```

## Rust setup with `YouCompleteMe` and `ALE`
1. Install `Rust` with `rustup`
2. Install nightly build
```sh
rustup toolchain add nightly
```
3. Install racer:
```sh
cargo +nightly install racer
```
4. Add RUST_SRC_PATH variable
```bash
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
```
5. Vim-Plug should run installation with racer completer if not:
6. Run YCM installation with Rust parameter manually
```sh
./install.py --racer-completer
```
7. Add RACER_SRC_PATH
```bash
export RACER_SRC_PATH=$HOME/.cargo/bin/racer
```
8. Add rust-src
```sh
rustup component add rust-src
```
9. Add rustfmt
```sh
rustup component add rustfmt
```
10. For Rust errors and warnings `vim` needs `ALE` plugin
11. For completion details as function interface use `vim-racer` plugin with <C-x><C-o> in insert mode.

## ReasonML language server setup
1. Get Language server:
    1. [Instruction website](https://github.com/jaredly/reason-language-server#vim)
    2. [Download website](https://github.com/jaredly/reason-language-server/releases)
    3. Place *reason-language-server.exe* in your dedicated directory (yes it's *.exe* even for macos and linux)
    4. Set *$REASONSERVER* system variable with path to server
2. Get Client (installed via Vim-plug)

## System variables
1. **$REASONSERVER** - path to `reason-language-server` file
2. **$NERDTREE_WIDTH** - `NERDTree` width
3. $RUST_SRC_PATH - path to `Rust` lib
4. $RACER_SRC_PATH - path to `Racer` executable

## Useful vim commands
### Legend
- `<leader>` = "\\"
- `<C-(some key)>` = C stands for ctrl

### System
1. print system variables
    - `:echo $`
    - press: `ctrl + d`

### Keybindings
1. switch to next NERDTree tab
    - `ctrl + l`
2. switch to previous NERDTree tab
    - `ctrl + h`
3. toggle NERDTree
    - `ctrl + n`
4. focus NERDTree (unfortunately it's resizing split windows)
    - `ctrl + f`
5. split window vertically
    - `ctrl + a`

### Syntax
- **comment** text selected in visual mode
    - `<leader>cc`
- **comment** current or selected line text with single comment
    - `<leader>c<space>`
- switch **surroundings**
    - `cs<from><to>`
    - for example `cs'"` = from *'* to *"*
- delete **surroundings**
    - `ds<from>`
- **surround** text under cursor
    - `ysiw<to>`
    - opening brackets will add spacing
    - closing brackets won't add spacing
- **surround** text selected in visual mode
    - `S<to>`
- run **prettier**
    - `<leader>p`

## Plugins description
- `scrooloose/nerdtree` - vim file tree
- `vim-airline/vim-airline` - extra menu (bottom bar) with usful informations
- `ryanoasis/vim-devicons` - extra icons for `vim-airline`
- `wakatime/vim-wakatime` - time managment plugin for [wakatime](https://wakatime.com)
- `tpope/vim-fugitive` - plugin for git integration
- `Valloric/YouCompleteMe` - multilanguages server for code completion
- `w0rp/ale` - code completion, fixing, linting for errors and warnings
- `prettier/vim-prettier` - plugin for auto formating code
- `markvincze/panda-vim` - [panda](https://panda.siamak.work/) syntax in vim
- `skielbasa/vim-material-monokai` - vim sytax plagin based on `material-monokai`
- `scrooloose/nerdcommenter` - plugin for commenting code
- `Yggdroot/indentLine` - showing lines indentation
- `Raimondi/delimitMate` - autobracketing
- `tpope/vim-surround` - for brackets and surroundings management
- `racer-rust/vim-racer` - `racer` integration for vim only for extra completion informations
- `rust-lang/rust.vim` - `rust` syntax in vim
- `Chiel92/vim-autoformat` - plugin for auto rust formating
- `pangloss/vim-javascript` - `javascript` sytax in vim
- `jelera/vim-javascript-syntax` - `javascript` sytax in vim
- `othree/html5.vim` - `html` sytax in vim
- `ap/vim-css-color` - displaying css color in terminal
- `leafgarland/typescript-vim` - `typescript` sytax in vim
- `mxw/vim-jsx` - `jsx` sytax in vim
- `peitalin/vim-jsx-typescript` - `tsx` sytax in vim
- `reasonml-editor/vim-reason-plus` - `reasonML` sytax in vim
- `autozimu/LanguageClient-neovim` - `reasonML` language server for code completion
- `elzr/vim-json` - `json` sytax in vim

