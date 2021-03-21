path+=("${HOME}/.local/bin")

export EDITOR='vim'
export VISUAL='vim'
# Use smooth touchpad scrolling in firefox
export MOZ_USE_XINPUT2=1
# Tell CMake to export compile commands for clang-tidy/clangd
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

alias yay='paru'
alias make='make -j'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias g='git'
alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# Alias git (alias) to g(alias)
ALIASES=($(git config --get-regexp '^alias\.' \
	| sed 's/^alias\.//' \
	| cut -d' ' -f1))
for al in $ALIASES; do
	alias "g${al}"="git $al"
done

# Create and cd in one command
function mkacd() {
	mkdir -p $1 && cd $1
}
