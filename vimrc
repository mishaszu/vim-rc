" init all plugins with vim-plug
call plug#begin('~/.vim/bundle')

    " Vim functionality
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'wakatime/vim-wakatime'

    " Git
    " Plug 'tpope/vim-fugitive'

    " Code completion, linting and fixing
    Plug 'Valloric/YouCompleteMe', {
    \ 'do': './install.py --racer-completer && ./install.py --skip-build --ts-completer',
    \ 'for': 'rust'
    \}
    Plug 'w0rp/ale', {
    \ 'for': ['rust', 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
    \}
    Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['rust', 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
    \}

    " Syntax
    Plug 'markvincze/panda-vim'
    Plug 'skielbasa/vim-material-monokai'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Yggdroot/indentLine'
    Plug 'Raimondi/delimitMate'
    Plug 'tpope/vim-surround'

    " Rust plugins
    Plug 'racer-rust/vim-racer', { 'for': 'rust'}
    Plug 'rust-lang/rust.vim', { 'for': 'rust'}
    Plug 'Chiel92/vim-autoformat', { 'for': 'rust'}
    
    " Frontend plugins
    Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'typescript', 'json']}
    Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'typescript', 'json']}
    Plug 'othree/html5.vim', { 'for': ['javascript', 'typescript', 'json', 'css', 'scss']}
    Plug 'ap/vim-css-color', { 'for': ['javascript', 'typescript', 'json', 'css', 'scss']}
    Plug 'leafgarland/typescript-vim', { 'for': ['javascript', 'typescript', 'json']}
    Plug 'mxw/vim-jsx', { 'for': ['javascript', 'typescript', 'json']}
    Plug 'peitalin/vim-jsx-typescript', { 'for': ['javascript', 'typescript', 'json']}

    " ReasonML
    Plug 'reasonml-editor/vim-reason-plus', { 'for': ['reason']}
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ 'for': ['reason']
    \}

    " JSON
    Plug 'elzr/vim-json', { 'for': ['json'] }

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

" Basic setup
    set binary
    set noeol
    set history=700
    set autoread
    set ruler
    set t_Co=256
    set number
    set backspace=indent,eol,start
    filetype plugin on

" Searching
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

" Indentation
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
    set autoindent

" Enable clipboard
    set clipboard=unnamedplus

" Variable for Rust completion
    let g:ycm_rust_src_path = $RUST_SRC_PATH

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

    " # Racer
        let g:racer_cmd = $RACER_SRC_PATH
        let g:racer_experimental_completer = 1

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
        \   'css': ['prettier'],
        \   'scss': ['prettier'],
        \   'typescript': ['prettier', 'tslint'],
        \   'javascript': ['prettier', 'eslint']
        \}
        let g:ale_fix_on_save = 1
        let g:ale_echo_cursor = 0
        let g:airline#extensions#ale#enabled = 1
        let g:ale_rust_cargo_use_check = 1

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

    " # prettier
        let g:prettier#config#tab_width = 4
        let g:prettier#config#print_width = 120
        let g:prettier#config#single_quote = 'true'
        let g:prettier#config#bracket_spacing = 'true'
        let g:prettier#exec_cmd_async = 1

" Keymappings
    " next NERDTree tab
    map <C-l> :tabn<CR>
    " previous NERDTree tab
    map <C-h> :tabp<CR>
    " toggle NERDTree open/close
    map <C-n> :NERDTreeToggle<CR>
    " split window vertically
    map <C-a> :vsplit<cr>
    " prettier with Ale
    map <C-f> :ALEFix<CR>
    " use Ctrl-k and Ctrl-j to jump up and down between errors
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
