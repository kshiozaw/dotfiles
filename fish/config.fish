# kyokio fish

#######################################
# PATH
#######################################
if status is-interactive
  # Commands to run in interactive sessions can go here
  set PATH /usr/local/mysql/bin $PATH
  set PATH /opt/homebrew/bin $PATH
  set PATH /opt/homebrew/opt/openjdk@17/bin $PATH
  set PATH /Users/kyokio/.docker/bin $PATH
  set PATH /Applications/Docker.app/Contents/Resources/bin/ $PATH
  # set PATH /usr/local/opt/llvm/bin $PATH  # coc-nvimのc++用
end


#######################################
# alias
#######################################
# normal
alias abc='source ~/Documents/program/command/abc_fish.fish'
alias prog='cd ~/Documents/program/'
alias cat='bat --theme=TwoDark'

# python
# 3.9をデフォルトで使用する
# 3.11はmitmproxyに使うからインストール
alias python='python3.9'
alias python3='python3.9'
alias pip='python3.9 -m pip'

# exa
alias ls='exa -ghHl --icons --git --sort=ext'
alias la='exa -ghHl --icons --git --sort=ext -a'
alias tree='exa -ghHl --tree --icons --git --sort=ext'

# git
alias gits='git status'
alias gitd='git diff'
alias gitl='git log'
alias gitg="git log --graph --date-order --all --pretty=format:'%h %C(magenta)%ad %C(ul cyan)[%cn]%C(reset) %C(yellow bold)%s %C(red)%w(80)%d' --date=short"

# gcc/g++
# シンボリックリンクの張り替えが面倒からaliasを使う
# alias gcc='gcc-12 '
# alias g++='g++-12 --std=c++17'
alias gcc='gcc-12 --sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk'
alias g++='g++-12 --sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk --std=c++17'

# vim
alias vi='nvim'
alias vim='nvim'
alias fvim='vim $(fzf)'

# else
alias myip='curl ifconfig.co/'
