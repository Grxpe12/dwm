#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias fdm='export QT_MEDIA_BACKEND=darwin && fdm'
alias cat='bat --style=plain --theme=GitHub'
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias p='sudo pacman'
alias s='source ~/.bashrc'
alias l='lsd -l'
alias ll='lsd -al'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
