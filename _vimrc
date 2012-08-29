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
set fenc=gb2312 "�����ļ�����
"set fenc=utf-8 "�����ļ�����

set sw=2
set ts=2
colo ir_black

set gfn=Bitstream_Vera_Sans_Mono:h10:cANSI
set gfw=��Բ:h10.5:cGB2312
"set gfn=Consolas:h12
set linespace=4

"Toggle Menu and Toolbar  <F2>�л���ʾ
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
    set guioptions-=m   " �رղ˵���
    set guioptions-=T   " �رչ�����
    set guioptions-=l   " �ر���߹�����
    set guioptions-=L   " �رմ�ֱ�ָ�������߹�����
    set guioptions-=r   " �ر��ұ߹�����
    set guioptions-=R   " �رմ�ֱ�ָ������ұ߹�����
endif
"����ʱ�������
au GUIEnter * simalt ~x
"ȫ���༭��F11�л�
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
"�۵���صĿ�ݼ�
"zR �����е��۵�
"za Open/Close (toggle) a folded group of lines.
"zA Open a Closed fold or close and open fold recursively.
"zi ȫ�� չ��/�ر� �۵�
"zo �� (open) �ڹ���µ��۵�
"zc �ر� (close) �ڹ���µ��۵�
"zC ѭ���ر� (Close) �ڹ���µ������۵�
"zM �ر����п��۵�����
" �����۵�����Ŀ��
set foldcolumn=0
" �����۵�����Ϊ
setlocal foldlevel=1
" �½����ļ����մ򿪵��ļ����۵�
autocmd! BufNewFile,BufRead * setlocal nofoldenable
" }}}



" ����ģʽ�����������ƶ����
imap <C-h> <Left>
imap <C-k> <Up>
imap <C-l> <Right>
imap <C-j> <Down>


"�м�࣬���Ĭ��ֵ̫С�������ǳ�����
set linespace=4                                                                       
"��<>��������ʱ�ĳ���
set shiftwidth=4
"�Ʊ���ĳ��ȣ�ͳһΪ4���ո�Ŀ��
set tabstop=4
" ���ð�BackSpace��ʱ�����һ��ɾ����4���ո�
set softtabstop=4
"��ʼ���ڵĿ��
set columns=195
"��ʼ���ڵĸ߶�
set lines=45
"��ʼ���ڵ�λ��
winpos 52 42
 
"��ʾ�к�
set number
"�к����Ŀ��
set numberwidth=4
"��ֹ�Զ�����
"set nowrap
"����������ʱ�г�ƥ����Ŀ��Ҳ���ǽ�ͼ�ײ���Ч��
set wildmenu
"��ʾ���λ��
set ruler
"�ָ��ʱ������ȵĿ�/��
set equalalways
" ��ʾ״̬�� (Ĭ��ֵΪ 1, �޷���ʾ״̬��)
set laststatus=2
" ������״̬����ʾ����Ϣ
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
 
 "ƥ�����ŵĹ����������html��<>
set matchpairs=(:),{:},[:],<:>
"���˸񣬿ո����¼�ͷ����������βʱ�Զ��Ƶ���һ�У�����insertģʽ��
set whichwrap=b,s,<,>,[,]
"ȡ���Զ�����
set nobackup
"��swpת�Ƶ���ĵط�ȥ
"set directory=$YOURDIR
"��vim������Ǹ��ļ�
set noswapfile
"����ر��ļ�֮ǰ����һ������
"set writebackup
" �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set autochdir

" ʵʱ����
set incsearch
 
"js�﷨�����ű�������
let g:javascript_enable_domhtmlcss=1
 
"�����Զ����<leader>��ݼ�
let mapleader=","
let g:mapleader=","

" ��ʾTab��
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

"һЩ�����ӳ��ת���﷨�������һ���ļ��л���˲�ͬ����ʱ���ã�
nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>
nnoremap <leader>4 :set filetype=php<cr>

"���ҳ���е�^M
nnoremap <leader>ce :%s/
//g<cr>

":%s/^M$//g # ȥ����β��^M��
":%s/^M//g # ȥ�����е�^M��
":%s/^M/[ctrl-v]+[enter]/g # ��^M�滻�ɻس���
":%s/^M/\r/g # ��^M�滻�ɻس���

""""""""""""""""""""""""""""""""""""""""
"tab�л�
""""""""""""""""""""""""""""""""""""""""
map <C-right>   :tabnext<cr>
map <C-left>   :tabprevious<cr>

" {{{ plugin - bookmarking.vim ���ñ�ǣ���ǩ��
" <f9> ���ñ��    <f4> ������ת���   <s-f4> ������ת���
map <f9>   :ToggleBookmark<cr>
map <f4>   :NextBookmark<cr>
map <S-f4> :PreviousBookmark<cr>
"}}}

""""""""""""""""""""""""""""""
" NERDTree����Ŀ�ݼ�
""""""""""""""""""""""""""""""
"nmap <silent> <leader>nt :NERDTree D:\<cr>
nmap <silent> <leader>nt :NERDTree D:\work\<cr>
nmap <silent> <leader>ntm :NERDTreeMirror<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ plugin - NERD_commenter.vim ע�ʹ����õģ�����ӳ����д�ڲ����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>ca �ڿ�ѡ��ע�ͷ�ʽ֮���л�������C/C++ �Ŀ�ע��/* */����ע��//
" <leader>cc ע�͵�ǰ��
" <leader>cs �ԡ��ԸС��ķ�ʽע��
" <leader>cA �ڵ�ǰ��β���ע�ͷ���������Insertģʽ
" <leader>cu ȡ��ע��
" <leader>cm ��ӿ�ע��
" }}}

""""""""""""""""""""""""""""""""""""""
"CSexplorer.vim ��ɫԤ�����
""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>color :ColorSchemeExplorer<cr>

