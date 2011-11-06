# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory autocd extendedglob nomatch notify HIST_REDUCE_BLANKS HIST_IGNORE_SPACE correctall noclobber correct histignoredups
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/k6b/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Load alias'

source ~/.zsh_alias

#Define XDG Dirs

XDG_DESKTOP_DIR="$HOME/.desktop"
XDG_DOWNLOAD_DIR="$HOME/downloads"
XDG_TEMPLATES_DIR="$HOME/templates"
XDG_PUBLICSHARE_DIR="$HOME/public"
XDG_DOCUMENTS_DIR="$HOME/documents"
XDG_MUSIC_DIR="$HOME/music"
XDG_PICTURES_DIR="$HOME/pictures"
XDG_VIDEOS_DIR="$HOME/videos"

#Add my scripts to $PATH

export PATH=$PATH:/home/k6b/scripts

alsi

#Prompt

#DONTSETRPROMPT=1
#RPROMPT="%B%{$fg[yellow]%}%@%{$reset_color%}%b"
BATTERY=1

#Autocomplete
zstyle ':completion:*' menu select
setopt completealiases

autoload -U colors && colors

autoload -Uz promptinit
promptinit

##Set some keybindings
###############################################
typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[7~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[8~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
bindkey '^[[2~' overwrite-mode
#################################################
