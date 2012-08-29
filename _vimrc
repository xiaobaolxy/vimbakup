set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

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

if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:vimrc_iswindows=1
else
    let g:vimrc_iswindows=0
endif
autocmd BufEnter * lcd %:p:h

set encoding=utf-8
set fileencoding=chinese
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,gbk,gb2312,big5
set ambiwidth=double
set fenc=gb2312 "设置文件编码
"set fenc=utf-8 "设置文件编码

set sw=2
set ts=2
colo ir_black

set gfn=Bitstream_Vera_Sans_Mono:h10:cANSI
set gfw=幼圆:h10.5:cGB2312
"set gfn=Consolas:h12
set linespace=4

"Toggle Menu and Toolbar  <F2>切换显示
set guioptions-=m  
set guioptions-=T  
map <silent> <F2> :if &guioptions =~# 'T' <Bar>  
        \set guioptions-=T <Bar>  
        \set guioptions-=m <bar>  
    \else <Bar>  
        \set guioptions+=T <Bar>  
        \set guioptions+=m <Bar>  
    \endif<CR>  
	
if has("gui_running")
    set guioptions-=m   " 关闭菜单栏
    set guioptions-=T   " 关闭工具栏
    set guioptions-=l   " 关闭左边滚动条
    set guioptions-=L   " 关闭垂直分隔窗口左边滚动条
    set guioptions-=r   " 关闭右边滚动条
    set guioptions-=R   " 关闭垂直分隔窗口右边滚动条
endif
"启动时窗口最大化
au GUIEnter * simalt ~x
"全屏编辑，F11切换
if has('gui_running') && has("win32")
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
	imap <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif


set number

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"HTML.vim 
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:no_html_toolbar = 'yes'
let g:no_html_menu = 'yes'
let g:do_xhtml_mappings = 'yes'
let g:html_tag_case = 'lowercase'
let g:html_default_charset = 'utf-8'
let g:html_template = $VIM . '\vimfiles\etc\temp.html'


set foldmethod=marker
set foldmarker=<div,div>
"折叠相关的快捷键
"zR 打开所有的折叠
"za Open/Close (toggle) a folded group of lines.
"zA Open a Closed fold or close and open fold recursively.
"zi 全部 展开/关闭 折叠
"zo 打开 (open) 在光标下的折叠
"zc 关闭 (close) 在光标下的折叠
"zC 循环关闭 (Close) 在光标下的所有折叠
"zM 关闭所有可折叠区域
" 设置折叠区域的宽度
set foldcolumn=0
" 设置折叠层数为
setlocal foldlevel=1
" 新建的文件，刚打开的文件不折叠
autocmd! BufNewFile,BufRead * setlocal nofoldenable
" }}}



" 插入模式下上下左右移动光标
imap <C-h> <Left>
imap <C-k> <Up>
imap <C-l> <Right>
imap <C-j> <Down>


"行间距，如果默认值太小，代码会非常纠结
set linespace=4                                                                       
"用<>调整缩进时的长度
set shiftwidth=4
"制表符的长度，统一为4个空格的宽度
set tabstop=4
" 设置按BackSpace的时候可以一次删除掉4个空格
set softtabstop=4
"初始窗口的宽度
set columns=195
"初始窗口的高度
set lines=45
"初始窗口的位置
winpos 52 42
 
"显示行号
set number
"行号栏的宽度
set numberwidth=4
"禁止自动换行
"set nowrap
"在输入命令时列出匹配项目，也就是截图底部的效果
set wildmenu
"显示光标位置
set ruler
"分割窗口时保持相等的宽/高
set equalalways
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
" 设置在状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
 
 "匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>
"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]
"取消自动备份
set nobackup
"将swp转移到别的地方去
"set directory=$YOURDIR
"让vim别产生那个文件
set noswapfile
"保存关闭文件之前保留一个备份
"set writebackup
" 自动切换当前目录为当前文件所在的目录
set autochdir

" 实时搜索
set incsearch
 
"js语法高亮脚本的设置
let g:javascript_enable_domhtmlcss=1
 
"设置自定义的<leader>快捷键
let mapleader=","
let g:mapleader=","

" 显示Tab符
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>
nnoremap <leader>4 :set filetype=php<cr>

"清除页面中的^M
nnoremap <leader>ce :%s/
//g<cr>

":%s/^M$//g # 去掉行尾的^M。
":%s/^M//g # 去掉所有的^M。
":%s/^M/[ctrl-v]+[enter]/g # 将^M替换成回车。
":%s/^M/\r/g # 将^M替换成回车。

""""""""""""""""""""""""""""""""""""""""
"tab切换
""""""""""""""""""""""""""""""""""""""""
map <C-right>   :tabnext<cr>
map <C-left>   :tabprevious<cr>

" {{{ plugin - bookmarking.vim 设置标记（标签）
" <f9> 设置标记    <f4> 向下跳转标记   <s-f4> 向上跳转标记
map <f9>   :ToggleBookmark<cr>
map <f4>   :NextBookmark<cr>
map <S-f4> :PreviousBookmark<cr>
"}}}

""""""""""""""""""""""""""""""
" NERDTree插件的快捷键
""""""""""""""""""""""""""""""
"nmap <silent> <leader>nt :NERDTree D:\<cr>
nmap <silent> <leader>nt :NERDTree D:\work\<cr>
nmap <silent> <leader>ntm :NERDTreeMirror<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ plugin - NERD_commenter.vim 注释代码用的，以下映射已写在插件中
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" <leader>cc 注释当前行
" <leader>cs 以”性感”的方式注释
" <leader>cA 在当前行尾添加注释符，并进入Insert模式
" <leader>cu 取消注释
" <leader>cm 添加块注释
" }}}

""""""""""""""""""""""""""""""""""""""
"CSexplorer.vim 配色预览插件
""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>color :ColorSchemeExplorer<cr>

