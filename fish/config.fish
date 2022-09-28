# kyokio fish

# path
# set PATH /usr/local/opt/llvm/bin $PATH  # coc-nvimのc++用

# alias
# normal
alias abc='source ~/Documents/program/command/abc_fish'
alias prog='cd ~/Documents/program/'
alias python='python3.9'
alias python3='python3.9'
alias vi='nvim'
alias vim='nvim'
alias cat='bat --theme=TwoDark'

# exa
alias ls='exa -ghHl --icons --git --sort=ext'
alias la='exa -ghHl --icons -a --git --sort=ext'
alias tree='exa -ghHl --tree --icons --git --sort=ext'

# git
alias gits="git status"
alias gitd="git diff"
alias gitl="git log"
alias gitg="git log --graph --date-order --all --pretty=format:'%h %C(magenta)%ad %C(ul cyan)[%cn]%C(reset) %C(yellow bold)%s %C(red)%w(80)%d' --date=short"

# g++
alias g++="g++ --std=c++17"
