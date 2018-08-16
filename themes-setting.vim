set t_Co=256
syntax enable

if has('unix')
    let g:molokai_original = 1
    colorscheme molokai
elseif has('mac')
    colorscheme gruvbox 
endif
