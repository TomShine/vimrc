"======================================================================
"
" init-plugins.vim -
"======================================================================

" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
    let g:bundle_group = ['basic', 'tags', 'enhanced', 'filetypes', 'textobj']
    let g:bundle_group += ['tags', 'airline', 'nerdtree', 'ale', 'ycm', 'echodoc']
    let g:bundle_group += ['leaderf', 'tools']
endif

"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
    let path = expand(s:home . '/' . a:path )
    return substitute(path, '\\', '/', 'g')
endfunc

"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))

"----------------------------------------------------------------------
" 默认插件
"----------------------------------------------------------------------
Plug 'jiangmiao/auto-pairs'

" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'easymotion/vim-easymotion'
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" vmap <leader>ea <Plug>(EasyAlign)
" nmap <leader>ea <Plug>(EasyAlign)

" 文件浏览器，代替 netrw
Plug 'justinmk/vim-dirvish'

" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
" nnoremap <space>a= :Tabularize /=<CR>
" vnoremap <space>a= :Tabularize /=<CR>
" nnoremap <space>a/ :Tabularize /\/\//l2c1l0<CR>
" vnoremap <space>a/ :Tabularize /\/\//l2c1l0<CR>
" nnoremap <space>a, :Tabularize /,/l0r1<CR>
" vnoremap <space>a, :Tabularize /,/l0r1<CR>
" nnoremap <space>al :Tabularize /\|<cr>
" vnoremap <space>al :Tabularize /\|<cr>
" nnoremap <space>a<bar> :Tabularize /\|<cr>
" vnoremap <space>a<bar> :Tabularize /\|<cr>
" nnoremap <space>ar :Tabularize /\|/r0<cr>
" vnoremap <space>ar :Tabularize /\|/r0<cr>

" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'

" 快速注释
Plug 'scrooloose/nerdcommenter'
let NERDSpaceDelims     = 1 " 自动添加前置空格
let NERDCompactSexyComs = 1
map ;cc <plug>NERDCommenterComment
map ;cu <plug>NERDCommenterUncomment

" 快速运行
Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
        \   "_" : {
        \       "outputter" : "message",
        \   },
        \}
let g:quickrun_no_default_key_mappings = 1
map <space>R :QuickRun<CR>

Plug 'ervandew/supertab'
" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
let g:SuperTabRetainCompletionType=2

Plug 'tpope/vim-unimpaired'

Plug 'SirVer/ultisnips'
"UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

Plug 'honza/vim-snippets'

Plug 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>lq'
let g:lt_quickfix_list_toggle_map = '<leader>oq'
let g:lt_height = 10


"----------------------------------------------------------------------
" Dirvish 设置：自动排序并隐藏文件，同时定位到相关文件
" 这个排序函数可以将目录排在前面，文件排在后面，并且按照字母顺序排序
" 比默认的纯按照字母排序更友好点。
"----------------------------------------------------------------------
function! s:setup_dirvish()
    if &buftype != 'nofile' && &filetype != 'dirvish'
        return
    endif
    if has('nvim')
        return
    endif
    " 取得光标所在行的文本（当前选中的文件名）
    let text = getline('.')
    if ! get(g:, 'dirvish_hide_visible', 0)
        exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
    endif
    " 排序文件名
    exec 'sort ,^.*[\/],'
    let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
    " 定位到之前光标处的文件
    call search(name, 'wc')
    noremap <silent><buffer> ~ :Dirvish ~<cr>
    noremap <buffer> % :e %
endfunc

augroup MyPluginSetup
    autocmd!
    autocmd FileType dirvish call s:setup_dirvish()
augroup END


"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

    " 展示开始画面，显示最近编辑过的文件
    Plug 'mhinz/vim-startify'
    " 默认不显示 startify
    let g:startify_disable_at_vimenter = 1
    let g:startify_session_dir = '~/.vim/session'

    " 一次性安装一大堆 colorscheme
    Plug 'flazz/vim-colorschemes'

    " 支持库，给其他插件用的函数库
    Plug 'xolox/vim-misc'

    " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
    Plug 'kshenoy/vim-signature'

    " 用于在侧边符号栏显示 git/svn 的 diff
    Plug 'mhinz/vim-signify'
     " signify 调优
    let g:signify_vcs_list = ['git', 'svn']
    let g:signify_sign_add               = '+'
    let g:signify_sign_delete            = '_'
    let g:signify_sign_delete_first_line = '‾'
    let g:signify_sign_change            = '~'
    let g:signify_sign_changedelete      = g:signify_sign_change
     " git 仓库使用 histogram 算法进行 diff
    let g:signify_vcs_cmds = {
            \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
            \}

    " 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
    " 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
    Plug 'mh21/errormarker.vim'

    " 使用 SPACE+w+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
    Plug 't9md/vim-choosewin'
    " if you want to use overlay feature
    let g:choosewin_overlay_enable = 1
    " 使用 ALT+E 来选择窗口
    nmap <Space>we <Plug>(choosewin)

    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview'

    " Git 支持
    Plug 'tpope/vim-fugitive'

    " 使用 <space>ha 清除 errormarker 标注的错误
    noremap <silent><Space>ha :RemoveErrorMarkers<cr>

    " 括号彩虹
    Plug 'kien/rainbow_parentheses.vim'
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

    " 显示缩进的线
    Plug 'nathanaelkane/vim-indent-guides'
    "let g:indent_guides_enable_on_vim_startup = 1  " 随vim 自启动,h默认关闭
    let g:indent_guides_start_level=2               " 从第二层开始可视化显示缩进
    let g:indent_guides_guide_size            = 1   " 色块宽度(指定对齐线的尺寸)
    nmap <silent> <space>gi :IndentGuidesToggle<cr> " 快捷键 i 开/关缩进可视化

    Plug 'majutsushi/tagbar'
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

    " <space>fb(打开tagbar)
    nmap <Space>fb :TagbarToggle<CR>
endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

    " 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
    Plug 'terryma/vim-expand-region'

    " 快速文件搜索
    Plug 'junegunn/fzf'

    " 给不同语言提供字典补全，插入模式下 c-x c-k 触发
    Plug 'asins/vim-dict'

    " 使用 :FlyGrep 命令进行实时 grep
    Plug 'wsdjeg/FlyGrep.vim'
    nnoremap <Space>s/ :FlyGrep<cr>

    Plug 'rking/ag.vim'
    if executable('ag')
        " Use Ag over Grep
        let g:ackprg='ag --nogroup --nocolor --column'
    endif

    Plug 'Chun-Yang/vim-action-ag'
    " use * to search current word in normal mode
    nmap * <Plug>AgActionWord
    " use * to search selected text in visual mode
    vmap * <Plug>AgActionVisual

    " 配对括号和引号自动补全
    Plug 'Raimondi/delimitMate'

    " 提供 gist 接口
    Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }

    " ALT_+/- 用于按分隔符扩大缩小 v 选区
    map <m-=> <Plug>(expand_region_expand)
    map <m--> <Plug>(expand_region_shrink)

    " use wakatime
    Plug 'wakatime/vim-wakatime'
endif


"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0

    " 提供 ctags/gtags 后台数据库自动更新功能
    Plug 'ludovicchabant/vim-gutentags'

    " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
    Plug 'skywind3000/gutentags_plus'

    " 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
    let g:gutentags_project_root = ['.root']
    let g:gutentags_ctags_tagfile = '.tags'

    " 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " 默认禁用自动生成
    let g:gutentags_modules = []

    " 如果有 ctags 可执行就允许动态生成 ctags 文件
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif

    " 如果有 gtags 可执行就允许动态生成 gtags 数据库
    if executable('gtags') && executable('gtags-cscope')
        let g:gutentags_modules += ['gtags_cscope']
    endif

    " 设置 ctags 的参数
    let g:gutentags_ctags_extra_args = []
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 使用 universal-ctags 的话需要下面这行，请反注释
    " let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 禁止 gutentags 自动链接 gtags 数据库
    let g:gutentags_auto_add_gtags_cscope = 0
endif


"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj')

    " 基础插件：提供让用户方便的自定义文本对象的接口
    Plug 'kana/vim-textobj-user'

    " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
    Plug 'kana/vim-textobj-indent'

    " 语法文本对象：iy/ay 基于语法的文本对象
    Plug 'kana/vim-textobj-syntax'

    " 函数文本对象：if/af 支持 c/c++/vim/java
    Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

    " 参数文本对象：i,/a, 包括参数或者列表元素
    Plug 'sgur/vim-textobj-parameter'

    " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
    Plug 'bps/vim-textobj-python', {'for': 'python'}

    " 提供 uri/url 的文本对象，iu/au 表示
    Plug 'jceb/vim-textobj-uri'
endif


"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0
    " json 的语法高亮
    Plug 'elzr/vim-json'

    " protobuf 的语法高亮
    Plug 'uarun/vim-protobuf'

    " go 语法高亮增强
    Plug 'fatih/vim-go'

    " powershell 脚本文件的语法高亮
    Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

    " lua 语法高亮增强
    Plug 'tbastos/vim-lua', { 'for': 'lua' }

    " C++ 语法高亮增强，支持 11/14/17 标准
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

    " 额外语法文件
    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

    " python 语法文件增强
    Plug 'vim-python/python-syntax', { 'for': ['python'] }

    " rust 语法增强
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }

    " vim org-mode
    Plug 'jceb/vim-orgmode', { 'for': 'org' }

    " markdown
    Plug 'plasticboy/vim-markdown'

    " nginx
    Plug 'vim-scripts/nginx.vim'
endif

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


"---------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    if has('darwin')
        set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
    elseif has("unix") && has("gui_running")
        set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim
    endif

    "这个是安装字体后 必须设置此项
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_exclude_preview = 1
    let g:airline_section_b = '%n'
    let g:airline_theme='deus'
    " let g:airline_theme="badwolf"
    " let g:airline_theme="luna"
    " let g:airline_theme="molokai"
    " let g:airline_theme="solarized"
    " 关闭状态显示空白符号计数
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'

    " let g:airline_symbols.space = "\ua0"
    " For patched power-line fonts
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline#extensions#branch#enabled = 0
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#fugitiveline#enabled = 0
    let g:airline#extensions#csv#enabled = 0
    let g:airline#extensions#vimagit#enabled = 0

    " Buffer {
    "     " 打开tabline功能,方便查看Buffer和切换
    "     let g:airline#extensions#tabline#enabled = 1
    "     let g:airline#extensions#tabline#show_splits = 1
    "     let g:airline#extensions#tabline#show_tabs = 0
    "     let g:airline#extensions#tabline#show_buffers = 0
    "     let g:airline#extensions#tabline#show_tab_type = 0
    "     let g:airline#extensions#tabline#buffer_nr_show = 1
    "     let g:airline#extensions#tabline#fnamemod = ':t'

    "     let g:airline#extensions#tabline#buffer_idx_mode = 1
    "     nmap <leader>1 <Plug>AirlineSelectTab1
    "     nmap <leader>2 <Plug>AirlineSelectTab2
    "     nmap <leader>3 <Plug>AirlineSelectTab3
    "     nmap <leader>4 <Plug>AirlineSelectTab4
    "     nmap <leader>5 <Plug>AirlineSelectTab5
    "     nmap <leader>6 <Plug>AirlineSelectTab6
    "     nmap <leader>7 <Plug>AirlineSelectTab7
    "     nmap <leader>8 <Plug>AirlineSelectTab8
    "     nmap <leader>9 <Plug>AirlineSelectTab9
    "     nmap <leader>- <Plug>AirlineSelectPrevTab
    "     nmap <leader>+ <Plug>AirlineSelectNextTab
    "}
endif


"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
if index(g:bundle_group, 'nerdtree') >= 0
    Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    let g:NERDTreeMinimalUI = 1 " NERDTree 子窗口中不显示冗余帮助信息
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeHijackNetrw = 0
    let NERDTreeWinSize = 33       " 设置 NERDTree 子窗口宽度
    let NERDTreeWinPos = "right"   " 设置 NERDTree 子窗口位置
    let NERDTreeShowBookmarks = 1  " 显示书签列表
    let NERDTreeIgnore = ['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '.DS_Store'] " 忽略文件
    let NERDTreeChDirMode = 0
    let NERDTreeMouseMode = 2
    let NERDTreeShowHidden = 1      " 显示隐藏文件
    let NERDTreeBookmarksFile = expand('$HOME') . '/.vim/NERDTreeBookmarks'
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

    noremap <space>ft :NERDTreeToggle<cr>
endif


"----------------------------------------------------------------------
" LanguageTool 语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'grammer') >= 0
    Plug 'rhysd/vim-grammarous'
    noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
    map <space>rr <Plug>(grammarous-open-info-window)
    map <space>rv <Plug>(grammarous-move-to-info-window)
    map <space>rs <Plug>(grammarous-reset)
    map <space>rx <Plug>(grammarous-close-info-window)
    map <space>rm <Plug>(grammarous-remove-error)
    map <space>rd <Plug>(grammarous-disable-rule)
    map <space>rn <Plug>(grammarous-move-to-next-error)
    map <space>rp <Plug>(grammarous-move-to-previous-error)
endif


"----------------------------------------------------------------------
" ale：动态语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'ale') >= 0
    Plug 'w0rp/ale'

    " 设定延迟和提示信息
    let g:ale_completion_delay = 500
    let g:ale_echo_delay = 20
    let g:ale_lint_delay = 500
    let g:ale_echo_msg_format = '[%linter%] %code: %%s'

    " 设定检测的时机：normal 模式文字改变，或者离开 insert模式
    " 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1

    " 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
    if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
        let g:ale_command_wrapper = 'nice -n5'
    endif

    " 允许 airline 集成
    let g:airline#extensions#ale#enabled = 1

    " 编辑不同文件类型需要的语法检查器
    let g:ale_linters = {
                \ 'c': ['gcc', 'cppcheck'],
                \ 'cpp': ['gcc', 'cppcheck'],
                \ 'python': ['flake8', 'pylint'],
                \ 'lua': ['luac'],
                \ 'go': ['go build', 'gofmt'],
                \ 'java': ['javac'],
                \ 'javascript': ['eslint'],
                \ }


    " 获取 pylint, flake8 的配置文件，在 vim-init/tools/conf 下面
    function s:lintcfg(name)
        let conf = s:path('tools/conf/')
        let path1 = conf . a:name
        let path2 = expand('~/.vim/linter/'. a:name)
        if filereadable(path2)
            return path2
        endif
        return shellescape(filereadable(path2)? path2 : path1)
    endfunc

    " 设置 flake8/pylint 的参数
    let g:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')
    let g:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
    let g:ale_python_pylint_options .= ' --disable=W'
    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
    let g:ale_c_cppcheck_options = ''
    let g:ale_cpp_cppcheck_options = ''
    " let g:ale_sign_error = '✗'
    " let g:ale_sign_warning = '⚠'
    let g:ale_sign_error = '✖'
    let g:ale_sign_warning = '➤'
    " let g:ale_sign_error = '•'
    " let g:ale_sign_warning = '•'

    let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']

    " 如果没有 gcc 只有 clang 时（FreeBSD）
    if executable('gcc') == 0 && executable('clang')
        let g:ale_linters.c += ['clang']
        let g:ale_linters.cpp += ['clang']
    endif

    hi link ALEErrorSign    Error
    hi link ALEWarningSign  Warning

    nmap sp <Plug>(ale_previous_wrap) "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
    nmap sn <Plug>(ale_next_wrap)
endif

"----------------------------------------------------------------------
" YCM : 补全
"----------------------------------------------------------------------
if index(g:bundle_group, 'ycm') >= 0
    function! BuildYCM(info)
        if a:info.status == 'installed' || a:info.force
            !./install.sh --clang-completer --gocode-completer --system-libclang
        endif
    endfunction
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') , 'for': [ 'go', 'python' , 'c' , 'cpp'], 'on': [] }

    " UltiSnips 的 tab 键与 YCM 冲突，重新设定, If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
endif


"----------------------------------------------------------------------
" echodoc：搭配 YCM/deoplete 在底部显示函数参数
"----------------------------------------------------------------------
if index(g:bundle_group, 'echodoc') >= 0
    Plug 'Shougo/echodoc.vim'
    set noshowmode
    let g:echodoc#enable_at_startup = 1
endif


"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
if index(g:bundle_group, 'leaderf') >= 0
    " 如果 vim 支持 python 则启用  Leaderf
    if has('python') || has('python3')
        Plug 'Yggdroot/LeaderF'

        let g:Lf_CommandMap = {'<Tab>': ['<ESC>']}

        " CTRL+p 打开文件模糊匹配
        " let g:Lf_ShortcutF = '<c-p>'
        let g:Lf_ShortcutF = '<space>ff'

        " ALT+n 打开 buffer 模糊匹配
        " let g:Lf_ShortcutB = '<m-n>'
        let g:Lf_ShortcutB = '<space>fb'

        " CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
        " noremap <c-n> :LeaderfMru<cr>
        noremap <space>fr :LeaderfMru<cr>

        " ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
        noremap <m-p> :LeaderfFunction!<cr>
        " noremap <space>fn :LeaderfFunction!<cr>


        " ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
        noremap <m-P> :LeaderfBufTag!<cr>
        " noremap <space>fbt :LeaderfBufTag!<cr>

        " ALT+n 打开 buffer 列表进行模糊匹配
        noremap <m-n> :LeaderfBuffer<cr>
        " noremap<space>fb :LeaderfBuffer<cr>

        " 全局 tags 模糊匹配
        noremap <m-m> :LeaderfTag<cr>
        " noremap <space>ft :LeaderfTag<cr>

        " 最大历史文件保存 2048 个
        let g:Lf_MruMaxFiles = 2048

        " ui 定制
        let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

        " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
        let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
        let g:Lf_WorkingDirectoryMode = 'Ac'
        let g:Lf_WindowHeight = 0.30
        let g:Lf_CacheDirectory = expand('~/.vim/cache')

        " 显示绝对路径
        let g:Lf_ShowRelativePath = 0

        " 隐藏帮助
        let g:Lf_HideHelp = 1

        " 模糊匹配忽略扩展名
        let g:Lf_WildIgnore = {
                    \ 'dir': ['.svn','.git','.hg'],
                    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
                    \ }

        " MRU 文件忽略扩展名
        let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
        let g:Lf_StlColorscheme = 'powerline'

        " 禁用 function/buftag 的预览功能，可以手动用 p 预览
        let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

        " 使用 ESC 键可以直接退出 leaderf 的 normal 模式
        let g:Lf_NormalMap = {
                \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
                \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
                \ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
                \ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
                \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
                \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
                \ }

    else
        " 不支持 python ，使用 CtrlP 代替
        Plug 'ctrlpvim/ctrlp.vim'

        " 显示函数列表的扩展插件
        Plug 'tacahiroy/ctrlp-funky'

        " 忽略默认键位
        let g:ctrlp_map = ''

        " 模糊匹配忽略
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/]\.(git|hg|svn)$',
          \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht)$',
          \ 'link': 'some_bad_symbolic_links',
          \ }

        " 项目标志
        let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
        let g:ctrlp_working_path = 0

        " CTRL+p 打开文件模糊匹配
        " noremap <c-p> :CtrlP<cr>
        noremap <c-p> :CtrlP<cr>

        " CTRL+n 打开最近访问过的文件的匹配
        " noremap <c-n> :CtrlPMRUFiles<cr>
        noremap <space>fr :CtrlPMRUFiles<cr>

        " ALT+p 显示当前文件的函数列表
        " noremap <m-p> :CtrlPFunky<cr>
        noremap <m-p> :CtrlPFunky<cr>

        " ALT+n 匹配 buffer
        noremap <m-n> :CtrlPBuffer<cr>
    endif
endif

"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
if index(g:bundle_group, 'tools') >= 0
    Plug 'wakatime/vim-wakatime'

    Plug 'editorconfig/editorconfig-vim'

    if has('mac')
        Plug 'rizzatti/dash.vim'
    endif

    Plug 'rhysd/vim-clang-format'
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<CR>
    nmap <leader>C :ClangFormatAutoToggle<CR> " Toggle auto formatting:

    Plug 'vim-scripts/indentpython.vim'

    Plug 'kana/vim-operator-user'
endif


"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()


"----------------------------------------------------------------------
" YouCompleteMe 默认设置：YCM 需要你另外手动编译安装
"----------------------------------------------------------------------
augroup load_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('YouCompleteMe','ultisnips') | autocmd! load_ycm
augroup END

let g:ycm_global_ycm_extra_conf='~/.vim/tools/conf/ycm_extra_conf.py'

" 禁用预览功能：扰乱视听
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" 禁用诊断功能：我们用前面更好用的 ALE 代替
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

let g:ycm_confirm_extra_conf=0                    " 关闭加载.ycm_extra_conf.py提示
let g:ycm_cache_omnifunc=0                        " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1          " 语法关键字补全let g:ycm_autoclose_preview_window_after_insertion = 1

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" noremap <c-z> <NOP>

" Youcompleteme的默认tab,s-tab 和自动补全冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

" 修改弹框为灰色
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

" 两个字符自动触发语义补全
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

" ycm
nnoremap <space>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <space>jr :YcmCompleter GoToReferences<cr>


"----------------------------------------------------------------------
" Ycm 白名单（非名单内文件不启用 YCM），避免打开个 1MB 的 txt 分析半天
"----------------------------------------------------------------------
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