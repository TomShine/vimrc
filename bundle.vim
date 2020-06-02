function! bundle#path(path)
    let path = expand(s:home . '/' . a:path )
    return substitute(path, '\\', '/', 'g')
endfunc

function! s:path(path)
    return bundle#path(a:path)
endfunc
