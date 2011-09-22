#
#~/.bashrc
#

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Check for an interactive session
[ -z "$PS1" ] && return

#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;32m\][\u@\h]\[\e[m\] \[\e[1;34m\]\w/\[\e[m\] \[\e[1;32m\]\$\[\e[m\]\[\e[1;37m\] '

#ssh
alias sshsamy='ssh k6b@192.168.1.3'

#alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias more='less'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'

# pacman
alias pacman='sudo pacman-color'
alias update='pacman -Syyu'
alias remove='pacman -Rsc'
alias install='pacman -S'
alias search='pacman -Ss'

# ls
alias ls='ls -hF --color=always'
alias lr='ls -R'                  #  recursive ls
alias ll='ls -l'
alias la='ls -a'
alias lA='ll -A'
alias lx='ll -BX'                 #  sort by extension
alias lz='ll -rS'                 #  sort by size
alias lt='ll -rt'                 #  sort by date
alias lm='la | more'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                  #  'rm -i' prompts for every file
alias ln='ln -i'
#
#ignore history dupes
export HISTCONTROL=ignoredups
