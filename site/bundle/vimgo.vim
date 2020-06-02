
augroup go
    autocmd!
    " :GoAlternate  commands :A, :AV, :AS and :AT
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

" auto save run GoImports
autocmd BufWritePre *.go :GoImports

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

let g:go_autodetect_gopath = 0
let g:go_imports_autosave = 0
let g:go_def_mapping_enabled = 0
let g:go_list_type = "quickfix"

let g:go_fmt_command = "goreturns"
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 0

let g:go_build_tags = '-v'
let g:go_bin_path = "/usr/local/go/bin"
let g:go_info_mode = 'gopls'

let g:go_test_show_name = 0
let g:go_test_timeout= '10s'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" keymaps
" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

