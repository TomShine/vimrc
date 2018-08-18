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

" vim-choosewin {
    " if you want to use overlay feature
    let g:choosewin_overlay_enable = 1
"}

" airline {
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

" echodoc {
    set noshowmode
    let g:echodoc#enable_at_startup = 1
" }


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

"vim-go {
    let g:go_def_mapping_enabled = 0
    "Enable goimports to automatically insert import paths instead of gofmt
    let g:go_fmt_command = "goimports" 
    let g:go_fmt_fail_silently = 0
    let g:go_list_type = "quickfix"

    "auto save run GoImports
    autocmd BufWritePre *.go :GoImports

    "automatically rebalance windows on vim resize
    autocmd VimResized * :wincmd =
    
    au FileType go nmap <leader>grun <Plug>(go-run)
    au FileType go nmap <leader>gbuild <Plug>(go-build)
    au FileType go nmap <leader>gtest <Plug>(go-test)
    au FileType go nmap <leader>tf <Plug>(go-test-func)

    au FileType go nmap <leader>gcov <Plug>(go-coverage)
    au FileType go nmap <leader>gds <Plug>(go-def-split)
    au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
    au FileType go nmap <leader>gdt <Plug>(go-def-tab)
    au FileType go nmap <leader>grename <Plug>(go-rename)
    au FileType go nmap <leader>gim <Plug>(go-implements)
    au FileType go nmap <leader>ginfo <Plug>(go-info)
    au FileType go nmap <leader>gdoc <Plug>(go-doc)
    au FileType go nmap <leader>gdocv <Plug>(go-doc-vertical)

    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"}

"vim-clang-format {
    " Auto-enabling auto-formatting
    "autocmd FileType c ClangFormatAutoEnable

    "llvm, google, chromium, mozilla is supported. The default value is google.
    " g:clang_format#code_style = google 
    " let g:clang_format#code_style = 'llvm'
    let g:clang_format#style_options = {
        \ "AccessModifierOffset" : -4,
        \ "AllowShortIfStatementsOnASingleLine" : "true",
        \ "AlwaysBreakTemplateDeclarations" : "true",
        \ "Standard" : "C++11",
        \ "BreakBeforeBraces" : "Stroustrup"}

    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<CR>

    " if you install vim-operator-user
    "autocmd FileType c,cpp,objc map <buffer><leader>x <Plug>(operator-clang-format)

    " Toggle auto formatting:
    nmap <leader>C :ClangFormatAutoToggle<CR>
"}

" echodoc.vim {
    let g:echodoc_enable_at_startup = 1
"}

" UltiSnips 的 tab 键与 YCM 冲突，重新设定 {
        let g:UltiSnipsExpandTrigger="<leader><tab>"
        let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
        let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"
    "}

" YCM {
    if has("mac")
        "autocmd! VimEnter * call plug#load('ultisnips', 'YouCompleteMe') 
        ""        \| call youcompleteme#Enable()

        set completeopt=longest,menu                                  " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif       " 离开插入模式后自动关闭预览窗口
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"  " 回车即选中当前项

        
        "let g:ycm_key_list_select_completion=['<c-n>']    " Youcompleteme的默认tab,s-tab 和自动补全冲突
        let g:ycm_key_list_select_completion = ['<Down>']
        "let g:ycm_key_list_previous_completion=['<c-p>']
        let g:ycm_key_list_previous_completion = ['<Up>']
        let g:ycm_key_invoke_completion = '<C-Space>'
        let g:ycm_confirm_extra_conf=0                    " 关闭加载.ycm_extra_conf.py提示
        let g:ycm_collect_identifiers_from_tags_files=1   " 开启 YCM 基于标签引擎
        let g:ycm_min_num_of_chars_for_completion=2       " 从第2个键入字符就开始罗列匹配项
        let g:ycm_cache_omnifunc=0                        " 禁止缓存匹配项,每次都重新生成匹配项
        let g:ycm_seed_identifiers_with_syntax=1          " 语法关键字补全
        let g:ycm_complete_in_comments = 1                " 在注释输入中也能补全
        let g:ycm_complete_in_strings = 1                 " 在字符串输入中也能补全
        let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
        let g:ycm_error_symbol = '✗'
        let g:ycm_warning_symbol = '✗'

        let g:ycm_global_ycm_extra_conf = '$HOME/.vim/.ycm_extra_conf.py' 
        let g:ycm_extra_conf_globlist = '$HOME/.vim/.ycm_extra_conf.py'
        let g:ycm_autoclose_preview_window_after_insertion = 1
        "let g:ycm_server_python_interpreter = '/usr/bin/python'
        "let g:ycm_python_binary_path = 'python'

        let g:ycm_filetype_blacklist = {
              \ 'tagbar' : 1,
              \ 'qf' : 1,
              \ 'notes' : 1,
              \ 'markdown' : 1,
              \ 'unite' : 1,
              \ 'text' : 1,
              \ 'vimwiki' : 1,
              \ 'pandoc' : 1,
              \ 'infolog' : 1,
              \ 'mail' : 1,
              \ 'gitcommit' : 1
              \}

        let g:ycm_semantic_triggers =  {
          \   'c' : ['->', '.','re![_a-zA-z0-9]'],
          \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
          \             're!\[.*\]\s'],
          \   'ocaml' : ['.', '#'],
          \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
          \   'perl' : ['->'],
          \   'php' : ['->', '::'],
          \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
          \   'ruby' : ['.', '::'],
          \   'lua' : ['.', ':'],
          \   'erlang' : [':'],
          \ }
    elseif has("unix")
        "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplete.
        let g:neocomplete#enable_at_startup = 1
        " Use smartcase.
        let g:neocomplete#enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplete#undo_completion()
        inoremap <expr><C-l>     neocomplete#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
          " For no inserting <CR> key.
          "return pumvisible() ? "\<C-y>" : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
        " Close popup by <Space>.
        "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

        " AutoComplPop like behavior.
        "let g:neocomplete#enable_auto_select = 1

        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplete#enable_auto_select = 1
        "let g:neocomplete#disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
        endif
        "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

        " For perlomni.vim setting.
        " https://github.com/c9s/perlomni.vim
        let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    endif
""}

" python-mode {
    let g:pymode_python = 'python3'
"}

"vim-easy-align {
    if !exists('g:easy_align_delimiters')
        let g:easy_align_delimiters = {}
    endif

    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
"}
