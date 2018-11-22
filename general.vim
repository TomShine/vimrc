let g:isMac = 0
let g:isLinux = 0
let g:isWindows = 0
let g:isGUI = 0

if has('mac')
    let g:isMac = 1
elseif has('unix')
    let g:isLinux = 1
else
    let g:isWindows = 1
endif

if has("gui_running")
    let g:isGUI = 1
endif

" editor settings
set history=1000
set confirm                     " prompt when existing from an unsaved file
set backspace=indent,eol,start  " More powerful backspacing
set t_Co=256                    " Explicitly tell vim that the terminal has 256 colors
set report=0                    " always report number of lines changed
set nowrap                      " dont wrap lines（禁止折行）
set scrolloff=5                 " 5 lines above/below cursor when scrolling
set number                      " show line numbers
set relativenumber              " show relative line numbers
set showmatch                   " show matching bracket (briefly jump)
set showcmd                     " show typed command in status bar(开启状态栏)
set title                       " show file in titlebar
set matchtime=2                 " show matching bracket for 0.2 seconds
set matchpairs+=<:>             " specially for html
set clipboard=unnamed           " yank and paste with the system clipboard
set hidden                      " 允许在有未保存的修改时切换缓冲区
set vb t_vb=                    " 关闭提示音
set shortmess=atI               " 去掉欢迎界面
set cmdheight=2                 " 设置命令行的高度为2，默认为1
set cursorline                  " 突出显示当前行
set ai!                         " 设置自动缩进
set ruler                       " 右下角显示光标位置的状态行
set nocompatible                " 关闭兼容模式
set foldlevel=100               " 禁止自动折叠
set laststatus=2                " 开启状态栏信息
set autoread                    " 当文件在外部被修改时自动更新该文件
set nobackup                    " 不生成备份文件
set noswapfile                  " 不生成交换文件
set autoread                    " 当文件在外部被修改，自动更新该文件

if g:isGUI
    set guioptions-=m  " hide tool menu
    set guioptions-=T  " hide menu
    set guioptions-=L 
    set guioptions-=r
endif

" font
if g:isMac
    if g:isGUI 
        "set macligatures
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

" 文件格式，默认 ffs=dos,unix
set fileformat=unix             "设置新文件的<EOL>格式
set fileformats=unix,dos,mac    "给出文件的<EOL>格式类型

" encoding dectection(设置文件编码和文件格式)
set encoding=utf-8      " 设置gvim内部编码(使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错)
set termencoding=utf-8
set fileencoding=utf-8  " 设置当前文件编码
set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,cp936,latin1,big5  " 设置支持打开的文件的编码

syntax enable              " 打开语法高亮
syntax on                  " 打开文件类型检测

filetype on                " 启用文件类型侦测
filetype plugin on         " 针对不同的文件类型加载对应的插
filetype plugin indent on  " 启用缩进
filetype indent on         " 自适应不同语言的智能缩进

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search
set hlsearch   " 开启高亮显示结果
set incsearch
set ignorecase " 搜索模式里忽略大小写
set smartcase  " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用

" 去除左右两边的滚动条
set go-=r
set go-=L

" Default Indentation(默认缩进)
set autoindent
set smartindent         " indent when
set tabstop=4           " tab width(设置编辑时制表符占用空格数)
set softtabstop=4       " backspace(让 vim 把连续数量的空格视为一个制表符)
set shiftwidth=4        " indent width(设置格式化时制表符占用空格数)
set expandtab           " expand tab to space(将制表符扩展为空格)

" Folder
set nofoldenable        " 启用 vim 关闭折叠代码
"set foldmethod=indent  " indent 折叠方式(基于缩进或语法进行代码折叠)
set foldmethod=syntax   " indent 折叠方式
set foldmethod=marker   " marker 折叠方式

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" highlight tabs and trailing spaces
"set list " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
"set listchars=tab:>-,trail:-,extends:>,precedes:<

" if has('statusline')
"     " Broken down into easily includeable segments
"     set statusline=%<%f\                     " Filename
"     set statusline+=%w%h%m%r                 " Options
"     if !exists('g:override_spf13_bundles')
"         set statusline+=%{fugitive#statusline()} " Git Hotness
"     endif
"     set statusline+=\ [%{&ff}/%Y]            " Filetype
"     set statusline+=\ [%{getcwd()}]          " Current dir
"     set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
" endif

" 设置 python 的格式
au BufNewFile,BufRead *.py
            \ set tabstop=4
            \ set softtabstop=4
            \ set shiftwidth=4
            \ set textwidth=79
            \ set expandtab
            \ set autoindent
            \ set fileformat=unix

" mapleader
let mapleader = ","

" Tmux {
    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    " http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
    "if exists('$TMUX')
    "  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    "  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    "else
    "  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    "  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    "endif

    " for tmux to automatically set paste and nopaste mode at the time pasting
    " (as happens in VIM UI)
    function! WrapForTmux(s)
      if !exists('$TMUX')
        return a:s
      endif

      let tmux_start = "\<Esc>Ptmux;"
      let tmux_end = "\<Esc>\\"

      return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
    endfunction

    let &t_SI .= WrapForTmux("\<Esc>[?2004h")
    let &t_EI .= WrapForTmux("\<Esc>[?2004l")

    function! XTermPasteBegin()
      set pastetoggle=<Esc>[201~
      set paste
      return ""
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"}

" 个性化
if filereadable(expand($HOME . '/.vimrc.local'))
    source $HOME/.vimrc.local
endif
