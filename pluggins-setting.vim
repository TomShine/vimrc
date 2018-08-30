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
"}

"vim-easy-align {
    if !exists('g:easy_align_delimiters')
        let g:easy_align_delimiters = {}
    endif

    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
"}
