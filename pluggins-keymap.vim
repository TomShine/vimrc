" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" ListToggle
let g:lt_location_list_toggle_map = '<leader>lq'
let g:lt_quickfix_list_toggle_map = '<leader>oq'

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

" indentGuide
nmap <silent> <leader>i :IndentGuidesToggle<cr> " 快捷键 i 开/关缩进可视化

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

" vim-easy-align
vmap <leader>ea <Plug>(EasyAlign)
nmap <leader>ea <Plug>(EasyAlign)

" leaderF
let g:Lf_CommandMap = {'<Tab>': ['<ESC>']}
let g:Lf_ShortcutF = '<space>ff'
let g:Lf_ShortcutB = '<space>fb'
noremap <space>fr :LeaderfMru<cr>
noremap <space>fn :LeaderfFunction!<cr>
noremap <space>ft :LeaderfTag<cr>
noremap <space>fbt :LeaderfBufTag!<cr>
noremap<space>fb :LeaderfBuffer<cr>

" ale
nmap sp <Plug>(ale_previous_wrap) "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sn <Plug>(ale_next_wrap)

" quick-run
nmap <leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>

" ycm
let g:ycm_key_invoke_completion = '<c-z>' " 默认的 <c-space> 和其他冲突,修改为这个
nnoremap <space>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <space>jr :YcmCompleter GoToReferences<cr>

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" clang format
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<CR>
nmap <leader>C :ClangFormatAutoToggle<CR> " Toggle auto formatting:

" FSwtich switch source file and header file in c/c++
nmap <silent> <Leader>of :FSHere<cr>        " Switch to the file and load it into the current window
nmap <silent> <Leader>ol :FSRight<cr>       " Switch to the file and load it into the window on the right
nmap <silent> <Leader>oL :FSSplitRight<cr>  " Switch to the file and load it into a new window split on the right
nmap <silent> <Leader>oh :FSLeft<cr>        " Switch to the file and load it into the window on the left
nmap <silent> <Leader>oH :FSSplitLeft<cr>   " Switch to the file and load it into a new window split on the left
nmap <silent> <Leader>ok :FSAbove<cr>       " Switch to the file and load it into the window above
nmap <silent> <Leader>oK :FSSplitAbove<cr>  " Switch to the file and load it into a new window split above
nmap <silent> <Leader>oj :FSBelow<cr>       " Switch to the file and load it into the window below
nmap <silent> <Leader>oJ :FSSplitBelow<cr>  " Switch to the file and load it into a new window split below

"UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
