"======================================================================
"
" init-keymaps.vim - 按键设置
"
"    - 快速移动
"    - 标签切换
"    - 窗口切换
"    - 终端支持
"    - 编译运行
"    - 符号搜索
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>

"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" Tab 快捷键
"----------------------------------------------------------------------

" <leader>+数字键 切换 tab
noremap <silent><leader>1 1gt<cr>
noremap <silent><leader>2 2gt<cr>
noremap <silent><leader>3 3gt<cr>
noremap <silent><leader>4 4gt<cr>
noremap <silent><leader>5 5gt<cr>
noremap <silent><leader>6 6gt<cr>
noremap <silent><leader>7 7gt<cr>
noremap <silent><leader>8 8gt<cr>
noremap <silent><leader>9 9gt<cr>
noremap <silent><leader>0 10gt<cr>

" ALT+N 切换 tab
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>


" MacVim 允许 CMD+数字键快速切换标签
if has("gui_macvim")
    set macmeta
    noremap <silent><d-1> :tabn 1<cr>
    noremap <silent><d-2> :tabn 2<cr>
    noremap <silent><d-3> :tabn 3<cr>
    noremap <silent><d-4> :tabn 4<cr>
    noremap <silent><d-5> :tabn 5<cr>
    noremap <silent><d-6> :tabn 6<cr>
    noremap <silent><d-7> :tabn 7<cr>
    noremap <silent><d-8> :tabn 8<cr>
    noremap <silent><d-9> :tabn 9<cr>
    noremap <silent><d-0> :tabn 10<cr>
    inoremap <silent><d-1> <ESC>:tabn 1<cr>
    inoremap <silent><d-2> <ESC>:tabn 2<cr>
    inoremap <silent><d-3> <ESC>:tabn 3<cr>
    inoremap <silent><d-4> <ESC>:tabn 4<cr>
    inoremap <silent><d-5> <ESC>:tabn 5<cr>
    inoremap <silent><d-6> <ESC>:tabn 6<cr>
    inoremap <silent><d-7> <ESC>:tabn 7<cr>
    inoremap <silent><d-8> <ESC>:tabn 8<cr>
    inoremap <silent><d-9> <ESC>:tabn 9<cr>
    inoremap <silent><d-0> <ESC>:tabn 10<cr>
endif

" TAB：创建，关闭，上一个，下一个，左移，右移
" 其实还可以用原生的 CTRL+PageUp, CTRL+PageDown 来切换标签
noremap <silent> <leader>tc :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>

" 左移 tab
function! Tab_MoveLeft()
    let l:tabnr = tabpagenr() - 2
    if l:tabnr >= 0
        exec 'tabmove '.l:tabnr
    endif
endfunc

" 右移 tab
function! Tab_MoveRight()
    let l:tabnr = tabpagenr() + 1
    if l:tabnr <= tabpagenr('$')
        exec 'tabmove '.l:tabnr
    endif
endfunc

noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
noremap <silent><leader>tr :call Tab_MoveRight()<cr>
noremap <silent><m-left> :call Tab_MoveLeft()<cr>
noremap <silent><m-right> :call Tab_MoveRight()<cr>

nnoremap <silent> [t :tabprevious<cr>
nnoremap <silent> ]t :tabnext<cr>
nnoremap <silent> [T :tabfirst<cr>
nnoremap <silent> ]T :tablast<cr>

" Tabularize
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


"----------------------------------------------------------------------
" Window 窗口切换：ALT+SHIFT+hjkl
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------
noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc><c-w>h
inoremap <m-L> <esc><c-w>l
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
    " vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
    " 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
    " 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
    set termwinkey=<c-_>
    tnoremap <m-H> <c-_>h
    tnoremap <m-L> <c-_>l
    tnoremap <m-J> <c-_>j
    tnoremap <m-K> <c-_>k
    tnoremap <m-q> <c-\><c-n>
elseif has('nvim')
    " neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
    tnoremap <m-H> <c-\><c-n><c-w>h
    tnoremap <m-L> <c-\><c-n><c-w>l
    tnoremap <m-J> <c-\><c-n><c-w>j
    tnoremap <m-K> <c-\><c-n><c-w>k
    tnoremap <m-q> <c-\><c-n>
endif


"----------------------------------------------------------------------
" 文件
"----------------------------------------------------------------------

" 使用 <spapce>fs 在插入和normal模式下保存文件，我经常在 insert 模式下代替 Esc
inoremap <leader>fs <Esc>:w<cr>
noremap <leader>fs :w<cr>
inoremap <leader>fq <Esc>:q<cr>
noremap <leader>fq :q<cr>

" Plugin: NERDTree
nmap <leader>nt :NERDTreeToggle<cr>

" Plugin: Tagbar
nmap <leader>tb :TagbarToggle<cr>

" Plugin: leaderf
" 打开文件模糊匹配
let g:Lf_ShortcutF = '<leader>ff'
" 打开最近使用的文件 MRU，进行模糊匹配
noremap <leader>fr :LeaderfMru<cr>
noremap <leader>fP :LeaderfBufTag!<cr>
" 打开 buffer 模糊匹配
let g:Lf_ShortcutB = '<leader>fb'
" 打开 buffer 列表进行模糊匹配
noremap <leader>fb :LeaderfBuffer<cr>
" 全局 tags 模糊匹配
noremap <m-m> :LeaderfTag<cr>
noremap <leader>ft :LeaderfTag<cr>
" 打开函数列表，按 i 进入模糊匹配，ESC 退出
noremap <leader>fF :LeaderfFunction!<cr>

noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


"----------------------------------------------------------------------
" Tags:  ctags 和 gtags
"----------------------------------------------------------------------

nmap <leader>tn :tnext<CR>      " 正向遍历同名标签
nmap <leader>tp :tprevious<CR>  " 反向遍历同名标签

" Plugin: gtags-cscope
noremap <silent> <leader>tcs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>tcg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>tcc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>tct :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>tce :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>tcf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>tci :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>tcd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>tca :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>tck :GscopeKill<cr>


"----------------------------------------------------------------------
" Buffers
"----------------------------------------------------------------------

nnoremap <silent> <leader>bb :buffers<cr>
nnoremap <silent> <leader>bp :bprevious<cr>
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bf :bfirst<cr>
nnoremap <silent> <leader>bl :blast<cr>


"----------------------------------------------------------------------
" Quickfix 和 Location
"----------------------------------------------------------------------

nnoremap <silent> <leader>cp :cprevious<cr> " 跳到上一个错误
nnoremap <silent> <leader>cn :cnext<cr>     " 跳到下一个错误
nnoremap <silent> <leader>cf :cfirst<cr>
nnoremap <silent> <leader>cl :clast<cr>

" Plugin: Valloric/ListToggle
let g:lt_quickfix_list_toggle_map = '<leader>qt'

" Plugin: mh21/errormarker.vim
" 清除 errormarker 标注的错误
noremap <silent><leader>ha :RemoveErrorMarkers<cr>

nnoremap <silent> <leader>lp :lprevious<cr>
nnoremap <silent> <leader>ln :lnext<cr>
nnoremap <silent> <leader>lf :lfirst<cr>
nnoremap <silent> <leader>ll :llast<cr>

" Plugin: Valloric/ListToggle
let g:lt_location_list_toggle_map = '<leader>lt'


"----------------------------------------------------------------------
" 会话: Session
"----------------------------------------------------------------------

" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,flolds,help,options,resize,winpos,winsize"

" 保存快捷键
"map ;ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map ;ss :mksession! my.vim<cr>

" 恢复快捷键
map ;rs :source my.vim<cr> :rviminfo my.viminfo<cr>
map ;rs :source my.vim<cr>


"----------------------------------------------------------------------
" 搜索
"----------------------------------------------------------------------

" F2 在项目目录下 Grep 光标下单词，默认 C/C++/Py/Js ，扩展名自己扩充
" 支持 rg/grep/findstr ，其他类型可以自己扩充
" 不是在当前目录 grep，而是会去到当前文件所属的项目目录 project root
" 下面进行 grep，这样能方便的对相关项目进行搜索
if executable('rg')
    noremap <silent><leader>sf :AsyncRun! -cwd=<root> rg -n --no-heading
                \ --color never -g *.h -g *.c* -g *.py -g *.js -g *.vim
                \ <C-R><C-W> "<root>" <cr>
elseif has('win32') || has('win64')
    noremap <silent><F2> :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>"
                \ "\%CD\%\*.h" "\%CD\%\*.c*" "\%CD\%\*.py" "\%CD\%\*.js"
                \ "\%CD\%\*.vim"
                \ <cr>
else
    noremap <silent><F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W>
                \ --include='*.h' --include='*.c*' --include='*.py'
                \ --include='*.js' --include='*.vim'
                \ '<root>' <cr>
endif


"----------------------------------------------------------------------
" 复制和粘贴
"----------------------------------------------------------------------
"
" Paste mode avoids auto-indent
" set pastetoggle=<leader>p

" Toggle paste mode on and off:
map ;lp :setlocal paste!<cr>

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y

" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <leader>p "+p

" 复制至公共剪贴板
vmap ;gc "+y

" 复制所有至公共剪贴板
nmap ;ga <ESC>ggVG"+y<ESC>

" 从公共剪贴板粘贴
imap ;gp <ESC>"+p
nmap ;gp "+p
vmap ;gp "+p


"----------------------------------------------------------------------
" 补全
"----------------------------------------------------------------------

" Plugin: SuperTab
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

" Plugin: YCM
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<cr>

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"


"----------------------------------------------------------------------
" ALT 键移动增强
"----------------------------------------------------------------------

" Plugin: terryma/vim-expand-region
" 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
map <m-=> <Plug>(expand_region_expand)
map <m--> <Plug>(expand_region_shrink)

" ALT+h/l 快速左右按单词移动（正常模式+插入模式）
noremap <m-h> b
noremap <m-l> w
inoremap <m-h> <c-left>
inoremap <m-l> <c-right>

" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转）
noremap <m-j> gj
noremap <m-k> gk
inoremap <m-j> <c-\><c-o>gj
inoremap <m-k> <c-\><c-o>gk

" 命令模式下的相同快捷
cnoremap <m-h> <c-left>
cnoremap <m-l> <c-right>

" ALT+y 删除到行末
noremap <m-y> d$
inoremap <m-y> <c-\><c-o>d$


"----------------------------------------------------------------------
" 编程语言
"----------------------------------------------------------------------

" Plugin: AsyncTask
noremap <silent><F5> :AsyncTask file-run<cr>
noremap <silent><F6> :AsyncTask make<cr>
noremap <silent><F9> :AsyncTask file-build<cr>
noremap <silent><F10> :call asyncrun#quickfix_toggle(6)<cr>
inoremap <silent><F5> <ESC>:AsyncTask file-run<cr>
inoremap <silent><F9> <ESC>:AsyncTask file-build<cr>

" Plugin: NerdComment 注释
map ;cc <plug>NERDCommenterComment
map ;cu <plug>NERDCommenterUncomment

" 语法检查
" Plugin: rhysd/vim-grammarous
"noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
"map <space>rr <Plug>(grammarous-open-info-window)
"map <space>rv <Plug>(grammarous-move-to-info-window)
"map <space>rs <Plug>(grammarous-reset)
"map <space>rx <Plug>(grammarous-close-info-window)
"map <space>rm <Plug>(grammarous-remove-error)
"map <space>rd <Plug>(grammarous-disable-rule)
"map <space>rn <Plug>(grammarous-move-to-next-error)
"map <space>rp <Plug>(grammarous-move-to-previous-error)

" Plugin: 'w0rp/ale'
" 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
" Plugin: 'asins/vim-dict'

" Plugin: IndentGuiles
nmap <silent> <leader>gi :IndentGuidesToggle<cr> " 快捷键 i 开/关缩进可视化

" Plugin: vim-go
" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" Python
" TODO...


"----------------------------------------------------------------------
" 其他配置
"----------------------------------------------------------------------

" Plugin 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 常规模式下输入 cS 清除行尾空格
nmap ;cS :%s/\s\+$//g<CR>:noh<CR>
" 常规模式下输入 cM 清除行尾 ^M 符号
nmap ;cM :%s/\r$//g<CR>:noh<CR>

" 十六进制格式查看
nmap ;16 <ESC>:%!xxd<ESC>
" 返回普通格式
nmap ;r16 <ESC>:%!xxd -r<ESC>

" 一键去除所有尾部空白[全模式可用]
imap ;rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap ;rb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap ;rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" 一键去除字符[全模式可用]
imap ;rm <ESC>:%s/<c-v><c-m>//g<CR>
nmap ;rm :%s/<c-v><c-m>//g<CR>
vmap ;rm <ESC>:%s/<c-v><c-m>//g<CR>

" 一键替换全部Tab为空格[全模式可用]
func! RemoveTabs()
    if &shiftwidth == 2
        exec "%s/   /  /g"
    elseif &shiftwidth == 4
        exec "%s/   /    /g"
    elseif &shiftwidth == 6
        exec "%s/   /      /g"
    elseif &shiftwidth == 8
        exec "%s/   /        /g"
    else
        exec "%s/   / /g"
    end
endfunc

imap ;rt <ESC>:call RemoveTabs()<CR>
nmap ;rt :call RemoveTabs()<CR>
vmap ;rt <ESC>:call RemoveTabs()<CR>

" 一键生成与当前编辑文件同名的HTML文件 [不输出行号]
imap ;th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>
nmap ;th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>
vmap ;th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

" 不确认、非整词
nnoremap <leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" <c-l>通常用来清除并重绘屏幕，这个映射增加了关闭查找高亮的功能
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Fast reloading of the init.vim (快速加载 init.vim 文件)
map  ;rc :source $HOME/.vimrc<cr>
imap ;rc :source $HOME/.vimrc<cr>
nmap ;rc :source $HOME/.vimrc<cr>

" Fast editing init.vim (快速编辑 init.vim 文件)
map ;ec :e $HOME/.vimrc<cr>
imap ;ec :e $HOME/.vimrc<cr>
nmap ;ec :e $HOME/.vimrc<cr>
