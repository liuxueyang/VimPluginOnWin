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

"
"
" ********************SET********************
color molokai
"set guifont=Consolas:h13
set fileencodings=utf-8,gbk
set nu numberwidth=5
set cindent
set ai
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

" cvim ===============
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes' 
" ====================



" ************************************************************
" ============================================================
" ************************************************************
" www.vimer.cn 
"
"
"
if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:iswindows=0
endif
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
autocmd BufEnter * lcd %:p:h
syntax on"打开高亮
if has("autocmd")
    filetype plugin indent on "根据文件进行缩进
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
else
    "智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，但是效果会比只支持C/C++的cindent效果会差一点，但笔者并没有看出来
    set autoindent " always set autoindenting on 
endif " has("autocmd")
set tabstop=4 "让一个tab等于4个空格
set vb t_vb=
set nowrap "不自动换行
set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用
if(g:iswindows==1) "允许鼠标的使用
    "防止linux终端下无法拷贝
    if has('mouse')
        set mouse=a
    endif
    au GUIEnter * simalt ~x
endif
"字体的设置
"set guifont=Bitstream_Vera_Sans_Mono:h12:cANSI "记住空格用下划线代替哦
set guifont=Bitstream_Vera_Sans_Mono:h12
"set gfw=幼圆:h10:cGB2312
"
"
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

"进行Tlist的设置
"TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

"对NERD_commenter的设置
let NERDShutUp=1

"DoxygenToolkit
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="liuxueyang"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

" www.vimer.cn 
" ************************************************************
" ============================================================
" ************************************************************
"
"


