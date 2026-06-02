
## command aliases
alias find="fzf --layout=reverse --preview='bat {}'"
alias microfind='micro $(pwd)/$(fzf --layout=reverse --preview="bat {}")'
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --level=4 --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias update='sudo pacman -Syu'
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias apt='man pacman'
alias apt-get='man pacman'
alias jctl="journalctl -p 3 -xb"
alias cmdhist='CMD=$(history -i | tac | fzf | sed "s/.*:..  //"); sleep 0.1 && wtype $CMD'
alias tipme='shuf -n 1 ~/.config/sdgos/tips/tips.list'
alias alltips='cat ~/.config/sdgos/tips/tips.list | fzf'
alias cowtip='cowsay -r $(shuf -n 1 ~/.config/sdgos/tips/tips.list) | lolcat'
alias fetch='~/.config/sdgos/fastfetch/fetch.sh'
alias fetchconf='~/.config/sdgos/fastfetch/fetch-conf.sh'
alias yurifetch='fastfetch -l ~/Documents/yuri.png'

## tools
alias pacgui=~/.config/sdgos/tuis/pkg-install.sh
alias aurgui=~/.config/sdgos/tuis/aur-install.sh
alias git-projects=~/.config/sdgos/tuis/project.select.sh
alias mangoconf=~/.config/sdgos/mango-config.sh
alias documentation=~/.config/sdgos/tuis/documentation.sh
alias tldrtui=~/.config/sdgos/help/cmd-help.sh
alias helptui=~/.config/sdgos/help/help.sh

export EDITOR=micro
export IMAGEPROGRAM='satty --filename'
export SHELL=/bin/zsh

function plz() {
    if [ -z "$1" ]; then
        sudo $(fc -ln 1 | tail -1)
    else
        sudo "$@"
    fi
}
## filetype aliases, default-opens them with the set program
alias -s json=$EDITOR
alias -s yaml=$EDITOR
alias -s md=$EDITOR
alias -s toml=$EDITOR
alias -s conf=$EDITOR
alias -s yml=$EDITOR
alias -s txt=$EDITOR
alias -s css=$EDITOR
alias -s html=$EDITOR
alias -s png=$IMAGEPROGRAM
alias -s jpg=$IMAGEPROGRAM
alias -s jpeg=$IMAGEPROGRAM
alias -s webp=$IMAGEPROGRAM
alias -s nix=$EDITOR

eval "$(zoxide init zsh --cmd cd )"
source <(fzf --zsh)
