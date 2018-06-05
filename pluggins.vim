call plug#begin('$HOME/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'Valloric/ListToggle'
Plug 'scrooloose/nerdtree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'kien/rainbow_parentheses.vim'
Plug 'wakatime/vim-wakatime'
Plug 'editorconfig/editorconfig-vim'
Plug 'thinca/vim-quickrun'
Plug 'lfv89/vim-interestingwords'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'w0rp/ale'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mhinz/vim-signify'
Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/echodoc.vim'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'justinmk/vim-dirvish'
Plug 'skywind3000/vim-preview'
Plug 'tpope/vim-unimpaired'
Plug 't9md/vim-choosewin'
Plug 'rizzatti/dash.vim'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'

" complete
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets' 

if has('mac')
    function! BuildYCM(info)
        if a:info.status == 'installed' || a:info.force
            !./install.sh --clang-completer --gocode-completer --system-libclang
        endif
    endfunction

    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') , 'for': [ 'go', 'python' ], 'on': [] }
endif

" 文本对象: textobj-user 全家桶
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

" theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'Gabirel/molokai'
Plug 'arcticicestudio/nord-vim'
Plug 'SpaceVim/FlatColor'
Plug 'chriskempson/tomorrow-theme'
Plug 'icymind/NeoSolarized'

call plug#end()
