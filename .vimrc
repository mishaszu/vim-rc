" Init Phatogen
    execute pathogen#infect()

" Syntax
    syntax on
    colorscheme ramda

" General
    set binary
    set noeol
    set history=700
    set autoread
    set ruler
    set hlsearch
    set incsearch
    set number

" Color range
    set t_Co=256

" Indent
"" Indent start
    set autoindent
    set tabstop=4
    set shiftwidth=4
    set expandtab
"" Indent end


" Plugins
"" Plugins start

    "# Nerdtree
        :let g:NERDTreeWinSize=30

    "# rust.vim
        let g:rustfmt_autosave = 1

    "# syntastic
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0

"" Plugins end

" Auto close brackets
"" Auto brackets start
    inoremap ( ()<left>
    inoremap [ []<left>
    inoremap { {}<left>
    inoremap {<CR> {<CR>}<ESC>O
    inoremap {;<CR> {<CR>};<ESC>O
"" Auto brackets end
