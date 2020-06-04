#!/usr/bin/env bash

# Init option {{{
Color_off='\033[0m' # Text Reset

# terminal color template {{{
# Regular Colors
Black='\033[0;30m'  # Black
Red='\033[0;31m'    # Red
Green='\033[0;32m'  # Green
Yellow='\033[0;33m' # Yellow
Blue='\033[0;34m'   # Blue
Purple='\033[0;35m' # Purple
Cyan='\033[0;36m'   # Cyan
White='\033[0;37m'  # White

# Bold
BBlack='\033[1;30m'  # Black
BRed='\033[1;31m'    # Red
BGreen='\033[1;32m'  # Green
BYellow='\033[1;33m' # Yellow
BBlue='\033[1;34m'   # Blue
BPurple='\033[1;35m' # Purple
BCyan='\033[1;36m'   # Cyan
BWhite='\033[1;37m'  # White

# Underline
UBlack='\033[4;30m'  # Black
URed='\033[4;31m'    # Red
UGreen='\033[4;32m'  # Green
UYellow='\033[4;33m' # Yellow
UBlue='\033[4;34m'   # Blue
UPurple='\033[4;35m' # Purple
UCyan='\033[4;36m'   # Cyan
UWhite='\033[4;37m'  # White

# Background
On_Black='\033[40m'  # Black
On_Red='\033[41m'    # Red
On_Green='\033[42m'  # Green
On_Yellow='\033[43m' # Yellow
On_Blue='\033[44m'   # Blue
On_Purple='\033[45m' # Purple
On_Cyan='\033[46m'   # Cyan
On_White='\033[47m'  # White

# High Intensity
IBlack='\033[0;90m'  # Black
IRed='\033[0;91m'    # Red
IGreen='\033[0;92m'  # Green
IYellow='\033[0;93m' # Yellow
IBlue='\033[0;94m'   # Blue
IPurple='\033[0;95m' # Purple
ICyan='\033[0;96m'   # Cyan
IWhite='\033[0;97m'  # White

# Bold High Intensity
BIBlack='\033[1;90m'  # Black
BIRed='\033[1;91m'    # Red
BIGreen='\033[1;92m'  # Green
BIYellow='\033[1;93m' # Yellow
BIBlue='\033[1;94m'   # Blue
BIPurple='\033[1;95m' # Purple
BICyan='\033[1;96m'   # Cyan
BIWhite='\033[1;97m'  # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'  # Black
On_IRed='\033[0;101m'    # Red
On_IGreen='\033[0;102m'  # Green
On_IYellow='\033[0;103m' # Yellow
On_IBlue='\033[0;104m'   # Blue
On_IPurple='\033[0;105m' # Purple
On_ICyan='\033[0;106m'   # Cyan
On_IWhite='\033[0;107m'  # White
# }}}

#System name
System="$(uname -s)"

# }}}

# need_cmd {{{
need_cmd() {
    if ! hash "$1" &>/dev/null; then
        error "Need '$1' (command not found)"
        exit 1
    fi
}
# }}}

# success/info/error/warn {{{
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "${Green}[✔]${Color_off} ${1}${2}"
}

info() {
    msg "${Blue}[➭]${Color_off} ${1}${2}"
}

error() {
    msg "${Red}[✘]${Color_off} ${1}${2}"
    exit 1
}

warn() {
    msg "${Red}[✘]${Color_off} ${1}${2}"
}
# }}}

# echo_with_color {{{
echo_with_color() {
    printf '%b\n' "$1$2$Color_off" >&2
}
# }}}

# fetch_repo {{{
fetch_repo() {
    if [[ -d "$HOME/.ShangVim" ]]; then
        info "Trying to update ShangVim"
        cd "$HOME/.ShangVim"
        git pull
        cd - >/dev/null 2>&1
        success "Successfully update ShangVim"
    else
        info "Trying to clone ShangVim"
        git clone https://github.com/shangzongyu/vimrc.git "$HOME/.ShangVim"
        success "Successfully clone ShangVim"
    fi
}
# }}}

# install_vim {{{
install_vim() {
    if [[ -f "$HOME/.vimrc" ]]; then
        mv "$HOME/.vimrc" "$HOME/.vimrc_back"
        success "Backup $HOME/.vimrc to $HOME/.vimrc_back"
    else
        touch $HOME/.vimrc
    fi

    if [[ -d "$HOME/.vim" ]]; then
        if [[ "$(readlink $HOME/.vim)" =~ \.ShangVim$ ]]; then
            success "Installed ShangVim for vim"
        else
            mv "$HOME/.vim" "$HOME/.vim_back"
            success "Backup $HOME/.vim to $HOME/.vim_back"
        fi
    fi

    echo "source $HOME/.ShangVim/init.vim" >> $HOME/.vimrc

    mkdir "$HOME/.vim"
    success "Installed ShangVim for vim"
}
# }}}

# install_nvim {{{
install_neovim() {
    if [[ -f "$HOME/.config/nvim/init.vim" ]]; then
        mv "$HOME/.config/nvim/init.vim" "$HOME/.config/nvim/init_back.vim"
        success "Backup $HOME/.config/nvim/init.vim to $HOME/.config/nvim/init_back.vim"
    else
        touch $HOME/.config/nvim/init.vim
    fi

    echo "source $HOME/.ShangVim/init.vim" > "$HOME/.config/nvim/init.vim"

    if [[ -d "$HOME/.vim" ]]; then
        if [[ "$(readlink $HOME/.vim)" =~ \.ShangVim$ ]]; then
            success "Installed ShangVim for neovim"
        else
            mv "$HOME/.vim" "$HOME/.vim_back"
            success "Backup $HOME/.vim to $HOME/.vim_back"
            mkdir "$HOME/.vim"
        fi
    fi

    mkdir "$HOME/.vim"
    success "Installed ShangVim for neovim"
}
# }}}

# install_package_manager {{{
install_package_manager() {
    if [[ ! -f "$HOME/.vim/autoload/plug.vim" ]]; then
        info "Install vim-plug start"
        curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        success "vim-plug installation done"
    fi
}
# }}}

# install_package {{{
install_package() {
    vim +PlugInstall +qall
    success "vim install plugin sucess"
}
# }}}

# install_neovim_package {{{
install_neovim_package() {
    nvim +PlugInstall +qall
    success "vim install plugin sucess"
}
# }}}

# uninstall_vim {{{
uninstall_vim() {
    if [[ -d "$HOME/.vim" ]]; then
        if [[ "$(readlink $HOME/.vim)" =~ \.ShangVim$ ]]; then
            rm "$HOME/.vim"
            success "Uninstall ShangVim for vim"
            if [[ -d "$HOME/.vim_back" ]]; then
                mv "$HOME/.vim_back" "$HOME/.vim"
                success "Recover from $HOME/.vim_back"
            fi
        fi
    fi

    if [[ -f "$HOME/.vimrc_back" ]]; then
        mv "$HOME/.vimrc_back" "$HOME/.vimrc"
        success "Recover from $HOME/.vimrc_back"
    fi
}
# }}}

# check_requirements {{{
check_requirements() {
    info "Checking Requirements for ShangVim"
    if hash "git" &>/dev/null; then git_version=$(git --version)
        success "Check Requirements: ${git_version}"
    else
        warn "Check Requirements : git"
    fi

    if hash "vim" &>/dev/null; then
        is_vim8=$(vim --version | grep "Vi IMproved 8.0")
        is_vim74=$(vim --version | grep "Vi IMproved 7.4")
        if [ -n "$is_vim8" ]; then success "Check Requirements: vim 8.0"
        elif [ -n "$is_vim74" ]; then
            success "Check Requirements: vim 7.4"
        fi
    fi

    if hash "nvim" &>/dev/null; then
        success "Check Requirements: nvim"
    fi

    info "Checking true colors support in terminal:"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh)"
}
# }}}

# usage {{{
usage() {
    echo "ShangVim install script : V ${Version}"
    echo ""
    echo "Usage : curl -sLf https://raw.githubusercontent.com/shangzongyu/vimrc/master/install.sh | bash -s -- [option] [target]"
    echo ""
    echo "  This is bootstrap script for ShangVim."
    echo ""
    echo "OPTIONS"
    echo ""
    echo " -i, --install            install ShangVim for vim"
    echo " -v, --version            Show version information and exit"
    echo " -u, --uninstall          Uninstall ShangVim"
    echo " -c, --checkRequirements  checkRequirements for ShangVim"
    echo ""
    echo "EXAMPLE"
    echo ""
    echo "    Install ShangVim for vim"
    echo ""
    echo "        curl -sLf https://raw.githubusercontent.com/shangzongyu/vimrc/master/install.sh | bash"
    echo ""
    echo "    Install ShangVim for vim only"
    echo ""
    echo "        curl -sLf https://raw.githubusercontent.com/shangzongyu/vimrc/master/install.sh | bash -s -- --install vim"
    echo ""
    echo "    Uninstall ShangVim"
    echo ""
    echo "        curl -sLf https://raw.githubusercontent.com/shangzongyu/vimrc/master/install.sh | bash -s -- --uninstall"
}
# }}}

# install_done {{{
install_done() {
    echo_with_color ${Yellow} ""
    echo_with_color ${Yellow} "Almost done!"
    echo_with_color ${Yellow} "=============================================================================="
    echo_with_color ${Yellow} "==    Open Vim and it will install the plugins automatically      =="
    echo_with_color ${Yellow} "=============================================================================="
    echo_with_color ${Yellow} ""
    echo_with_color ${Yellow} "That's it. Thanks for installing ShangVim. Enjoy!"
    echo_with_color ${Yellow} ""
}
# }}}

welcome() {
    echo_with_color ${Yellow} "        ___      ___ ___  _____ ______          "
    echo_with_color ${Yellow} "       |\  \    /  /|\  \|\   _ \  _   \        "
    echo_with_color ${Yellow} "       \ \  \  /  / | \  \ \  \\\__\ \  \       "
    echo_with_color ${Yellow} "        \ \  \/  / / \ \  \ \  \\|__| \  \      "
    echo_with_color ${Yellow} "         \ \    / /   \ \  \ \  \    \ \  \     "
    echo_with_color ${Yellow} "          \ \__/ /     \ \__\ \__\    \ \__\    "
    echo_with_color ${Yellow} "           \|__|/       \|__|\|__|     \|__|    "
}
# }}}

# download_dejavu_font {{{
download_dejavu_font() {
    type=$1
    file_url="https://raw.githubusercontent.com/wsdjeg/DotFiles/master/local/share/fonts/${type}"
    file_path="${HOME}/.local/share/fonts/$1"

    if [[ ! -f "$file_path" ]]; then
        info "curl -s -o $file_path $file_url"
        curl -s -o "$file_path" "$file_url"
        success "Downloaded ${type} success"
    else
        info "Found existing file $file_path"
    fi
}
# }}}

# download_fira_code_font() {{{
download_fira_code_font() {
    type=$1
    file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
    file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
    if [ ! -e "${file_path}" ]; then
        info "wget -O $file_path $file_url"
        wget -O "${file_path}" "${file_url}"
        success "Downloaded ${type} success"
    else
        info "Found existing file $file_path"
    fi;

}

# 下载字体
# install_fonts {{{
install_fonts() {
    if [[ ! -d "$HOME/.local/share/fonts" ]]; then
        mkdir -p $HOME/.local/share/fonts
    fi

    download_dejavu_font "DejaVu Sans Mono Bold Oblique for Powerline.ttf"
    download_dejavu_font "DejaVu Sans Mono Bold for Powerline.ttf"
    download_dejavu_font "DejaVu Sans Mono Oblique for Powerline.ttf"
    download_dejavu_font "DejaVu Sans Mono for Powerline.ttf"
    download_dejavu_font "DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf"
    download_dejavu_font "Ubuntu Mono derivative Powerline Nerd Font Complete.ttf"
    download_dejavu_font "WEBDINGS.TTF" download_dejavu_font "WINGDNG2.ttf"
    download_dejavu_font "WINGDNG3.ttf"
    download_dejavu_font "devicons.ttf"
    download_dejavu_font "mtextra.ttf"
    download_dejavu_font "symbol.ttf"
    download_dejavu_font "wingding.ttf"

    download_fira_code_font Bold
    download_fira_code_font Light download_fira_code_font Medium
    download_fira_code_font Regular
    download_fira_code_font Retina


    info "Updating font cache, please wait ..."
    if [ $System == "Darwin" ]; then
        info "Install on macOS ..."
        if [ ! -e "$HOME/Library/Fonts" ]; then
            mkdir "$HOME/Library/Fonts"
        fi
        cp $HOME/.local/share/fonts/* $HOME/Library/Fonts/
    elif [ $System == "FreeBSD" ]; then
        info "Install on FreeBSD ..."
    else
        info "Install on linux..."
        fc-cache -fv >/dev/null
        mkfontdir "$HOME/.local/share/fonts" >/dev/null
        mkfontscale "$HOME/.local/share/fonts" >/dev/null
    fi
    success "font cache done!"
}
# }}}

### main {{{
main() {
    if [ $# -gt 0 ]; then
        case $1 in
        --uninstall | -u)
            info "Trying to uninstall ShangVim"
            uninstall_vim
            echo_with_color ${BWhite} "Thanks!"
            exit 0
            ;;
        --checkRequirements | -c)
            check_requirements
            exit 0
            ;;
        --install | -i)
            welcome
            need_cmd 'git'
            fetch_repo
            install_vim
            install_package_manager
            install_package
            install_done
            exit 0
            ;;
        --install-neovim)
            welcome
            need_cmd 'git'
            fetch_repo
            install_neovim
            install_package_manager
            install_neovim_package
            install_done
            exit 0
            ;;
        --help | -h)
            install_fonts
           # usage
            exit 0
            ;;
        --version | -v)
            msg "${Version}"
            exit 0
            ;;
        esac
    else
        welcome
        need_cmd 'git'
        fetch_repo
        install_vim
        install_package_manager
        install_package
        install_fonts
        install_done
    fi
}
# }}}

main $@

# vim:set foldenable foldmethod=marker:
