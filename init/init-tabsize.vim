"======================================================================
"
" init-tabsize.vim - 大部分人对 tabsize 都有自己的设置，改这里即可
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 22:05:44
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------

" 设置缩进宽度
set sw=4

" 设置 TAB 宽度
set ts=4

" 禁止展开 tab (noexpandtab)
set noet

" Default Indentation(默认缩进)
set autoindent
set smartindent         " indent when
set tabstop=4           " tab width(设置编辑时制表符占用空格数)
set softtabstop=4       " backspace(让 vim 把连续数量的空格视为一个制表符)
set shiftwidth=4        " indent width(设置格式化时制表符占用空格数)
set expandtab           " expand tab to space(将制表符扩展为空格)

augroup PythonTab
    au!
    " 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
    " 时自动设置成空格缩进。
    "au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END


