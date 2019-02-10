" init all plugins with vim-plug
call plug#begin('~/.vim/plugged')

    " Vim functionality
    Plug 'w0rp/ale'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-surround'
    Plug 'wakatime/vim-wakatime'
    Plug 'Valloric/YouCompleteMe', {
    \ 'do': './install.py --racer-completer'
    \}

    " Git
    Plug 'tpope/vim-fugitive'

    " Syntax
    Plug 'markvincze/panda-vim'
    Plug 'skielbasa/vim-material-monokai'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Yggdroot/indentLine'
    Plug 'Raimondi/delimitMate'
    Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }


    " Rust plugins
    Plug 'rust-lang/rust.vim', { 'for': 'Rust'}
    Plug 'Chiel92/vim-autoformat', { 'for': 'Rust'}
    
    " Frontend plugins
    Plug 'pangloss/vim-javascript'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'othree/html5.vim'
    Plug 'ap/vim-css-color'
    Plug 'leafgarland/typescript-vim'
    Plug 'mxw/vim-jsx'
    Plug 'peitalin/vim-jsx-typescript'

    " ReasonML
    Plug 'reasonml-editor/vim-reason-plus', { 'for': 'reason'}
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ 'for': 'reason'
    \ }

    " JSON
    Plug 'elzr/vim-json'

call plug#end()

" basic configuration
    set shell=sh

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
    filetype plugin on

" Indentation
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent 

" Plugins

    " # Nerdtree
        let g:NERDTreeWinPos = 'right'
        let g:NERDTreeWinSize=$NERDTREE_WIDTH
        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
        let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }

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
    
    " # vim-autoformat
        let g:formatdef_rustfmt = '"rustfmt"'
        let g:formatters_rust = ['rustfmt']

    " # vim-reason-plus
        let g:LanguageClient_serverCommands = {
            \ 'reason': ['$REASONSERVER']
            \ }
    " # nerdcommenter
        let g:NERDSpaceDelims = 1
        let g:NERDCommentEmptyLines = 1
        let g:NERDTrimTrailingWhitespace = 1

" Keymappings
    " next NERDTree tab
    map  <C-l> :tabn<CR>
    " previous NERDTree tab
    map  <C-h> :tabp<CR>
    " toggle NERDTree open/close
    map  <C-n> :NERDTreeToggle<CR>
    " focus NERDTree
    map  <C-f> :NERDTree<CR>
    " split window vertically
    map  <C-a> :vsplit<CR>

