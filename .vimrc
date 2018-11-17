" Function to source only if file exists
function! SourceIfExists(file)
    if filereadable(expand(a:file))
        exe 'source' a:file
    endif
endfunction

call SourceIfExists('~/.vim/general.vim')
call SourceIfExists('~/.vim/helpers.vim')
call SourceIfExists('~/.vim/pluggins-setting.vim')
call SourceIfExists('~/.vim/pluggins.vim')
call SourceIfExists('~/.vim/themes-setting.vim')
call SourceIfExists('~/.vim/general-keymap.vim')
call SourceIfExists('~/.vim/pluggins-keymap.vim')

hi! Normal ctermbg=NONE guibg=NONE

