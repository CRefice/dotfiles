#============================
# Input/line editing bindings
#============================
# Enable vi-like line editing
bindkey -v
# Control-x-e to open current line in $EDITOR, awesome when writting functions or editing multiline commands.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Autocompletion
fpath+=($ZDOTDIR/completions)
autoload -Uz compinit; compinit
setopt no_complete_aliases
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

#========================
# Directory management
#========================
DIRSTACKSIZE=16
# Keep history of `cd` as in with `pushd` and make `cd -<TAB>` work.
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
local parent() {
	cd ..
	zle reset-prompt
}
zle -N parent
# Go up one directory with Ctrl+U
bindkey '^u' parent

#========================
# Command history
#========================
HISTFILE=$HOME/.cache/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt extended_history          # Write the history file in the ":start:elapsed;command" format.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
setopt hist_save_no_dups         # Don't write duplicate entries in the history file.
setopt hist_reduce_blanks        # Remove superfluous blanks before recording entry.
setopt hist_verify               # Don't execute immediately upon history expansion.

#========================
# Prompt customization
#========================
eval "$(starship init zsh)"

# SSH Agent configuration
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi


#=====================================
# Keybindings and other customizations
#=====================================
# Fzf scripts
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --glob "!.git/*"'

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
