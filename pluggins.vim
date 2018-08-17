call plug#begin('$HOME/.vim/plugged')

" common
Plug 'w0rp/ale'
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'Valloric/ListToggle'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
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
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular' 
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

if has("mac")
    function! BuildYCM(info)
        if a:info.status == 'installed' || a:info.force
            !./install.sh --clang-completer --gocode-completer --tern-completer
        endif
    endfunction

    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    Plug 'rizzatti/dash.vim'
elseif has("unix")
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" beauty
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" python
Plug 'klen/python-mode', { 'branch': 'develop' }

" C/C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'chxuan/cpp-mode'

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
