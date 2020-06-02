" 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

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

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args += ['--fields=+niazS']
let g:gutentags_ctags_extra_args += ['--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal-ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁止 gutentags 自动链接 gtags 数据库
let g:gutentags_auto_add_gtags_cscope = 0

" 调试
let g:gutentags_define_advanced_commands = 1
let g:gutentags_trace = 0
