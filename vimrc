" Init pathogen"
  execute pathogen#infect()

" turn on syntax"
  syntax on
  colorscheme ramda

" file encoding"
  set encoding=utf-8

" basic setup"
  set binary
  set noeol
  set history=700
  set autoread
  set ruler
  set hlsearch
  set incsearch
  set t_Co=256
  set number

" Indentation"
  set tabstop=2
  set shiftwidth=2
  set expandtab

" Plugins

  " # Nerdtree
  :let g:NERDTreeWinSize=60"

  " # Rust.vim
  let g:rustfmt_autosave = 1

  " # Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

" Auto bracket
  inoremap " ""<left>
  inoremap ' ''<left>
  inoremap ( ()<left>
  inoremap [ []<left>
  inoremap { {}<left>
  inoremap {<CR> {<CR>}<ESC>O
  inoremap {;<CR> {<CR>};<ESC>O
