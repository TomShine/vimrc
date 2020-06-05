"----------------------------------------------------------------------
" netrw
"----------------------------------------------------------------------

let g:netrw_liststyle = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = '\.swp\($\|\t\),\.py[co]\($\|\t\),\.o\($\|\t\),\.bak\($\|\t\),\(^\|\s\s\)\zs\.\S\+'
let g:netrw_sort_sequence = '[\/]$,*,\.bak$,\.o$,\.info$,\.swp$,\.obj$'
let g:netrw_preview = 0
"let g:netrw_special_syntax = 1
let g:netrw_sort_options = 'i'

if isdirectory(expand('~/.vim'))
    let g:netrw_home = expand('~/.vim')
endif

"let g:netrw_timefmt = "%Y-%m-%d %H:%M:%S"

"let g:netrw_banner=0
"let g:netrw_browse_split=4   " open in prior window
"let g:netrw_altv=1           " open splits to the right
"let g:netrw_liststyle=3      " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()

let s:ignore = ['.obj', '.so', '.a', '~', '.tmp', '.egg', '.class', '.jar']
let s:ignore += ['.tar.gz', '.zip', '.7z', '.bz2', '.rar', '.jpg', '.png']
let s:ignore += ['.chm', '.docx', '.xlsx', '.pptx', '.pdf', '.dll', '.pyd']
let s:ignore += ['.xls', '.mobi', '.mp4', '.mp3']

for s:extname in s:ignore
    let s:pattern = escape(s:extname, '.~') . '\($\|\t\),'
    " let g:netrw_list_hide = s:pattern . g:netrw_list_hide
endfor

let s:pattern = '#.\{-\}#\($\|\t\),'
if has('win32') || has('win16') || has('win95') || has('win64')
    let s:pattern .= '\$.\{-\}\($\|\t\),'
endif

" let g:netrw_list_hide = s:pattern . g:netrw_list_hide

" fixed netrw underline bug in vim 7.3 and below
if v:version < 704
    "set nocursorline
    "au FileType netrw hi CursorLine gui=underline
    "au FileType netrw au BufEnter <buffer> hi CursorLine gui=underline
    "au FileType netrw au BufLeave <buffer> hi clear CursorLine
    autocmd BufEnter * if &buftype == '' | :set nocursorline | endif
endif

let g:ft_man_open_mode = 'vert'
