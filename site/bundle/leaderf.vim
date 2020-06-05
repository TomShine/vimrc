"======================================================================
" init_leaderf.vim -
"======================================================================


"----------------------------------------------------------------------
" LeaderF
"----------------------------------------------------------------------

" ui 定制
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
" 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
let g:Lf_CacheDirectory = expand('~/.vim/cache')
" 显示绝对路径
let g:Lf_ShowRelativePath = 1
" 隐藏帮助
let g:Lf_HideHelp = 1
let g:Lf_NoChdir = 1
" 模糊匹配忽略扩展名
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \ }
" MRU 文件忽略扩展名
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
" 最大历史文件保存 2048 个
let g:Lf_MruMaxFiles = 2048
let g:Lf_StlColorscheme = 'powerline'
" 禁用 function/buftag 的预览功能，可以手动用 p 预览
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
" 使用 ESC 键可以直接退出 leaderf 的 normal 模式
let g:Lf_NormalMap = {
        \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
        \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
        \ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
        \ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
        \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
        \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
        \ }

"Ripgrep 配置
let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--type-add web:*.{html,css,js}*",
        \ "--glob=!git/*",
        \ "--hidden"
    \ ]

if (exists('*popup_create') && has('patch-8.1.2000')) || has('nvim-0.4')
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    " disable Show icons, icons are shown by default
    let g:Lf_ShowDevIcons = 0
endif

" let g:Lf_WindowPosition='bottom'

"----------------------------------------------------------------------
" source task
"----------------------------------------------------------------------

function! s:lf_task_source(...)
    let rows = asynctasks#source(&columns * 48 / 100)
    let source = []
    for row in rows
        let name = row[0]
        let source += [name . '  ' . row[1] . '  : ' . row[2]]
    endfor
    return source
endfunc


function! s:lf_task_accept(line, arg)
    let pos = stridx(a:line, '<')
    if pos < 0
        return
    endif
    let name = strpart(a:line, 0, pos)
    let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
    redraw
    if name != ''
        exec "AsyncTask " . name
    endif
endfunc

function! s:lf_task_digest(line, mode)
    let pos = stridx(a:line, '<')
    if pos < 0
        return [a:line, 0]
    endif
    let name = strpart(a:line, 0, pos)
    return [name, 0]
endfunc

function! s:lf_win_init(...)
    setlocal nonumber
    setlocal nowrap
endfunc


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
            \ 'source': string(function('s:lf_task_source'))[10:-3],
            \ 'accept': string(function('s:lf_task_accept'))[10:-3],
            \ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
            \ 'highlights_def': {
            \     'Lf_hl_funcScope': '^\S\+',
            \     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
            \ },
            \ 'after_enter': string(function('s:lf_win_init'))[10:-3],
        \ }

" echo s:lf_task_source()

"----------------------------------------------------------------------
" keymap
"----------------------------------------------------------------------

let g:Lf_CommandMap = {'<Tab>': ['<ESC>']}

" 打开文件模糊匹配
let g:Lf_ShortcutF = '<leader>ff'
" let g:Lf_ShortcutF = '<c-p>'
" 打开 buffer 模糊匹配
"let g:Lf_ShortcutB = '<leader>fb'
" let g:Lf_ShortcutB = '<m-n>'

" 打开最近使用的文件 MRU，进行模糊匹配
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>fP :LeaderfBufTag!<cr>
" 打开 buffer 列表进行模糊匹配
noremap <leader>fb :LeaderfBuffer<cr>
" 全局 tags 模糊匹配
"noremap <m-m> :LeaderfTag<cr>
noremap <leader>ft :LeaderfTag<cr>
" 打开函数列表，按 i 进入模糊匹配，ESC 退出
"noremap <Leader>ff :LeaderfFunction<cr>
noremap <leader>fF :LeaderfFunction!<cr>
"
noremap <Leader>fl :LeaderfLine<cr>

" gtags
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

" rg
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search word under cursor, the pattern is treated as regex,
" append the result to previous search results.
noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
" search word under cursor literally only in current buffer
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
" search word under cursor literally in all listed buffers
noremap <C-D> :<C-U><C-R>=printf("Leaderf! rg -F --all-buffers -e %s ", expand("<cword>"))<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
" recall last search. If the result window is closed, reopen it.
noremap go :<C-U>Leaderf! rg --recall<CR>
" search word under cursor in *.h and *.cpp files.
noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cpp", expand("<cword>"))<CR>
" the same as above
noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{h,cpp}", expand("<cword>"))<CR>
" search word under cursor in cpp and java files.
noremap <Leader>b :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -t java", expand("<cword>"))<CR>
" search word under cursor in cpp files, exclude the *.hpp files
noremap <Leader>c :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -g !*.hpp", expand("<cword>"))<CR>

noremap <c-n> :cclose<cr>:Leaderf --nowrap mru --regexMode<cr>
noremap <m-p> :cclose<cr>:Leaderf! --nowrap function<cr>
noremap <m-P> :cclose<cr>:Leaderf! --nowrap buftag<cr>
noremap <m-n> :cclose<cr>:Leaderf! --nowrap buffer<cr>
noremap <m-m> :cclose<cr>:Leaderf --nowrap tag<cr>
noremap <m-g> :Leaderf --nowrap task<cr>
inoremap <m-g> <esc>:Leaderf --nowrap task<cr>

if has('gui_running')
    noremap <c-f12> :Leaderf --nowrap task<cr>
    inoremap <c-f12> <esc>:Leaderf --nowrap task<cr>
endif
