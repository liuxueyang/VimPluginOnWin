set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction



" ========================================
" This is My configuration!
" Aries mu (liuxueyang)
" ========================================
"
"
"
"
" ********************SET********************
color desert
set nocompatible
set guifont=Consolas:h13
set fileencodings=utf-8,gbk
set nu numberwidth=5
set cindent
set ai
set tabstop=2
set shiftwidth=2 
set mouse=a
set autochdir
se hlsearch incsearch 
se ruler
set cmdheight=2
syntax on
syntax enable
filetype plugin indent on
filetype indent on
filetype plugin on



" ********************MAP********************
let mapleader=","
noremap <space> ve
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>pv :sp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" nnoremap wt :WMToggle<cr> 
" nnoremap <c-t> :NERDTree<cr>
" nnoremap <c-a> :Tlist<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>< viw<esc>a><esc>'<i<<esc>lw

vnoremap \ U
inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>veU
inoremap <D> <esc>

inoremap ( ()<esc>i
inoremap ) <c-r>=ClosePair(')')<cr>
inoremap { {}<esc>i
inoremap } <c-r>=ClosePair('}')<cr>
inoremap [ []<esc>i
inoremap ] <c-r>=ClosePair(']')<cr> 
inoremap " ""<esc>i
inoremap ' ''<esc>i
onoremap p i(
onoremap b /return<cr>


" ********************OTHER********************
iabbrev @@ liuxueyang.github.io
iabbrev ccopy Copyright 2015 Xueyang Liu, all rights reserved.
autocmd BufWritePre *.html :normal gg=G




" set guifont=Monospace\ 12
if v:version > 700
	set cursorline
	hi CursorLine ctermbg=Red guibg=#771c1c
	hi CursorColumn ctermbg=Red guibg=#771c1c
"	call ExpextCursorSlowDown()
endif
"
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2

map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
\set guioptions-=m <bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <Bar>
\endif<CR>
"remove toolbar"
set guioptions-=T
"remove menu"
set guioptions-=m
hi LineNr guifg=#857b6f guibg=#000000 gui=none
hi LineNr ctermfg=101 ctermbg=16 term=none
"au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)inoremap ( ()<esc>i
let g:C_CFlags = '-D NDEBUG -Wall -g -O0 -c'
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
