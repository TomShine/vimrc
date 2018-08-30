" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" ListToggle
let g:lt_location_list_toggle_map = '<leader>lq'
let g:lt_quickfix_list_toggle_map = '<leader>oq'

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

" tags
nmap <leader>tn :tnext<CR>      " 正向遍历同名标签
nmap <leader>tp :tprevious<CR>  " 反向遍历同名标签

" indentGuide
nmap <silent> <leader>i :IndentGuidesToggle<cr> " 快捷键 i 开/关缩进可视化

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
