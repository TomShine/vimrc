"======================================================================
"
" init-plugins.vim - about plugins
"
"======================================================================

" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" system detection
"----------------------------------------------------------------------
if exists('g:asc_uname')
    let s:uname = g:asc_uname
elseif has('win32') || has('win64') || has('win95') || has('win16')
    let s:uname = 'windows'
elseif has('win32unix')
    let s:uname = 'cygwin'
elseif has('unix')
    let s:uname = substitute(system("uname"), '\s*\n$', '', 'g')
    if !v:shell_error && s:uname == "Linux"
        let s:uname = 'linux'
    elseif v:shell_error == 0 && match(s:uname, 'Darwin') >= 0
        let s:uname = 'darwin'
    else
        let s:uname = 'posix'
    endif
else
    let s:uname = 'posix'
endif

let g:bundle#uname = s:uname


let g:isMac = 0
let g:isLinux = 0
let g:isFreeBSD = 0

if has('mac')
    let g:isMac = 1
elseif has('unix')
    let g:isLinux = 1
elseif has('bsd')
    leg g:isFreeBSD = 1
endif


"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
    let g:bundle_group = ['simple']
    let g:bundle_group += ['basic', 'tags', 'airline', 'nerdtree', 'filetypes']
    " let g:bundle_group += ['leaderf', 'ale', 'grammer', 'ycm', 'echoodc']
    let g:bundle_group += ['leaderf', 'ale', 'grammer', 'ycm', 'echoodc']
    let g:bundle_group += ['echodoc', 'enhanced', 'hight']
    let g:bundle_group += ['tools']
endif


"----------------------------------------------------------------------
" 计算当前 ShangVim 的子路径
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
" simple: 默认插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'simple') >= 0
    " 文件浏览器，代替 netrw
    Plug 'justinmk/vim-dirvish'
    LoadScript site/bundle/dirvish.vim
    LoadScript site/bundle/vinegar.vim

    " 配对括号和引号自动补全
    Plug 'Raimondi/delimitMate'
"
    " Git 支持
    Plug 'tpope/vim-fugitive'

    " 映射快捷键, unimpaired 中定义了 [b, ]b 来切换缓存
    Plug 'tpope/vim-unimpaired'
    noremap <silent> <leader>bn :bn<cr>
    noremap <silent> <leader>bp :bp<cr>

    " 表格对齐，使用命令 Tabularize
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

    Plug 'bootleq/vim-cycle'
    Plug 'tpope/vim-surround'

    nnoremap gb= :Tabularize /=<CR>
    vnoremap gb= :Tabularize /=<CR>
    nnoremap gb/ :Tabularize /\/\//l4c1<CR>
    vnoremap gb/ :Tabularize /\/\//l4c1<CR>
    nnoremap gb, :Tabularize /,/r0l1<CR>
    vnoremap gb, :Tabularize /,/r0l1<CR>
    nnoremap gbl :Tabularize /\|<cr>
    vnoremap gbl :Tabularize /\|<cr>
    nnoremap gbc :Tabularize /#/l4c1<cr>
    nnoremap gb<bar> :Tabularize /\|<cr>
    vnoremap gb<bar> :Tabularize /\|<cr>
    nnoremap gbr :Tabularize /\|/r0<cr>
    vnoremap gbr :Tabularize /\|/r0<cr>
    map gz <Plug>Sneak_s
    map gZ <Plug>Sneak_S

    LoadScript site/bundle/cycle.vim

    " 全文快速移动，<leader><leader>f{char} 即可触发
    Plug 'easymotion/vim-easymotion'

    if !exists('g:easy_align_delimiters')
        let g:easy_align_delimiters = {}
    endif

    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
    " vmap <leader>ea <Plug>(EasyAlign)
    " nmap <leader>ea <Plug>(EasyAlign)

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

    Plug 'ervandew/supertab'
    " 0 - 不记录上次的补全方式
    " 1 - 记住上次的补全方式,直到用其他的补全命令改变它
    " 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
    let g:SuperTabRetainCompletionType=2
    let g:SuperTabRetainCompletionType=2

    " 代码片段
    "Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " 显示 quickfix list 和 location-list
    Plug 'Valloric/ListToggle'
    let g:lt_height = 10
    let g:lt_quickfix_list_toggle_map = '<leader>qt'
    let g:lt_location_list_toggle_map = '<leader>lt'


    Plug 'skywind3000/vim-quickui'

    " Undotree
    Plug 'mbbill/undotree'

    " A nice customizable popup menu for vim
    Plug 'skywind3000/quickmenu.vim'
    " choose a favorite key to show/hide quickmenu
    noremap <silent><F12> :call quickmenu#toggle(0)<cr>
    " enable cursorline (L) and cmdline help (H)
    let g:quickmenu_options = "HL"
endif


"----------------------------------------------------------------------
" basic基础插件
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
    " noremap <space>ht :Startify<cr>
    " noremap <space>hy :tabnew<cr>:Startify<cr>

    " let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1
    " let g:cpp_experimental_simple_template_highlight = 1
    let g:cpp_concepts_highlight = 1
    let g:cpp_no_function_highlight = 1
    let g:cpp_posix_standard = 1

    let g:python_highlight_builtins = 1
    let g:python_highlight_builtin_objs = 1
    let g:python_highlight_builtin_types = 1
    let g:python_highlight_builtin_funcs = 1

    map <m-+> <Plug>(expand_region_expand)
    map <m-_> <Plug>(expand_region_shrink)

    " 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
    " 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
    Plug 'mh21/errormarker.vim'
    noremap <silent><leader>ha :RemoveErrorMarkers<cr>

    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview'
    "P 预览 大p关闭
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

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
    nmap <silent> <leader>gi :IndentGuidesToggle<cr> " 快捷键 i 开/关缩进可视化

    " 异步运行
    Plug 'skywind3000/asyncrun.vim'
    Plug 'skywind3000/asynctasks.vim'
    LoadScript site/bundle/asynctasks.vim

    " 终端
    Plug 'skywind3000/vim-terminal-help'

    " 简化 Unix 命令行
    Plug 'tpope/vim-eunuch'
endif


"----------------------------------------------------------------------
" package group - enhanced: 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0
    " 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
    Plug 'terryma/vim-expand-region'

    " 给不同语言提供字典补全，插入模式下 c-x c-k 触发
    Plug 'asins/vim-dict'

    " grep search: support rg, ag, ack, grep etc.
    Plug 'yegappan/grep'
    if executable('rg')
        let g:ackprg='rg --nogroup --nocolor --column'
    elseif executable('pt')
        let g:ackprg='pt --nogroup --nocolor --column'
    elseif executable('ag')
        let g:ackprg='ag --nogroup --nocolor --column'
    elseif executable('ack')
        let g:ackprg='ack --nogroup --nocolor --column'
    endif

    "ctrlsf
    Plug 'dyng/ctrlsf.vim'
    nmap     <C-F>f <Plug>CtrlSFPrompt
    vmap     <C-F>f <Plug>CtrlSFVwordPath
    vmap     <C-F>F <Plug>CtrlSFVwordExec
    nmap     <C-F>n <Plug>CtrlSFCwordPath
    nmap     <C-F>p <Plug>CtrlSFPwordPath
    nnoremap <C-F>o :CtrlSFOpen<CR>
    nnoremap <C-F>t :CtrlSFToggle<CR>
    inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

    " vim-gista 提供 gist 接口
    Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }
endif

"----------------------------------------------------------------------
" package group - high
"----------------------------------------------------------------------
if index(g:bundle_group, 'high') >= 0
    " Plug 'mh21/errormarker.vim'
    Plug 't9md/vim-choosewin'
    Plug 'francoiscabrol/ranger.vim'

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

    let g:errormarker_disablemappings = 1
    nnoremap <silent> <leader>cm :ErrorAtCursor<CR>
    nnoremap <silent> <leader>cM :RemoveErrorMarkers<cr>

    nmap <m-e> <Plug>(choosewin)
    let g:ranger_map_keys = 0
end

"----------------------------------------------------------------------
" package group - tags
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0

    set tags=./.tags;,.tags

    " 提供 ctags/gtags 后台数据库自动更新功能
    Plug 'ludovicchabant/vim-gutentags'

    " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
    Plug 'skywind3000/gutentags_plus'
    LoadScript site/bundle/gutentags.vim

    Plug 'skywind3000/tagbar'
    let g:tagbar_left = 1
endif

"----------------------------------------------------------------------
" package group - opt
"----------------------------------------------------------------------
if index(g:bundle_group, 'opt') >= 0
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'mhartington/oceanic-next'
    Plug 'jceb/vim-orgmode', { 'for': 'org' }
    Plug 'soft-aesthetic/soft-era-vim'
    Plug 'dyng/ctrlsf.vim'
    Plug 'tpope/vim-speeddating'
    Plug 'chiel92/vim-autoformat'
    Plug 'voldikss/vim-translator'
    Plug 'benmills/vimux'
    " Plug 'itchyny/vim-cursorword'
    LoadScript site/bundle/fzf.vim

    if 1
        " Echo translation in the cmdline
        nmap <silent> <Leader>tt <Plug>Translate
        vmap <silent> <Leader>tt <Plug>TranslateV
        " Display translation in a window
        nmap <silent> <Leader>tw <Plug>TranslateW
        vmap <silent> <Leader>tw <Plug>TranslateWV
        " Replace the text with translation
        nmap <silent> <Leader>tr <Plug>TranslateR
        vmap <silent> <Leader>tr <Plug>TranslateRV
        let g:translator_window_enable_icon = v:true
    endif
endif


"----------------------------------------------------------------------
" package group - filetypes 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0
    " 支持 go
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    LoadScript site/bundle/vimgo.vim

    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
    Plug 'pboettch/vim-cmake-syntax', { 'for': ['cmake'] }
    Plug 'beyondmarc/hlsl.vim'
    Plug 'tpope/vim-eunuch'

    " C++ 语法高亮增强，支持 11/14/17 标准
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
    " cppman
    Plug 'skywind3000/vim-cppman'

    " Python 支持
    "Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    " python 语法文件增强
    Plug 'vim-python/python-syntax', { 'for': ['python'] }

    " json 的语法高亮
    Plug 'elzr/vim-json'

    " protobuf 的语法高亮
    Plug 'uarun/vim-protobuf'

    " rust 语法增强
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }

    " powershell 脚本文件的语法高亮
    Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

    " lua 语法高亮增强
    Plug 'tbastos/vim-lua', { 'for': 'lua' }

    " markdown
    Plug 'plasticboy/vim-markdown'

    " nginx
    Plug 'vim-scripts/nginx.vim'

    " 额外语法文件
    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
endif

"----------------------------------------------------------------------
" optional
"----------------------------------------------------------------------

" YCM : 补全
if index(g:bundle_group, 'ycm') >= 0
    function! BuildYCM(info)
        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
            !./install.py --clang-completer --go-completer --rust-completer --ts-completer --system-libclang
        endif
    endfunction

    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') , 'for': [ 'go', 'python' , 'c' , 'cpp', 'rust', 'javascript'], 'on': [] }
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

    " UltiSnips 的 tab 键与 YCM 冲突，重新设定, If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    "----------------------------------------------------------------------
    " YouCompleteMe 默认设置：YCM 需要你另外手动编译安装
    "----------------------------------------------------------------------
    augroup load_ycm
       autocmd!
       autocmd InsertEnter * call plug#load('YouCompleteMe','ultisnips') | autocmd! load_ycm
    augroup END

    LoadScript site/bundle/ycm.vim
endif

" LeaderF 文件模糊匹配，tags/函数名 选择
if index(g:bundle_group, 'leaderf') >= 0
    " 如果 vim 支持 python 则启用 Leaderf
    if has('python') || has('python3')
        Plug 'Yggdroot/LeaderF'
        Plug 'tamago324/LeaderF-filer'
        LoadScript site/bundle/leaderf.vim
    else
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
        noremap <c-p> :CtrlP<cr>
        " CTRL+n 打开最近访问过的文件的匹配
        noremap <c-n> :CtrlPMRUFiles<cr>
        " ALT+p 显示当前文件的函数列表
        noremap <m-p> :CtrlPFunky<cr>
        " ALT+n 匹配 buffer
        noremap <m-n> :CtrlPBuffer<cr>
    endif
endif

" tools 配置
if index(g:bundle_group, 'tools') >= 0
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'kana/vim-operator-user'
    Plug 'shangzongyu/xmake.vim'
    if g:isMac
        Plug 'rizzatti/dash.vim'
    endif
endif

" deoplete
if index(g:bundle_group, 'deoplete') >= 0
    if has('nvim')
        Plug 'Shougo/deoplete.nvim'
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    " Plug 'zchee/deoplete-clang'
    Plug 'zchee/deoplete-jedi'
    LoadScript site/bundle/deoplete.vim
endif

" vimwiki
if index(g:bundle_group, 'vimwiki') >= 0
    Plug 'vimwiki/vimwiki'
    LoadScript site/bundle/vimwiki.vim
endif

" echodoc：搭配 YCM/deoplete 在底部显示函数参数
if index(g:bundle_group, 'echodoc') >= 0
    Plug 'Shougo/echodoc.vim'
    set noshowmode
    let g:echodoc#enable_at_startup = 1
endif

" airline
if index(g:bundle_group, 'airline') >= 0
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    LoadScript site/bundle/airline.vim
endif

" lightline
if index(g:bundle_group, 'lightline') >= 0
    Plug 'itchyny/lightline.vim'
    LoadScript site/bundle/lightline.vim
endif

if index(g:bundle_group, 'coc') >= 0
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    LoadScript site/bundle/coc.vim
endif

if index(g:bundle_group, 'vim-doge') >= 0
    Plug 'kkoomen/vim-doge'
    LoadScript site/bundle/doge.vim
endif

" nerdtree: 文件树
if index(g:bundle_group, 'nerdtree') >= 0
    Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
    "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    LoadScript site/bundle/nerdtree.vim
endif

" grammer: LanguageTool 语法检查
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

" ale：动态语法检查
if index(g:bundle_group, 'ale') >= 0
    Plug 'w0rp/ale'
    LoadScript site/bundle/ale.vim
endif

if index(g:bundle_group, 'neomake') >= 0
    Plug 'neomake/neomake'
endif

if index(g:bundle_group, 'vista') >= 0
    Plug 'liuchengxu/vista.vim'
endif

if index(g:bundle_group, 'clap') >= 0
    Plug 'liuchengxu/vim-clap'
    LoadScript site/bundle/clap.vim
endif

if index(g:bundle_group, 'neoformat') >= 0
    Plug 'sbdchd/neoformat'
    LoadScript site/bundle/neoformat.vim
endif

if index(g:bundle_group, 'lsp') >= 0
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next' }
    LoadScript site/bundle/lcn.vim
endif

if index(g:bundle_group, 'floaterm') >= 0
    Plug 'voldikss/vim-floaterm'
endif

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
