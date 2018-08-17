call plug#begin('$HOME/.vim/plugged')

" common
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'Valloric/ListToggle'
Plug 'scrooloose/nerdtree'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'wakatime/vim-wakatime'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Shougo/echodoc.vim'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'tpope/vim-unimpaired'
Plug 't9md/vim-choosewin'
Plug 'rizzatti/dash.vim'
Plug 'nathanaelkane/vim-indent-guides'

" beauty
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" python


" C/C++
Plug 'octol/vim-cpp-enhanced-highlight'

" go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

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

call plug#end()
