" init all plugins with vim-plug
call plug#begin('~/.vim/plugged')

    " Vim functionality
    Plug 'w0rp/ale'
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'Raimondi/delimitMate'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-surround'
    Plug 'wakatime/vim-wakatime'
    Plug 'Valloric/YouCompleteMe'

    " Syntax
    Plug 'markvincze/panda-vim'

    " Rust plugins
    Plug 'rust-lang/rust.vim'
    
    " Frontend plugins
    Plug 'pangloss/vim-javascript'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'othree/html5.vim'
    Plug 'ap/vim-css-color'
    Plug 'leafgarland/typescript-vim'
    Plug 'mxw/vim-jsx'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'skielbasa/vim-material-monokai'
    Plug 'reasonml-editor/vim-reason-plus'


    " JSON
    Plug 'elzr/vim-json'

call plug#end()

" turn on syntax
    syntax on
    colorscheme panda

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
        let g:NERDTreeWinPos = "right"
        let NERDTreeWinSize=26

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
        let g:ale_fixers = {
        \   'javascript': ['prettier'],
        \   'css': ['prettier'],
        \}

    " # devicons
        let g:airline_powerline_fonts = 1"
        set guifont=DroidSansMono_Nerd_Font:h11

