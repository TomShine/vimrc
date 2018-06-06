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

" ycm {
    augroup load_ycm
        autocmd!
        autocmd InsertEnter * call plug#load('YouCompleteMe','ultisnips') | autocmd! load_ycm
    augroup END

    let g:ycm_global_ycm_extra_conf='~/.vim/tools/conf/ycm_extra_conf.py'
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_server_log_level = 'info'
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings=1
    let g:ycm_key_invoke_completion = '<c-z>'
    noremap <c-z> <NOP>

    " let g:ycm_confirm_extra_conf=0                    " 关闭加载.ycm_extra_conf.py提示
    " let g:ycm_cache_omnifunc=0                        " 禁止缓存匹配项,每次都重新生成匹配项
    " let g:ycm_seed_identifiers_with_syntax=1          " 语法关键字补全
    " let g:ycm_autoclose_preview_window_after_insertion = 1

    " Youcompleteme的默认tab,s-tab 和自动补全冲突
    let g:ycm_key_list_select_completion = ['<Down>'] 
    let g:ycm_key_list_previous_completion = ['<Up>']

    set completeopt=menu,menuone
    
    " 离开插入模式后自动关闭预览窗口
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif	      
    
    " 回车即选中当前项
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"  

    "上下左右键的行为 会显示其他信息
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
    inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }

    let g:ycm_filetype_whitelist = { 
                \ "c":1,
                \ "cpp":1, 
                \ "objc":1,
                \ "objcpp":1,
                \ "python":1,
                \ "java":1,
                \ "javascript":1,
                \ "coffee":1,
                \ "vim":1, 
                \ "go":1,
                \ "cs":1,
                \ "lua":1,
                \ "perl":1,
                \ "perl6":1,
                \ "php":1,
                \ "ruby":1,
                \ "rust":1,
                \ "erlang":1,
                \ "asm":1,
                \ "nasm":1,
                \ "masm":1,
                \ "tasm":1,
                \ "asm68k":1,
                \ "asmh8300":1,
                \ "asciidoc":1,
                \ "basic":1,
                \ "vb":1,
                \ "make":1,
                \ "cmake":1,
                \ "html":1,
                \ "css":1,
                \ "less":1,
                \ "json":1,
                \ "cson":1,
                \ "typedscript":1,
                \ "haskell":1,
                \ "lhaskell":1,
                \ "lisp":1,
                \ "scheme":1,
                \ "sdl":1,
                \ "sh":1,
                \ "zsh":1,
                \ "bash":1,
                \ "man":1,
                \ "markdown":1,
                \ "matlab":1,
                \ "maxima":1,
                \ "dosini":1,
                \ "conf":1,
                \ "config":1,
                \ "zimbu":1,
                \ "ps1":1,
                \ }
" }

" echodoc {
	set noshowmode
	let g:echodoc#enable_at_startup = 1
" }

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
