"======================================================================
" ycm.vim - init YouCompleteMe
"======================================================================

"-----------------------------------------------------
" YouCompleteMe
"-----------------------------------------------------

let g:ycm_server_python_interpreter='python3'
let g:ycm_global_ycm_extra_conf='~/.ShangVim/tools/conf/ycm_extra_conf.py'

" Youcompleteme的默认tab,s-tab 和自动补全冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

" 禁用诊断功能：我们用前面更好用的 ALE 代替
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_confirm_extra_conf=0                    " 关闭加载.ycm_extra_conf.py提示
let g:ycm_cache_omnifunc=0                        " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1          " 语法关键字补全let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_disable_signature_help = 1
" 两个字符自动触发语义补全
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_goto_buffer_command = 'new-or-existing-tab'

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" noremap <c-z> <NOP>

" 修改弹框为灰色
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black


" 禁用预览功能：扰乱视听
"set completeopt=menu,menuone
"let g:ycm_add_preview_to_completeopt = 1
set completeopt=menu,menuone

if has('patch-8.0.1000')
    set completeopt=menu,menuone,noselect
endif


"----------------------------------------------------------------------
" Ycm White List
" Ycm 白名单（非名单内文件不启用 YCM），避免打开个 1MB 的 txt 分析半天
"----------------------------------------------------------------------
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "objcpp":1,
            \ "python":1,
            \ "java":1,
            \ "javascript":1,
            \ "coffee":1,
            \ "vim":1,
            \ "go":1,
            \ "cs":1,
            \ "lua":1,
            \ "perl":1,
            \ "perl6":1,
            \ "php":1,
            \ "ruby":1,
            \ "rust":1,
            \ "erlang":1,
            \ "asm":1,
            \ "nasm":1,
            \ "masm":1,
            \ "tasm":1,
            \ "asm68k":1,
            \ "asmh8300":1,
            \ "asciidoc":1,
            \ "basic":1,
            \ "vb":1,
            \ "make":1,
            \ "cmake":1,
            \ "html":1,
            \ "css":1,
            \ "less":1,
            \ "json":1,
            \ "cson":1,
            \ "typedscript":1,
            \ "haskell":1,
            \ "lhaskell":1,
            \ "lisp":1,
            \ "scheme":1,
            \ "sdl":1,
            \ "sh":1,
            \ "zsh":1,
            \ "bash":1,
            \ "man":1,
            \ "markdown":1,
            \ "matlab":1,
            \ "maxima":1,
            \ "dosini":1,
            \ "conf":1,
            \ "config":1,
            \ "zimbu":1,
            \ "ps1":1,
            \ }


"----------------------------------------------------------------------
" keymaps
"----------------------------------------------------------------------

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<cr>


