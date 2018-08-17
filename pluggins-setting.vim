" ListToggle（快速显示和关闭Vim的locationlist和quickfix窗口的插件）{
    let g:lt_height = 10
"}

" NERDTree {
    let NERDTreeWinSize = 33       " 设置 NERDTree 子窗口宽度
    let NERDTreeWinPos = "right"   " 设置 NERDTree 子窗口位置
    let NERDTreeShowBookmarks = 1  " 显示书签列表
    let NERDTreeIgnore = ['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '.DS_Store'] " 忽略文件
    let NERDTreeChDirMode = 0
    let NERDTreeMouseMode = 2
    let NERDTreeShowHidden = 1      " 显示隐藏文件
    let NERDTreeBookmarksFile = expand('$HOME') . '/.vim/NERDTreeBookmarks'
    let NERDTreeMinimalUI = 1        " NERDTree 子窗口中不显示冗余帮助信息
    let NERDTreeAutoDeleteBuffer = 1 " 删除文件时自动删除文件对应 buffer
    let NERDTreeShowLineNumbers = 1  " 显示行号
    let NERDTreeAutoCenter=1

    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }
"}

" NerdCommenter(easy comment and uncomment) {
    let NERDSpaceDelims     = 1 " 自动添加前置空格
    let NERDCompactSexyComs = 1
"}

" vim-gutentags {
    set tags=./.tags;,.tags

    let $GTAGSLABEL = 'native-pygments'
    " let $GTAGSCONF = '~/.globalrc'    
    
    " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
     
    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'

    " 同时开启 ctags 和 gtags 支持：
    let g:gutentags_modules = []
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif
    if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
    endif
     
    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags

    " 检测 ~/.cache/tags 不存在就新建
    if !isdirectory(s:vim_tags)
        silent! call mkdir(s:vim_tags, 'p')
    endif
     
    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 如果使用 universal ctags 需要增加下面一行
    " let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 禁用 gutentags 自动加载 gtags 数据库的行为
    let g:gutentags_auto_add_gtags_cscope = 0

    " 允许 gutentags 打开一些高级命令和选项
    let g:gutentags_define_advanced_commands = 1
"}

" quick-run {
    let g:quickrun_config = {
      \   "_" : {
      \       "outputter" : "message",
      \   },
      \}

    let g:quickrun_no_default_key_mappings = 1
"}

" rainbow {
    " Rainbow parentheses for Lisp and variants
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['black',       'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0

    au VimEnter * RainbowParenthesesToggle      " Toggle it on/off
    au Syntax * RainbowParenthesesLoadRound     " (), the default when toggling
    au Syntax * RainbowParenthesesLoadSquare    " []
    au Syntax * RainbowParenthesesLoadBrace     " {}
    au Syntax * RainbowParenthesesLoadChevrons  " <>
"}

" search {
    if executable('ag')
        " Use Ag over Grep
        let g:ackprg='ag --nogroup --nocolor --column'
    endif
"}

" leaderF {
    let g:Lf_MruMaxFiles = 2048
    "let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    "let g:Lf_StlSeparator = { 'left': '►', 'right': '◄', 'font': '' }
    "let g:Lf_StlSeparator = { 'left': '⮀', 'right': '⮂' }
    let g:Lf_StlSeparator = { 'left': "\u2b80", 'right': "\u2b82" }
" }

" ale { 
    let g:ale_linters = {
                \ 'c': ['gcc', 'cppcheck'], 
                \ 'cpp': ['gcc', 'cppcheck'], 
                \ 'python': ['flake8', 'pylint'], 
                \ 'lua': ['luac'], 
                \ 'go': ['go build', 'gofmt'],
                \ 'java': ['javac'],
                \ 'javascript': ['eslint'], 
                \ }

    let g:airline#extensions#ale#enabled = 1
    let g:ale_python_flake8_options = '--conf=~/.vim/tools/conf/flake8.conf'
    let g:ale_python_pylint_options = '--rcfile=~/.vim/tools/conf/pylint.conf'
    let g:ale_python_pylint_options .= ' --disable=W'
    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
    let g:ale_c_cppcheck_options = ''
    let g:ale_cpp_cppcheck_options = ''
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚠'
    " let g:ale_sign_error = '•'
    " let g:ale_sign_warning = '•'
    let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']

    if executable('gcc') == 0 && executable('clang')
        let g:ale_linters.c += ['clang']
        let g:ale_linters.cpp += ['clang']
    endif

    hi link ALEErrorSign    Error
    hi link ALEWarningSign  Warning
"}

"vim-choosewin{
    " if you want to use overlay feature
    let g:choosewin_overlay_enable = 1
"}

"Airline {
    if has('linux')
        set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
    elseif has('mac')
        set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
    endif
    
    "这个是安装字体后 必须设置此项
    let g:airline_powerline_fonts = 1

    let g:airline_theme="badwolf"
    "let g:airline_theme="luna"
    "let g:airline_theme="molokai"
    "let g:airline_theme="solarized"

    " For patched power-line fonts
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " 关闭状态显示空白符号计数
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'


    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.space = "\ua0"
    
    "Buffer {
        " 打开 tabline 功能,方便查看Buffer和切换
        let g:airline#extensions#tabline#enabled = 1 
        let g:airline#extensions#tabline#show_splits = 1           
        let g:airline#extensions#tabline#show_tabs = 1 
        let g:airline#extensions#tabline#show_buffers = 1 
        let g:airline#extensions#tabline#show_tab_type = 0
        let g:airline#extensions#tabline#buffer_nr_show = 1
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline#extensions#tabline#buffer_idx_mode = 0 
    "}
"}

" UltiSnips 的 tab 键与 YCM 冲突，重新设定 {
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
"}

" IndentGuide {
    "let g:indent_guides_enable_on_vim_startup = 1  " 随vim 自启动,h默认关闭
    let g:indent_guides_start_level=2               " 从第二层开始可视化显示缩进
    let g:indent_guides_guide_size            = 1   " 色块宽度(指定对齐线的尺寸)
"}

" SuperTab {
    " 0 - 不记录上次的补全方式
    " 1 - 记住上次的补全方式,直到用其他的补全命令改变它
    " 2 - 记住上次的补全方式,直到按ESC退出插入模式为止

    let g:SuperTabRetainCompletionType=2
"}
