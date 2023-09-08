# kyokio fish

#######################################
# PATH
#######################################
if status is-interactive
  # Commands to run in interactive sessions can go here
  set PATH /usr/local/mysql/bin $PATH
  set PATH /opt/homebrew/bin $PATH
end


#######################################
# alias
#######################################
# bat
alias cat='bat --theme=TwoDark'

# exa
alias ls='exa -ghHl --icons --git --sort=ext'
alias la='exa -ghHl --icons --git --sort=ext -a'
alias tree='exa -ghHl --tree --icons --git --sort=ext'

# python
alias pip='python3 -m pip'


# git
alias gits='git status'
alias gitd='git diff'
alias gitl='git log'
alias gitg="git log --graph --date-order --all --pretty=format:'%h %C(magenta)%ad %C(ul cyan)[%cn]%C(reset) %C(yellow bold)%s %C(red)%w(80)%d' --date=short"

# vim
alias vi='nvim'
alias vim='nvim'
alias fvim='vim $(fzf)'

# java
alias mvn="~/.m2/wrapper/dists/apache-maven-3.8.7-bin/1ktonn2lleg549uah6ngl1r74r/apache-maven-3.8.7/bin/mvn"

# else
alias myip='curl ifconfig.co/'
