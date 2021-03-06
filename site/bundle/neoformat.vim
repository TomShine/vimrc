
" let g:neoformat_python_autopep8 = {
"         \ 'exe': 'autopep8',
"         \ 'args': ['-s 4', '-E'],
"         \ 'replace': 1,
"         \ 'stdin': 0,
"         \ 'valid_exit_codes': [0, 23],
"         \ 'no_append': 1,
"         \ }

" Configure enabled formatters
let g:neoformat_enabled_python = ['blank', 'autopep8', 'yapf', 'docformatter']
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_run_all_formatters = 1
"
let g:neoformat_only_msg_on_error = 1

" augroup fmt
" autocmd!
" autocmd BufWritePre * undojoin | Neoformat
" augroup END
