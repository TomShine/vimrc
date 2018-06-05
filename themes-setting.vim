set t_Co=256
syntax enable

if has('linux')
    colorscheme molokai
    let g:molokai_original = 1
elseif has('mac')
   colorscheme gruvbox 
endif
