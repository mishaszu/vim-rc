# Mishaszu VIM configuration
Configuration is made mainly for:
- Front-End Development (with Javascript, Typescript and ReasonML)
- Rust Development

## List of content
- [Installation](#installation)
    - [Rust racer installation for you complete me](#youcompleteme-for-rust)
    - [Setting up ReasonML language server](#reasonml-language-server-setup)
- [Update](#update)
- [System variables](#system-variables)
- [Useful vim commands](#useful-vim-commands)
    - [System](#system)
    - [Keybindings](#keybindings)
    - [Syntax](#syntax)

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

## System variables
1. **$REASONSERVER** - path to reason-language-server file
2. **$NERDTREE_WIDTH** - NERDTree width

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
    - `ysiw<from>`
    - opening brackets will add spacing
    - closing brackets won't add spacing
- run **prettier**
    - `<leader>p`
