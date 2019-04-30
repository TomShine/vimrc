"======================================================================
"
" init-config.vim - 正常模式下的配置，在 init-basic.vim 后调用
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

let g:isMac = 0
let g:isLinux = 0
let g:isGUI = 0

if has('mac')
    let g:isMac = 1
elseif has('unix')
    let g:isLinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
endif

if g:isGUI
    set guioptions-=m  " hide tool menu
    set guioptions-=T  " hide menu
    set guioptions-=L
    set guioptions-=r
endif

" 去除左右两边的滚动条
set go-=r
set go-=L

set confirm                     " prompt when existing from an unsaved file
set backspace=indent,eol,start  " More powerful backspacing
set report=0                    " always report number of lines changed
set nowrap                      " dont wrap lines（禁止折行）
set scrolloff=5                 " 5 lines above/below cursor when scrolling
set number                      " show line numbers
set relativenumber              " show relative line numbers
set showcmd                     " show typed command in status bar(开启状态栏)
set title                       " show file in titlebar
set matchpairs+=<:>             " specially for html
set clipboard=unnamed           " yank and paste with the system clipboard
set hidden                      " 允许在有未保存的修改时切换缓冲区
set vb t_vb=                    " 关闭提示音
set shortmess=atI               " 去掉欢迎界面
set cmdheight=2                 " 设置命令行的高度为2，默认为1
set ai!                         " 设置自动缩进
set laststatus=2                " 开启状态栏信息
set nobackup                    " 不生成备份文件
set autoread                    " 当文件在外部被修改，自动更新该文件

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" highlight tabs and trailing spaces
set list " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:>-,trail:-,extends:>,precedes:<

" mapleader
let mapleader = ","


"----------------------------------------------------------------------
" font
"----------------------------------------------------------------------

if g:isMac
    if g:isGUI
        " set macligatures
        set guifont=Source\ Code\ Pro:h12
    else
        set guifont=Fira\ Code:h14
    endif
elseif g:isLinux
    if g:isGUI
        "set macligatures
        "set guifont=Source\ Code\ Pro\ 12
        set guifont=Fira\ Code\ \ Medium\ 12
    else
        set guifont=Fira\ Code\ 14
    endif
    " set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ 12
endif

"----------------------------------------------------------------------
" 有 tmux 何没有的功能键超时（毫秒）
"----------------------------------------------------------------------
if $TMUX != ''
    set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
    set ttimeoutlen=80
endif


"----------------------------------------------------------------------
" 终端下允许 ALT，详见：http://www.skywind.me/blog/archives/2021
" 记得设置 ttimeout （见 init-basic.vim） 和 ttimeoutlen （上面）
"----------------------------------------------------------------------
if has('nvim') == 0 && has('gui_running') == 0
    function! s:metacode(key)
        exec "set <M-".a:key.">=\e".a:key
    endfunc
    for i in range(10)
        call s:metacode(nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(nr2char(char2nr('a') + i))
        call s:metacode(nr2char(char2nr('A') + i))
    endfor
    for c in [',', '.', '/', ';', '{', '}']
        call s:metacode(c)
    endfor
    for c in ['?', ':', '-', '_', '+', '=', "'"]
        call s:metacode(c)
    endfor
endif


"----------------------------------------------------------------------
" 终端下功能键设置
"----------------------------------------------------------------------
function! s:key_escape(name, code)
    if has('nvim') == 0 && has('gui_running') == 0
        exec "set ".a:name."=\e".a:code
    endif
endfunc


"----------------------------------------------------------------------
" 功能键终端码矫正
"----------------------------------------------------------------------
call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')


"----------------------------------------------------------------------
" 防止 tmux下 vim 的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------

if &term =~ '256color' && $TMUX != ''
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------

" 允许备份
set backup

" 保存时备份
set writebackup

" 备份文件地址，统一管理
set backupdir=~/.vim/tmp

" 备份文件扩展名
set backupext=.bak

" 禁用交换文件
set noswapfile

" 禁用 undo文件
set noundofile

" 创建目录，并且忽略可能出现的警告
silent! call mkdir(expand('~/.vim/tmp'), "p", 0755)


"----------------------------------------------------------------------
" 配置微调
"----------------------------------------------------------------------

" 修正 ScureCRT/XShell 以及某些终端乱码问题，主要原因是不支持一些
" 终端控制命令，比如 cursor shaping 这类更改光标形状的 xterm 终端命令
" 会令一些支持 xterm 不完全的终端解析错误，显示为错误的字符，比如 q 字符
" 如果你确认你的终端支持，不会在一些不兼容的终端上运行该配置，可以注释
if has('nvim')
    set guicursor=
elseif (!has('gui_running')) && has('terminal') && has('patch-8.0.1200')
    let g:termcap_guicursor = &guicursor
    let g:termcap_t_RS = &t_RS
    let g:termcap_t_SH = &t_SH
    set guicursor=
    set t_RS=
    set t_SH=
endif

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \	 exe "normal! g`\"" |
    \ endif

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


"----------------------------------------------------------------------
" 文件类型微调
"----------------------------------------------------------------------
augroup InitFileTypesGroup

    " 清除同组的历史 autocommand
    au!

    " C/C++ 文件使用 // 作为注释
    au FileType c,cpp setlocal commentstring=//\ %s

    " markdown 允许自动换行
    au FileType markdown setlocal wrap

    " lisp 进行微调
    au FileType lisp setlocal ts=8 sts=2 sw=2 et

    " scala 微调
    au FileType scala setlocal sts=4 sw=4 noet

    " haskell 进行微调
    au FileType haskell setlocal et

    " quickfix 隐藏行号
    au FileType qf setlocal nonumber

    " 强制对某些扩展名的 filetype 进行纠正
    au BufNewFile,BufRead *.as setlocal filetype=actionscript
    au BufNewFile,BufRead *.pro setlocal filetype=prolog
    au BufNewFile,BufRead *.es setlocal filetype=erlang
    au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
    au BufNewFile,BufRead *.vl setlocal filetype=verilog

augroup END
