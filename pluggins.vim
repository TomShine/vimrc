call plug#begin('$HOME/.vim/plugged')

" common
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'junegunn/vim-easy-align'
Plug 'thinca/vim-quickrun'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'justinmk/vim-dirvish'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ide feature
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.sh --clang-completer --gocode-completer --system-libclang
    endif
endfunction

Plug 'Valloric/ListToggle'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-unimpaired'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') , 'for': [ 'go', 'python' , 'c' , 'cpp'], 'on': [] }

"tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" lang
Plug 'elzr/vim-json'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'uarun/vim-protobuf'
Plug 'fatih/vim-go'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'derekwyatt/vim-fswitch'
Plug 'vim-scripts/indentpython.vim'

" tools
Plug 'rking/ag.vim'
Plug 'wakatime/vim-wakatime'
Plug 'editorconfig/editorconfig-vim'
Plug 't9md/vim-choosewin'

" theme
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

if has("gui_running")
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
endif

if has('mac')
    Plug 'rizzatti/dash.vim'
endif

call plug#end()
