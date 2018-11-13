" Init pathogen
  execute pathogen#infect()

" turn on syntax
  syntax on
  colorscheme ramda

" file encoding
  set encoding=UTF-8

" enable vim for single projects
  set exrc
  set secure

" basic setup
  set binary
  set noeol
  set history=700
  set autoread
  set ruler
  set hlsearch
  set incsearch
  set t_Co=256
  set number
  set backspace=indent,eol,start

" Indentation
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab
  set autoindent 

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

  " # ALE
    let g:ale_completion_enabled = 1

  " # devicons
    let g:airline_powerline_fonts = 1"
    set guifont=DroidSansMono_Nerd_Font:h11

  " # vim-prettier
    let g:prettier#exec_cmd_async = 1
    " let g:prettier#autoformat = 1
    " let g:prettier#config#bracket_spacing = 'true'
    " let g:prettier#config#trailing_comma = 'all'
    " autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml Prettier


" Auto bracket
  inoremap " ""<left>
  inoremap ' ''<left>
  inoremap ( ()<left>
  inoremap [ []<left>
  inoremap { {}<left>
  inoremap {<CR> {<CR>}<ESC>O
  inoremap {;<CR> {<CR>};<ESC>O

" packages helpers
  " Load all plugins now.
  " Plugins need to be added to runtimepath before helptags can be generated.
  packloadall
  " Load all of the helptags now, after plugins have been loaded.
  " All messages and errors will be ignored.
  silent! helptags ALL"
