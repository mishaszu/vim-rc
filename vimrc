"---PLUGINS CONFIG---"
"""---VIM PLUG---"
call plug#begin('~/.vim/bundle')

  " Vim functionality
  Plug 'gcmt/taboo.vim'  " naming tabs
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'ryanoasis/vim-devicons' " support for devicons
  Plug 'scrooloose/nerdtree' " Project tree
  Plug 'stegtmeyer/find-complete' " auto complete file paths
  Plug 'tpope/vim-commentary' " vim comments
  Plug 'suy/vim-context-commentstring' " for vim comments
  " Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-fugitive' " git integration
  Plug 'vim-airline/vim-airline' " Status line
  Plug 'xolox/vim-misc' " for vim session
  Plug 'xolox/vim-session'  " saving session
  Plug 'github/copilot.vim'

  " DB tool
  " vim-dadbod 
  " Plug 'tpope/vim-dadbod'  " plugin for interacting with databases

  " Linting & Completion Plugins
  " Plug 'w0rp/ale', {
  " \ 'for': ['rust', 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  " \}

  Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['rust', 'javascript', 'reason', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  \}

  " Plugin for language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Syntax Plugins
  Plug 'Mizux/vim-colorschemes'
  Plug 'Raimondi/delimitMate' "Matching closing brackets
  Plug 'Yggdroot/indentLine' "Indendation
  Plug 'arzg/vim-colors-xcode'
  Plug 'dracula/vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'luochen1990/rainbow' "Coloring brackets
  Plug 'markvincze/panda-vim'
  Plug 'matveyt/vim-modest' 
  Plug 'sickill/vim-monokai'
  Plug 'tpope/vim-surround' "Managing surrondings like brackets
  Plug 'tpope/vim-unimpaired' " finding for exmaple next error
  Plug 'cespare/vim-toml'
  Plug 'franbach/miramare'

  " Rust Plugins
  Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
  
  " Javascript Plugins
  Plug 'mxw/vim-jsx', {'for': ['javascript', 'typescript', 'json']}
  Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'typescript', 'json']}
  Plug 'othree/yajs.vim', {'for': ['javascript', 'typescript', 'json']}
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'typescript', 'json']}
  Plug 'ruanyl/vim-sort-imports', {'for': ['javascript', 'typescript']}

  " Typescript Plugins
  Plug 'leafgarland/typescript-vim', {'for': ['javascript', 'typescript', 'json']} 
  Plug 'peitalin/vim-jsx-typescript', {'for': ['javascript', 'typescript', 'json']}
  Plug 'ianks/vim-tsx'

  " HTML Plugins
  Plug 'mattn/emmet-vim'
  Plug 'othree/html5.vim', { 'for': ['html', 'javascript', 'typescript', 'json', 'css', 'scss'] }
  Plug 'mustache/vim-mustache-handlebars', { 'for': ['html', 'javascript', 'typescript', 'json', 'css', 'scss'] }

  "CSS Plugins
  Plug 'ap/vim-css-color', { 'for': ['javascript', 'typescript', 'json', 'css', 'scss'] }

  " JSON Plugins
  Plug 'elzr/vim-json', { 'for': ['json'] }

  " ReasonML - Rescript
  Plug 'rescript-lang/vim-rescript'
  Plug 'reasonml-editor/vim-reason-plus', {'for': ['reason']}

call plug#end()

""""---GENERAL CONFIGURATION---"""
  "syntax
    set termguicolors
    " colorscheme dracula
    colorscheme miramare
    set background=dark
    " colorscheme xcodedarkhc
    filetype plugin on
    syntax on
  ""config
    set autoread "Automatically re-read ﬁles if unmodiﬁed inside Vim
    set backspace=indent,eol,start "allow backspace between lines and over indentation
    set binary
    set clipboard=unnamed
    set conceallevel=1
    set confirm "display confirm modal when closing unsave file
    set cursorline "Mark cursor line
    set encoding=UTF-8
    set exrc "enable .vimrc file per project
    set secure
    set hidden 
    set history=700 "commands history
    set mouse=v
    set noeol "No extra line on end of file
    set nornu
    set number "Show line numbers
    set ruler "Always show cursor position
    set scrolloff=3 "number of line above and under cursor
    set secure
    set shell=sh
    set t_ut=
    set title "set window title as current file name
    set visualbell "Flesh screen instead of running bell sound
  ""search
    set hlsearch "highlight search
    set ignorecase "ignore case sensitive
    set incsearch "incremental search
    set smartcase "ignore case sensitive till Upper case used
  ""indent
    set autoindent
    set expandtab "on pressing tab insert spaces
    set shiftwidth=2 "when indent with > insert 2 spaces
    set smarttab
    set softtabstop=2
    set tabstop=2 "tab as 2 spaces
  "set directory for swap, backup and history files
    set directory=$HOME/.vim/swp//
    set backupdir=$HOME/.vim/backup//
    set undodir=$HOME/.vim/undodir
    set nobackup
    set nowritebackup

"""---PLUGINS CONFIGURATION---"""
  " # Nerdtree
    let g:NERDTreeWinPos = 'left'
    let g:NERDTreeWinSize=$NERDTREE_WIDTH
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    let g:NERDTreeIgnore = ['^node_modules$', '\.bs.js$']
  " # Rust.vim
    let g:rustfmt_autosave = 1
"  " # ALE
"    let g:ale_completion_enabled = 0
"    let g:ale_fixers = {
"    \ 'css': ['prettier'],
"    \ 'scss': ['prettier'],
"    \ 'typescript': ['prettier'],
"    \ 'javascript': ['prettier'],
"    \ 'html': ['prettier'],
"    \ 'reason': ['refmt'],
"    \ 'rust': ['rustfmt']
"    \}
"    let g:ale_fix_on_save = 1
"    let g:ale_echo_cursor = 1
"    let g:airline#extensions#ale#enabled = 1
"    let g:ale_rust_cargo_use_check = 1
"    set completeopt+=noinsert
"    let g:ale_sign_error = "✗"
"    let g:ale_sign_warning = "⚠"
  " # devicons
    let g:airline_powerline_fonts = 1"
  " # nerdcommenter
    " let g:NERDSpaceDelims = 1
    " let g:NERDCommentEmptyLines = 1
    " let g:NERDTrimTrailingWhitespace = 1
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
  " vim-sort-imports
  let g:import_sort_auto = 0
  " vim-session
  let g:session_autoload = 'no'
  let g:session_autosave = 'yes'
  " taboo
  set sessionoptions+=tabpages,globals

  " rescript
  " Hooking up the ReScript autocomplete function
  set omnifunc=rescript#Complete
  " When preview is enabled, omnicomplete will display additional
  " information for a selected item
  set completeopt+=preview

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
  " map <C-f> :ALEFix<CR>
  " save file
  nmap <C-s> :w<CR>
  " use Ctrl-k and Ctrl-j to jump up and down between errors
  " nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  " nmap <silent> <C-j> <Plug>(ale_next_wrap)
  nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
  nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

  nmap <silent> <C-f> <Plug>(coc-format)
 
  " search under cursosr
  vnoremap // y/<C-R>"<CR>

  nmap <leader>f :FZF <CR>
  " center nerdtree on opened file
  map <leader>n :NERDTreeFind<CR>

  " CoC
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " " allos to pick definition from popup

  inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use K to show documentation in preview window
   nnoremap <silent> K :call <SID>show_documentation()<CR>
  
   function! s:show_documentation()
     if (index(['vim','help'], &filetype) >= 0)
       execute 'h '.expand('<cword>')
         else
       call CocAction('doHover')
     endif
   endfunction


   " copy to windows clopboard
   func! GetSelectedText()
     normal gv"xy
     let result = getreg("x")
     return result
   endfunc

   " if !has("clipboard") && executable("clip.exe")
   noremap <C-C> :call system('clip.exe', GetSelectedText())<CR>
   noremap <C-X> :call system('clip.exe', GetSelectedText())<CR>gvx
   " endif
   "
function SetLight()
  set background=light
endfunction

function SetDark()
  set background=dark
endfunction

if &term =~ '^xterm'
	" normal mode
	let &t_EI .= "\<Esc>[0 q"
	" insert mode
	let &t_SI .= "\<Esc>[6 q"
endif
