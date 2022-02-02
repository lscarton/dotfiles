# Config File for ZSH

# Prompt related configuration
function git_stuff(){
    branch=$(git branch 2> /dev/null | grep '\*' | awk '{print ($2)}')
    if [ ! -z "$branch" ]; then
    st=$(git status --short)
        if [ -z "$st" ]; then
            echo "%F{green}$branch"
        else
            echo "%F{red}$branch"
        fi
    fi
}
PROMPT='
%F{blue}%S[ %B%1~%b%F{blue} ]%s▶%f '
RPROMPT='$(git_stuff)'

# reevaluate prompt every time
setopt promptsubst

# appends cd in front of a directory name
setopt autocd 

# allow to make a beep noise
setopt beep 

# glob based on ~ 
setopt extendedglob 

# if no match found, show a error line
setopt nomatch 

#
setopt notify

# vim like key bindings
bindkey -v

# If we have a glob, this will expand it 
setopt glob_complete
setopt pushd_minus

# case insensitive glob
setopt no_case_glob

# command completion
autoload -U compinit
compinit
# autocomplete with keyboard
zstyle ':completion:*' menu select
# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# generate description with magic
zstyle ':completion:*' auto-description 'specify: %d'
# autocompletion for command line switches for alias
setopt completealiases

# history related settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory 
# prevent duplicate lines in history
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
# write to history after each command
setopt inc_append_history
bindkey "^F" history-beginning-search-forward
bindkey "^R" history-incremental-search-backward

# rehash automatically so new files in $PATH are found
zstyle ':completion:*' rehash true

# disable "flow control" (flow control locks terminal when pressing ctrl+s
stty -ixon


# The following lines were added by compinstall
zstyle :compinstall filename '/home/dharmin/.zshrc'

# End of lines added by compinstall

# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#     RPS2=$RPS1
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# source zsh_aliases file
source ~/dotfiles/aliases

source ~/dotfiles/source_list
