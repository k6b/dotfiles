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

alsi

#Autocomplete
zstyle ':completion:*' menu select
setopt completealiases

autoload -U colors && colors

#Prompt
DONTSETRPROMPT=1
RPROMPT="%B%{$fg[yellow]%}%@%{$reset_color%}%b"


autoload -Uz promptinit
promptinit

alias rscreen='screen -r'

alias mnttor='sshfs k6b@107.20.208.25:/home/k6b/torrents ~/torrents && sshfs k6b@107.20.208.25:/home/k6b/downloads ~/torrentdownload'
alias umnttor='sudo fusermount -u ~/torrents && sudo fusermount -u ~/torrentdownload'


#ssh
alias sshsamy='ssh k6b@192.168.1.3'
alias sshweb='ssh -p 2222 -o PubkeyAuthentication=no k6b@184.173.236.53'
alias sftpweb='sftp -P 2222 -o PubkeyAuthentication=no k6b@184.173.236.53'
alias ec2k6b='ssh k6b@107.20.208.25'
alias chunkssh='ssh -t 107.20.208.25  ssh 69.172.212.23'

#alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias more='less'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'
alias ....="../../.."
alias .....="../../../.."

# pacman
alias pacman='sudo pacman-color'
alias update='pacman -Syyu'
alias remove='pacman -Rsc'
alias install='pacman -S'
alias search='pacman -Ss'
alias icanhaz='pacman -S'

# ls
alias ls='ls -hF --color=always'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ls -a'
alias lA='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias lla='ll -a'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'

#Folders
alias logs='cd /var/log'

alias fuck='curl -s rage.thewaffleshop.net'

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

