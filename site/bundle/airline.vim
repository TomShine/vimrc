"======================================================================
" airline.vim -
"======================================================================

if g:isMac
    set rtp+="/Users/tomshine/Library/Python/3.7/lib/python/site-packages/powerline/bindings/vim"
elseif g:isLinux
elseif g:isFreeBSD
endif

"----------------------------------------------------------------------
" basic setup
"----------------------------------------------------------------------

"这个是安装字体后 必须设置此项
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_exclude_preview = 1
let g:airline_section_b = '%n'
let g:airline_theme='deus'
" let g:airline_theme="badwolf"
" let g:airline_theme="luna"
" let g:airline_theme="molokai"
" let g:airline_theme="solarized"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" let g:airline_symbols.space = "\ua0"
" For patched power-line fonts
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#vimagit#enabled = 0

" Buffer
"     " 打开tabline功能,方便查看Buffer和切换
"     let g:airline#extensions#tabline#enabled = 1
"     let g:airline#extensions#tabline#show_splits = 1
"     let g:airline#extensions#tabline#show_tabs = 0
"     let g:airline#extensions#tabline#show_buffers = 0
"     let g:airline#extensions#tabline#show_tab_type = 0
"     let g:airline#extensions#tabline#buffer_nr_show = 1
"     let g:airline#extensions#tabline#fnamemod = ':t'

"     let g:airline#extensions#tabline#buffer_idx_mode = 1
"     nmap <leader>1 <Plug>AirlineSelectTab1
"     nmap <leader>2 <Plug>AirlineSelectTab2
"     nmap <leader>3 <Plug>AirlineSelectTab3
"     nmap <leader>4 <Plug>AirlineSelectTab4
"     nmap <leader>5 <Plug>AirlineSelectTab5
"     nmap <leader>6 <Plug>AirlineSelectTab6
"     nmap <leader>7 <Plug>AirlineSelectTab7
"     nmap <leader>8 <Plug>AirlineSelectTab8
"     nmap <leader>9 <Plug>AirlineSelectTab9
"     nmap <leader>- <Plug>AirlineSelectPrevTab
"     nmap <leader>+ <Plug>AirlineSelectNextTab


"----------------------------------------------------------------------
" airline setup me
"----------------------------------------------------------------------

function AirlineSetupMe(font)
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_powerline_fonts = 0
    let g:airline_exclude_preview = 1
    let g:airline_section_b = '%n'
    if a:font
        let g:airline_left_sep = "\ue0b0"
        let g:airline_left_alt_sep = "\ue0b1"
        let g:airline_right_sep = "\ue0b2"
        let g:airline_right_alt_sep = "\ue0b3"
        let g:airline_powerline_fonts = 1
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
        let g:airline_symbols.branch = "\ue0a0"
        let g:airline_symbols.readonly = "\ue0a2"
        let g:airline_symbols.linenr = "\u2630"
        let g:airline_symbols.maxlinenr = "\ue0a1"
        if has('win32') || has('win95') || has('win64') || has('win16')
            if has('gui_running') && &rop =~ 'directx'
                let g:airline_symbols.linenr = ''
                let g:airline_symbols.maxlinenr = ''
            endif
        endif
    endif
    let g:airline#extensions#branch#enabled = 0
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#fugitiveline#enabled = 0
    let g:airline#extensions#csv#enabled = 0
    let g:airline#extensions#vimagit#enabled = 0
endfunc


