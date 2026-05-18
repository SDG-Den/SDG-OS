
## command aliases
alias pacgui=~/.config/sdgos/tuis/pkg-install.sh
alias aurgui=~/.config/sdgos/tuis/aur-install.sh
alias find="fzf --layout=reverse --preview='bat {}'"
alias microfind='micro $(pwd)/$(fzf --layout=reverse --preview="bat {}")'
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
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
alias please='sudo'
alias jctl="journalctl -p 3 -xb"
EDITOR=micro
IMAGEPROGRAM='satty --filename'

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

eval "$(zoxide init zsh --cmd cd )"