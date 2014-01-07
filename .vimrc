" set nocompatible
syntax on

" Configure Vundle
filetype on " Without this vim emits a zero exit status because of later :ft off
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" Install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
filetype plugin indent on
filetype plugin on

set autoindent
set autoread                         " Automatically update a file in vim when it has been updated outside of vim
set clipboard=unnamed                " Synchronize Vim's default register and the clipboard register to copy and paste
set complete -=i                     " Searching included files (i) is too slow to be practical in auto complete
set directory-=.                     " don't store swapfiles in the current directory
set display+=lastline
set expandtab                        " Expand tabs to look like they are 8 spaces instead of 4
set fileformats+=mac                 " Interpret mac line endings correctly
set foldlevelstart=1
set foldmethod=syntax
set ignorecase                       " Ignore case in searching
set incsearch                        " Incremental search - will begin searching as you type a search phrase
set laststatus=2                     " Set the status of all windows open to show by default
set nowrap                           " Turn off wordwrap
set nrformats-=octal                 " Remove octal so that CTRL+A and CTRL+X can increment and decrement numbers
set number                           " Show line numbers
set omnifunc=syntaxcomplete#Complete " Enable autocomplete
set relativenumber
set ruler                            " Shows current line number and column in bottom right corner
set scrolloff=3                      " Set there to always be 3 line above/below and 5 spaces to each side of
set shiftround                       " Setting shiftround with indent to a multiple of shiftwidth when using > or <
set shiftwidth=2                     " Replace all tabs with 2 spaces
set showcmd                          " Shows information about the current command being used, namely visual mode
set showmatch                        " Jump to the matching bracket if it exists, if it doesn't beep
set sidescrolloff=5
set smartcase                        " Unless we specify a case
set smarttab
set softtabstop=2
set spell                            " Turn on spell check, should be intelligent enough to work with html
set tabstop=2                        " Deal with spaces, tabs and lines
set ttimeout                         " Sets the amount of time to wait during keyboard combinations
set ttimeoutlen=50
set wildmenu                         " Autocomplete vim commands when you push tab in the menu

" Folding
let javaScript_fold=1

" Change p to move the cursor to the end of the pasted item after pasting
" noremap p gpk

" Indenting
vmap > >>
vmap < <<

" Remap ultisnips so it doesn't interfere with you complete me
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Resizing splits, use a single key so it can be held down
nmap > <C-W>>
nmap < <C-W><
nmap + <C-W>+
nmap - <C-W>-

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif
if &history < 1000
	set history=1000 " Save the last 1000 vim commands used
endif
if &tabpagemax < 50
	set tabpagemax=50 " Number of tabs, as in web browser tabs not the keyboard tab, allowed in vim
endif

" Keyboard Shortcuts
let mapleader = ','

"CTRL+U undo's the last line typed in insert mode and CTRL+W does the same for
"the last word, adding these lines allows you to push <ESC> then u to undo the
"undo caused by CTRL+U and CTRL+W if they are typed by accident. Its described
"further here: vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
" inoremap <c-w> <c-g>u<c-w>

"Fix & use, to apply last search with last flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"Yank from the cursor to the end of the line into register
"nnoremap Y y$

map <leader>l :Align 
nmap <leader>a :Ack
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TlistToggle
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'<CR>

" Configure NerdTree
let NERDTreeShowHidden=1 " Show hidden files

"Set syntax highlighting for unusual file types
au BufNewFile,BufRead *.pde set filetype=java
au BufNewFile,BufRead *.ejs set filetype=html

" Format the statusline
set statusline=%F
set statusline+=%=  
set statusline+=%l/%L

" Manage Panes
map <C-W><bar> <C-W>v<C-W><Right>
map <C-W>_ <C-W>s<C-W><Down>

" Color Scheme
colorscheme elflord 
" Color Indents using vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=16 " Black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8 " Grey

" Error colors
hi clear SpellBad
hi SpellBad cterm=underline
