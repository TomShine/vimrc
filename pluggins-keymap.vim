" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" ListToggle
let g:lt_location_list_toggle_map = '<leader>lq'
let g:lt_quickfix_list_toggle_map = '<leader>oq'

" dash
nmap <space>h :Dash<cr>

" NERDTree
nmap <space>nt :NERDTreeToggle<cr>

" NerdCommenter
" <leader>cl 注释
" <leader>cu 解注释

" buffer
nnoremap <silent> [b :bprevious<cr>
nnoremap <silent> ]b :bnext<cr>
nnoremap <silent> [B :bfirst<cr>
nnoremap <silent> ]B :blast<cr>

" quickfix
nnoremap <silent> [q :cprevious<cr> " 跳到上一个错误
nnoremap <silent> ]q :cnext<cr>     " 跳到下一个错误
nnoremap <silent> [Q :cfirst<cr>
nnoremap <silent> ]Q :clast<cr>

" location
nnoremap <silent> [l :lprevious<cr>
nnoremap <silent> ]l :lnext<cr>
nnoremap <silent> [L :lfirst<cr>
nnoremap <silent> ]L :llast<cr>

" tabs
nnoremap <silent> [t :tabprevious<cr>
nnoremap <silent> ]t :tabnext<cr>
nnoremap <silent> [T :tabfirst<cr>
nnoremap <silent> ]T :tablast<cr>

" airline
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

" tags
nmap <leader>tn :tnext<CR>      " 正向遍历同名标签
nmap <leader>tp :tprevious<CR>  " 反向遍历同名标签

" gtags-cscope
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

" ale
nmap sp <Plug>(ale_previous_wrap) "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sn <Plug>(ale_next_wrap)

" quick-run
nmap <leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>

" indentGuide
nmap <silent> <leader>i :IndentGuidesToggle<cr> " 快捷键 i 开/关缩进可视化

" vim-choosewin {
nmap - <Plug>(choosewin)

" ycm
nnoremap gb :YcmCompleter GoToDeclaration<cr>
nnoremap gl :YcmCompleter GoToDefinition<cr>
nnoremap gx :YcmCompleter GoToDefinitionElseDeclaration<cr>
nnoremap gy :YcmCompleter GoToReferences<cr>

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" tabular
nnoremap <space>a= :Tabularize /=<CR>
vnoremap <space>a= :Tabularize /=<CR>
nnoremap <space>a/ :Tabularize /\/\//l2c1l0<CR>
vnoremap <space>a/ :Tabularize /\/\//l2c1l0<CR>
nnoremap <space>a, :Tabularize /,/l0r1<CR>
vnoremap <space>a, :Tabularize /,/l0r1<CR>
nnoremap <space>al :Tabularize /\|<cr>
vnoremap <space>al :Tabularize /\|<cr>
nnoremap <space>a<bar> :Tabularize /\|<cr>
vnoremap <space>a<bar> :Tabularize /\|<cr>
nnoremap <space>ar :Tabularize /\|/r0<cr>
vnoremap <space>ar :Tabularize /\|/r0<cr>

" leaderF
let g:Lf_CommandMap = {'<Tab>': ['<ESC>']}
let g:Lf_ShortcutF = '<space>ff'
let g:Lf_ShortcutB = '<space>fb'
noremap <space>fr :LeaderfMru<cr>
noremap <space>fn :LeaderfFunction!<cr>
noremap <space>ft :LeaderfTag<cr>

" cpp-mode 
nnoremap <leader>y :CopyCode<cr>
nnoremap <leader>p :PasteCode<cr>
nnoremap <leader>U :GoToFunImpl<cr>
nnoremap <silent> <leader>a :Switch<cr>
nnoremap <leader><leader>fp :FormatFunParam<cr>
nnoremap <leader><leader>if :FormatIf<cr>

" YCM
nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
" 已经使用cpp-mode插件提供的转到函数实现的功能
" nnoremap <leader>i :YcmCompleter GoToDefinition<cr> 
nnoremap <leader>o :YcmCompleter GoToInclude<cr>
nnoremap <leader>ff :YcmCompleter FixIt<cr>
nmap <F5> :YcmDiags<cr>

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

nnoremap <leader>yfcd :YcmForceCompileAndDiagnostics<CR>            " force recomile with syntastic
nnoremap <leader>lo :lopen<CR>                                      " open locationlist
nnoremap <leader>lc :lclose<CR>                                     " close locationlist
inoremap <leader><leader> <C-x><C-o>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>" 
nnoremap <leader>jr :YcmDiags<CR>
nnoremap <leader>jh :YcmCompleter GoToInclude<cr>
" nnoremap <leader>jd :YcmCompleter GoTo<cr>
nnoremap <leader>jl :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>jf :YcmCompleter GoToDefinition<cr>                " 只能是 #include或已打开的文件
nnoremap <leader>jx :YcmCompleter FixIt<cr>
nnoremap <leader>jp :YcmCompleter GetParent<cr>
nnoremap <leader>jt :YcmCompleter GetType<cr>
nnoremap <leader>jo :YcmCompleter GetDoc<cr>
    
" Tabularize
nmap <leader>a& :Tabularize /&<CR>
nmap <leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <leader>a=> :Tabularize /=><CR>
nmap <leader>a: :Tabularize /:<CR>
nmap <leader>a:: :Tabularize /:\zs<CR>
nmap <leader>a, :Tabularize /,<CR>
nmap <leader>a,, :Tabularize /,\zs<CR>
nmap <leader>a<Bar> :Tabularize /<Bar><CR>

" vim-easy-align
vmap <leader>ea <Plug>(EasyAlign)
nmap <leader>ea <Plug>(EasyAlign)
