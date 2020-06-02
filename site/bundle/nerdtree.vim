"======================================================================
" nerdtree.vim - init NerdTree
"======================================================================

"----------------------------------------------------------------------
" ignores
"----------------------------------------------------------------------
let s:ignore = ['.obj', '.so', '.a', '~', '.tmp', '.egg', '.class', '.jar']
let s:ignore += ['.tar.gz', '.zip', '.7z', '.bz2', '.rar', '.jpg', '.png']
let s:ignore += ['.chm', '.docx', '.xlsx', '.pptx', '.pdf', '.dll', '.pyd']
let s:ignore += ['.xls', '.mobi', '.mp4', '.mp3']


"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
" 忽略文件
let NERDTreeIgnore = ['\.pyc$', '\~$', '\$.*$','\.swo$', '#.\{-\}#$','\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '.DS_Store']

for s:extname in s:ignore
    let NERDTreeIgnore += [escape(s:extname, '.~$')]
endfor

let NERDTreeRespectWildIgnore = 1
" let g:vinegar_nerdtree_as_netrw = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 0
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
let NERDTreeWinSize = 33       " 设置 NERDTree 子窗口宽度
let NERDTreeWinPos = "right"   " 设置 NERDTree 子窗口位置
let NERDTreeShowBookmarks = 1  " 显示书签列表
let NERDTreeChDirMode = 0
let NERDTreeMouseMode = 2
let NERDTreeShowHidden = 1      " 显示隐藏文件
let NERDTreeBookmarksFile = expand('$HOME') . '/.vim/NERDTreeBookmarks'
let NERDTreeMinimalUI = 1        " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer = 1 " 删除文件时自动删除文件对应 buffer
let NERDTreeShowLineNumbers = 1  " 显示行号
let NERDTreeAutoCenter=1

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

"----------------------------------------------------------------------
" keymaps
"----------------------------------------------------------------------

noremap <space>tn :NERDTree<cr>
noremap <space>to :NERDTreeFocus<cr>
noremap <space>tm :NERDTreeMirror<cr>
noremap <space>tt :NERDTreeToggle<cr>
