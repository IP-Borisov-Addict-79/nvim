" Get rid off Debian runtime: below is basically a chopped copypasta from
" debian.vim
set nocompatible               " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start " more powerful backspacing
set history =50                " keep 50 lines of command line history
set ruler                      " show the cursor position all the time

" modelines have historically been a source of security/resource
" vulnerabilities -- disable by default, even when 'nocompatible' is set
set nomodeline

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" syntax on
if has("syntax")
  syntax on
endif

" Load updated .vimrc on saving
"if has("autocmd")
"  autocmd bufwritepost .vimrc source $MYVIMRC
"endif

" check if we're running on X or via smart ssh, else use shitty colors
if $TERM=~'xterm-256color' || $TERM=~'rxvt-256color' || $TERM=~'rxvt-unicode-256color' || $TERM=~'screen-256color'
    set background=dark
    set termguicolors
    colorscheme darcula
    let g:lightline = { 'colorscheme': 'darculaOriginal' }
    set cursorlineopt=number,screenline
    set cursorline
else
    colorscheme default
endif

" hide vim history file to prevent ownerchip change to root
" only in vim - neovim has incompatible format!
set viminfo+=n~/.config/nvim/viminfo

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showmatch  " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search
set mouse=a    " Enable mouse usage (all modes)

" change swap/backup file directory
"set backupdir=$HOME/.vim
"set directory=$HOME/.vim
" in fact, turn it off!
set noswapfile
set nobackup

set nowrap
set number
set scrolloff=4

" insert 4 spaces instead of TAB
"set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" show special characters - Tab and trailing spaces
set list
set listchars=tab:>>

" change default SQL syntax to postgresql
" (https://github.com/exu/pgsql.vim.git)
if filereadable(glob("~/.config/nvim/syntax/pgsql.vim")) 
    let g:sql_type_default = 'pgsql'
endif

" change default NERDtree width
if filereadable(glob("~/.config/nvim/plugin/NERD_tree.vim"))
    "let g:NERDTreeWinSize = 28
    let g:NERDTreeWinSize = 32
    let g:NERDTreeMinimalUI = 1 " don't show help string
    set hidden " prevent NERDtree from splitting window on opening a new file
endif

" Used to be NERDTree + tagbar, but tagbar was KIA
function! NERDTag()
    if filereadable(glob("~/.config/nvim/plugin/NERD_tree.vim"))
        " clean shite left from previous session
        call system('make clean')
        NERDTreeToggle
    endif
endfunction
command NTag call NERDTag()

" BufExplorer settings
if filereadable(glob("~/.config/nvim/plugin/bufexplorer.vim"))
    nnoremap <silent> <C-b> :BufExplorerHorizontalSplit<CR>
    let g:bufExplorerDefaultHelp = 0 " do not show default help
    let g:bufExplorerSplitBelow  = 1 " split below current window
endif

" move plugin - move (selected) lines and blocks up&down (with Alt-[hjkl])
if filereadable(glob("~/.config/nvim/plugin/move.vim"))
    let g:move_key_modifier = 'M' " set modifier key to alt
endif

" prevent XTRMLY annoying pandoc-markdown rendering
if filereadable(glob("~/.config/nvim/plugin/pandoc-syntax-check.vim"))
    let g:pandoc#syntax#conceal#use = 0
endif

" turn off arrow keys in normal and insert modes
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
vnoremap <Up>    <NOP>
vnoremap <Down>  <NOP>
vnoremap <Left>  <NOP>
vnoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" map 0 to Home
noremap $ <End>
noremap 0 <Home>

" Vim inner layout switch
set keymap=russian-jcukenwin
set iminsert=0 " latin by default in insert mode
set imsearch=0 " latin by default in search string
" Remap layout switching to Alt-Space (change desktop shortcut in Mate/Xfce4!)

" duplicate current string, could be handy
map <C-L> :t.<CR>
imap <M-Space> <C-^>
cmap <M-Space> <C-^>

" pandoc markdown support. Requires vim-pandoc-syntax:
" https://github.com/vim-pandoc/vim-pandoc-syntax
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Encodings menu (mapped to F7)
menu Encoding.koi8-r       :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866        :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8        :e ++enc=utf8<CR>
map <F7> :emenu Encoding.




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Text wrap mode  17.06.2020
" set word wrap mode
function _Wrap()
    set wrap nolist
    "
    " remember current textwidth state and unset the option
    let g:cur_textwidth=&textwidth
    set textwidth=0
    "
    set linebreak
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap $ g$
    nnoremap <S-a> g$a
    vnoremap j gj
    vnoremap k gk
    vnoremap 0 g0
    vnoremap $ g$
    vnoremap <S-a> g$a
endfunction
"
" unset word wrap mode
function _NoWrap()
    set nowrap linebreak
    "
    " restore original textwidth
    if exists('g:cur_textwidth')
        let &textwidth=g:cur_textwidth
        unlet g:cur_textwidth
    endif
    "
    nnoremap j j
    nnoremap k k
    nnoremap 0 0
    nnoremap $ $
    nnoremap <S-a> <S-a>
    vnoremap j j
    vnoremap k k
    vnoremap 0 0
    vnoremap $ $
    vnoremap <S-a> <S-a>
endfunction
"
" user-friendly wrapper commands
command Wrap call _Wrap()
command NoWrap call _NoWrap()
"                              17.06.2020
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              18.11.2021
let fortran_free_source=1
let fortran_have_tabs=0
let fortran_more_precise=1
let fortran_do_enddo=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
