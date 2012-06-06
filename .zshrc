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

export PATH=$PATH:/home/k6b/scripts

#alsi

#Autocomplete
zstyle ':completion:*' menu select
setopt completealiases

autoload -U colors && colors

source ~/.zsh_alias

autoload -Uz promptinit
promptinit
