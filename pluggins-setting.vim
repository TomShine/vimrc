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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ListToggle（快速显示和关闭Vim的locationlist和quickfix窗口的插件）{
    let g:lt_height = 10
"}

" tagbar(源代码符号的结构化视图,插件需要tags文件的支持) {
    let g:tagbar_ctags_bin='/usr/local/bin/ctags'
    let g:tagbar_width=30
    let g:tagbar_autofocus = 1 " tagbar 子窗口中不显示冗余帮助信息
    let g:tagbar_sort = 0
    let g:tagbar_compact = 1
    "let g:tagbar_width=30      " 设置宽度，默认为30
    let g:tagbar_left=1         " 在左侧
    " let g:tagbar_right=1      " 在右侧
    "autocmd VimEnter * nested :call tagbar#autoopen(1)    "打开vim时自动打开tagbar

    " 设置 ctags 对哪些代码元素生成标签
    let g:tagbar_type_cpp = {
        \ 'ctagstype' : 'c++',
        \ 'kinds' : [
             \ 'c:classes:0:1',
             \ 'd:macros:0:1',
             \ 'e:enumerators:0:0',
             \ 'f:functions:0:1',
             \ 'g:enumeration:0:1',
             \ 'l:local:0:1',
             \ 'm:members:0:1',
             \ 'n:namespaces:0:1',
             \ 'p:functions_prototypes:0:1',
             \ 's:structs:0:1',
             \ 't:typedefs:0:1',
             \ 'u:unions:0:1',
             \ 'v:global:0:1',
             \ 'x:external:0:1'
         \ ],
         \ 'sro' : '::',
         \ 'kind2scope' : {
             \ 'g' : 'enum',
             \ 'n' : 'namespace',
             \ 'c' : 'class',
             \ 's' : 'struct',
             \ 'u' : 'union'
         \ },
         \ 'scope2kind' : {
             \ 'enum'      : 'g',
             \ 'namespace' : 'n',
             \ 'class'     : 'c',
             \ 'struct'    : 's',
             \ 'union'     : 'u'
         \ }
    \ }

    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent',
        \ 'kinds' : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ }
    \ }

    " ,tb(打开tagbar)
    nmap <leader>tb :TagbarToggle<CR>
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
    let g:NERDTreeFileExtensionHighlightFullName = 1
    let g:NERDTreeExactMatchHighlightFullName = 1
    let g:NERDTreePatternMatchHighlightFullName = 1
    let g:NERDTreeHighlightFolders = 1
    let g:NERDTreeHighlightFoldersFullName = 1
    let g:NERDTreeDirArrowExpandable='▷'
    let g:NERDTreeDirArrowCollapsible='▼'

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
    let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
    let g:SuperTabRetainCompletionType=2
"}

"vim-easy-align {
    if !exists('g:easy_align_delimiters')
        let g:easy_align_delimiters = {}
    endif

    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
"}

" quick-run {
    let g:quickrun_config = {
      \   "_" : {
      \       "outputter" : "message",
      \   },
      \}

    let g:quickrun_no_default_key_mappings = 1
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

" leaderF {
    let g:Lf_MruMaxFiles = 2048
    "let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    "let g:Lf_StlSeparator = { 'left': '►', 'right': '◄', 'font': '' }
    "let g:Lf_StlSeparator = { 'left': '⮀', 'right': '⮂' }

   let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.vim/cache')
    let g:Lf_ShowRelativePath = 0
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
" }

" echodoc {
    set noshowmode
    let g:echodoc#enable_at_startup = 1
" }

" vim-choosewin {
    " if you want to use overlay feature
    let g:choosewin_overlay_enable = 1
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

" vim-go {

    "auto save run GoImports
    autocmd BufWritePre *.go :GoImports

    "automatically rebalance windows on vim resize
    autocmd VimResized * :wincmd =


    let g:go_fmt_command = "goimports"
    let g:go_autodetect_gopath = 1
    let g:go_list_type = "quickfix"

    let g:go_def_mapping_enabled = 0
    let g:go_fmt_fail_silently = 0
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_generate_tags = 1

    " Open :GoDeclsDir with ctrl-g
    nmap <C-g> :GoDeclsDir<cr>
    imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


    augroup go
        autocmd!

        " Show by default 4 spaces for a tab
        autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

        " :GoBuild and :GoTestCompile
        autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

        " :GoTest
        autocmd FileType go nmap <leader>t  <Plug>(go-test)

        " :GoRun
        autocmd FileType go nmap <leader>r  <Plug>(go-run)

        " :GoDoc
        autocmd FileType go nmap <Leader>d <Plug>(go-doc)

        " :GoCoverageToggle
        autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

        " :GoInfo
        autocmd FileType go nmap <Leader>i <Plug>(go-info)

        " :GoMetaLinter
        autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

        " :GoDef but opens in a vertical split
        autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
        " :GoDef but opens in a horizontal split
        autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

        " :GoAlternate  commands :A, :AV, :AS and :AT
        autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
        autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
        autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
        autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
    augroup END

    " build_go_files is a custom function that builds or compiles the test file.
    " It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
    function! s:build_go_files()
        let l:file = expand('%')
        if l:file =~# '^\f\+_test\.go$'
            call go#test#Test(0, 1)
        elseif l:file =~# '^\f\+\.go$'
            call go#cmd#Build(0)
        endif
    endfunction
"}

is g:isMac
    set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
elseif g:isLinux
    set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim
endif

if g:isGUI
    "Airline {
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

        let g:airline_symbols.space = "\ua0"

        "Buffer {
            " 打开tabline功能,方便查看Buffer和切换
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#show_splits = 1           
            let g:airline#extensions#tabline#show_tabs = 0
            let g:airline#extensions#tabline#show_buffers = 0
            let g:airline#extensions#tabline#show_tab_type = 0
            let g:airline#extensions#tabline#buffer_nr_show = 1
            let g:airline#extensions#tabline#fnamemod = ':t'

            let g:airline#extensions#tabline#buffer_idx_mode = 1
            nmap <leader>1 <Plug>AirlineSelectTab1
            nmap <leader>2 <Plug>AirlineSelectTab2
            nmap <leader>3 <Plug>AirlineSelectTab3
            nmap <leader>4 <Plug>AirlineSelectTab4
            nmap <leader>5 <Plug>AirlineSelectTab5
            nmap <leader>6 <Plug>AirlineSelectTab6
            nmap <leader>7 <Plug>AirlineSelectTab7
            nmap <leader>8 <Plug>AirlineSelectTab8
            nmap <leader>9 <Plug>AirlineSelectTab9
            nmap <leader>- <Plug>AirlineSelectPrevTab
            nmap <leader>+ <Plug>AirlineSelectNextTab

            " 设置切换Buffer快捷键"
            nnoremap <leader>bn :bn<CR>
            nnoremap <leader>bp :bp<CR>
        "}
    "}
endif
