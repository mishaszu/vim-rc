" init all plugins with vim-plug
call plug#begin('~/.vim/bundle')

  " Vim functionality
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'wakatime/vim-wakatime'
  Plug 'tpope/vim-fugitive'

  " Linting & Completion Plugins
  Plug 'w0rp/ale', {
  \ 'for': ['rust', 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \}
  Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \}
  Plug 'Valloric/YouCompleteMe', {
  \ 'do': './install.py --racer-completer && ./install.py --skip-build --ts-completer',
  \ 'for': ['rust']
  \}

  " Syntax Plugins
  Plug 'markvincze/panda-vim'
  Plug 'sickill/vim-monokai'
  Plug 'mhartington/oceanic-next'
  Plug 'dracula/vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Yggdroot/indentLine'
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-surround'
  Plug 'luochen1990/rainbow'

  " Rust Plugins
  Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
  Plug 'racer-rust/vim-racer', { 'for': ['rust'] }
  
  " Javascript Plugins
  " Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'typescript', 'json'] }
  Plug 'pangloss/vim-javascript', {'for': ['javascript', 'typescript', 'json']}
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'typescript', 'json'] }
  Plug 'othree/javascript-libraries-syntax.vim', {'for' : ['javascript', 'typescript']}
  Plug 'othree/yajs.vim', {'for' : ['javascript', 'typescript']}
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ 'for': ['javascript', 'typescript']
      \ }

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

" turn on syntax
  syntax on
  colorscheme dracula

" file encoding
  set encoding=UTF-8

" enable vim for single projects
  set exrc
  set secure

" Basic setup
  set shell=sh
  set binary
  set noeol
  set history=700
  set autoread
  set ruler
  set t_Co=256
  set number
  set backspace=indent,eol,start
  filetype plugin on
  set omnifunc=syntaxcomplete#Complete
  set mouse=v
  set clipboard=unnamed

" Searching
  set hlsearch
  set incsearch
  set ignorecase
  set smartcase

" Indentation
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set smarttab
  set autoindent
  set conceallevel=1

" close preview window from omnicompletion
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" set jsdoc's files as javascript
  autocmd BufEnter *.jsdoc :setlocal filetype=javascript

" Plugins

  " vim-javascrpit
    let g:javascript_conceal_function             = "ƒ"
    let g:javascript_conceal_null                 = "ø"
    let g:javascript_conceal_this                 = "@"
    let g:javascript_conceal_return               = "⇚"
    let g:javascript_conceal_undefined            = "¿"
    let g:javascript_conceal_NaN                  = "ℕ"
    let g:javascript_conceal_prototype            = "¶"
    let g:javascript_conceal_static               = "•"
    let g:javascript_conceal_super                = "Ω"
    " let g:javascript_conceal_arrow_function       = "⇒"

  " language server
    let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio']
    \ }

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
    au FileType rust nmap gd <Plug>(rust-def)
    au FileType rust nmap gs <Plug>(rust-def-split)
    au FileType rust nmap gx <Plug>(rust-def-vertical)
    au FileType rust nmap <leader>gd <Plug>(rust-doc)

  " # ALE
    let g:ale_completion_enabled = 1
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

  " # devicons
    let g:airline_powerline_fonts = 1"
    set guifont=DroidSansMono_Nerd_Font:h11

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

" Keymappings
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


    "Now, <leader>l opens a menu showing all possible things you can do with language server.
    "K shows the available documentation when possible
    "gd jumps to where the symbol under the cursor has been first defined
    ""<leader>r rename the symbol under cursor

nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>

