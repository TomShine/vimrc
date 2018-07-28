set t_Co=256
syntax enable
<<<<<<< HEAD
"set background=dark "背景使用黑色 

if has('unix')
    let g:molokai_original = 1
    colorscheme molokai
elseif has('mac')
    colorscheme gruvbox 
=======

if has('linux')
    colorscheme molokai
    let g:molokai_original = 1
elseif has('mac')
   colorscheme gruvbox 
>>>>>>> update config
endif
