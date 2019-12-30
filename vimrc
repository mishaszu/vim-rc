"""---PLUGINS CONFIG---"
"""---VIM PLUG---"
call plug#begin('~/.vim/bundle')

  " Vim functionality
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'wakatime/vim-wakatime'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'

  " Linting & Completion Plugins
  Plug 'w0rp/ale', {
  \ 'for': ['rust', 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \}

  Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \}

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'ycm-core/YouCompleteMe', {
  " \  'do': './install.py --ts-completer',
  " \  'for': ['javascript', 'typescript']
  " \}

  " Syntax Plugins
  Plug 'markvincze/panda-vim'
  Plug 'sickill/vim-monokai'
  Plug 'dracula/vim'
  Plug 'Yggdroot/indentLine' "Indendation
  Plug 'Raimondi/delimitMate' "Matching closing brackets
  Plug 'tpope/vim-surround' "Managing surrondings like brackets
  Plug 'luochen1990/rainbow' "Coloring brackets

  " Rust Plugins
  Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
  Plug 'racer-rust/vim-racer', { 'for': ['rust'] }
  
  " Javascript Plugins
  " Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'typescript', 'json'] }
  Plug 'pangloss/vim-javascript', {'for': ['javascript', 'typescript', 'json']}
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'typescript', 'json'] }
  Plug 'othree/javascript-libraries-syntax.vim', {'for' : ['javascript', 'typescript']}
  Plug 'othree/yajs.vim', {'for' : ['javascript', 'typescript']}

  " Typescript Plugins
  Plug 'leafgarland/typescript-vim', { 'for': ['javascript', 'typescript', 'json'] }
  Plug 'peitalin/vim-jsx-typescript', { 'for': ['javascript', 'typescript', 'json'] }

  " HTML Plugins
  Plug 'mattn/emmet-vim'
  Plug 'othree/html5.vim', { 'for': ['html', 'javascript', 'typescript', 'json', 'css', 'scss'] }
  Plug 'mustache/vim-mustache-handlebars'

  "CSS Plugins
  Plug 'ap/vim-css-color', { 'for': ['javascript', 'typescript', 'json', 'css', 'scss'] }

  " JSON Plugins
  Plug 'elzr/vim-json', { 'for': ['json'] }

call plug#end()

"""---GENERAL CONFIGURATION---"""
  "syntax
    syntax on "enable syntax highlight
    set t_Co=256 "set color scheme
    colorscheme dracula
    filetype plugin on
  "config
    set encoding=UTF-8
    set exrc "enable .vimrc file per project
    set secure
    set shell=sh
    set binary
    set noeol "No extra line on end of file
    set history=700 "commands history
    set autoread "Automatically re-read ﬁles if unmodiﬁed inside Vim
    set hidden 
    set ruler "Always show cursor position
    set number "Show line numbers
    set relativenumber "Show relative cursor line number position
    set backspace=indent,eol,start "allow backspace between lines and over indentation
    set mouse=v
    set clipboard=unnamed
    set conceallevel=1
    set visualbell "Flesh screen instead of running bell sound
    set cursorline "Mark cursor line
    set title "set window title as current file name
    set scrolloff=5 "number of line above and under cursor
    set confirm "display confirm modal when closing unsave file
  "search
    set hlsearch "highlight search
    set incsearch "incremental search
    set ignorecase "ignore case sensitive
    set smartcase "ignore case sensitive till Upper case used
  "indent
    set tabstop=4 "tab as 4 spaces
    set softtabstop=4
    set shiftwidth=4 "when indent with > insert 4 spaces
    set expandtab "on pressing tab insert spaces
    set smarttab
    set autoindent
  "omnicompletion
    set omnifunc=syntaxcomplete#Complete
    " close preview window from omnicompletion
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    " set jsdoc's files as javascript
    autocmd BufEnter *.jsdoc :setlocal filetype=javascript

"""---PLUGINS CONFIGURATION---"""
  " # Nerdtree
    let g:NERDTreeWinPos = 'right'
    let g:NERDTreeWinSize=$NERDTREE_WIDTH
    let g:NERDTreeDirArrowExpandable = '↑'
    let g:NERDTreeDirArrowCollapsible = '↓'
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  " # Rust.vim
    let g:rustfmt_autosave = 1
  " # Racer
    let g:racer_cmd = $RACER_SRC_PATH
    let g:racer_experimental_completer = 1
    au FileType rust nmap gd <Plug>(rust-def)
    au FileType rust nmap gs <Plug>(rust-def-split)
    au FileType rust nmap gx <Plug>(rust-def-vertical)
    au FileType rust nmap <leader>gd <Plug>(rust-doc)
  " # ALE
    let g:ale_completion_enabled = 0
    let g:ale_fixers = {
    \ 'css': ['prettier'],
    \ 'scss': ['prettier'],
    \ 'typescript': ['prettier', 'eslint'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'html': ['prettier']
    \}
    let g:ale_fix_on_save = 1
    let g:ale_echo_cursor = 1
    let g:airline#extensions#ale#enabled = 1
    let g:ale_rust_cargo_use_check = 1
    set completeopt+=noinsert
    "let g:ale_sign_error = '>'
    "let g:ale_sign_warning = '-'
    "highlight ALEErrorSign ctermbg=NONE ctermfg=red
    "highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
  " # devicons
    let g:airline_powerline_fonts = 1"
  " # nerdcommenter
    let g:NERDSpaceDelims = 1
    let g:NERDCommentEmptyLines = 1
    let g:NERDTrimTrailingWhitespace = 1
  " # prettier
    let g:prettier#config#tab_width = 2
    let g:prettier#config#print_width = 80
    let g:prettier#config#single_quote = 'true'
    let g:prettier#config#bracket_spacing = 'true'
    let g:prettier#exec_cmd_async = 1
  " # rainbow_parentheses 
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \	'operators': '_,_',
    \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \	'separately': {
    \		'*': {},
    \		'tex': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \		},
    \		'lisp': {
    \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \		},
    \		'vim': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \		},
    \		'html': {
    \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \		},
    \		'css': 0,
    \	}
    \}
  " # emmet
  let g:user_emmet_leader_key=','

"""---KEY MAPPINGS---"""
  " switch up VIM window
  nmap <silent> <A-Up> :wincmd k<CR>
  " switch to down VIM window
  nmap <silent> <A-Down> :wincmd j<CR>
  " switch to left VIM window
  nmap <silent> <A-Left> :wincmd h<CR>
  " swicth to right VIM window
  nmap <silent> <A-Right> :wincmd l<CR>
  " switch up VIM window
  nmap <silent> <A-k> :wincmd k<CR>
  " switch to down VIM window
  nmap <silent> <A-j> :wincmd j<CR>
  " switch to left VIM window
  nmap <silent> <A-h> :wincmd h<CR>
  " swicth to right VIM window
  nmap <silent> <A-l> :wincmd l<CR>
  " next NERDTree tab
  map <silent> <C-l> :tabn<CR>
  " previous NERDTree tab
  map <silent> <C-h> :tabp<CR>
  " toggle NERDTree open/close
  map <C-n> :NERDTreeToggle<CR>
  " split window vertically
  map <C-a> :vsplit<cr>
  " split window horizontally
  nmap <C-q> :split<CR>
  " prettier with Ale
  map <C-f> :ALEFix<CR>
  " save file
  nmap <C-s> :w<CR>
  " use Ctrl-k and Ctrl-j to jump up and down between errors
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  " search under cursosr
  vnoremap // y/<C-R>"<CR>
