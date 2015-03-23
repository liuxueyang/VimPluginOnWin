" 1. Put the following line into $VIM/_vimrc
" 			source $VIM/vimfiles/_vimrc
"
" 2. name this file with name: _vimrc
"
" 3. Then put the current file into $VIM/vimfiles/ directory
"
"
" ====================================================
" This is My configuration!
" Aries mu (liuxueyang)
" =====================================================
"
"
"
"
" ********************SET********************
color molokai
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
nnoremap <c-t> :NERDTree<cr>
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
set cursorcolumn
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
" let g:C_CFlags = '-D NDEBUG -Wall -g -O0 -c -I D:\Dev-Cpp\bin\g++'
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>



"pathogen{
execute pathogen#infect()
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
"}

let NERDTreeWinSize=27


"taglist{
		let Tlist_File_Fold_Auto_Close=1
    let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
    let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
    let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
    let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
    let Tlist_Ctags_Cmd='/opt/local/bin/ctags'  "设置ctags命令的位置
    nnoremap <leader>tl : Tlist<CR>        "设置关闭和打开taglist窗口的快捷键
"}



let g:user_emmet_settings = {
			\ 'php' : {
			\'extends' : "html",
			\'filters' : 'c',
			\},
			\'xml' : {
			\ 'extends' : 'html',
			\},
			\'haml' : {
			\'extends' : 'html',
			\},
			\}



:nmap <Leader>we <Plug>VimwikiSplitLink
:nmap <Leader>wq <Plug>VimwikiVSplitLink
":nmap <Leader>wt <Plug>VimwikiTabnewLink
let g:C_ExeExtension = '.exe'
let g:C_CFlags = '-D NDEBUG -Wall -g -O0 -c'


let g:instant_markdown_autostart = 1



function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


let g:molokai_original = 1


