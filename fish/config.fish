#######################################
# PATH
#######################################
if status is-interactive
  # Commands to run in interactive sessions can go here
  set PATH /usr/local/mysql/bin $PATH
  set PATH /opt/homebrew/bin $PATH
  set PATH /opt/homebrew/opt/openjdk@17/bin $PATH
  set PATH /Users/kyokio/.docker/bin $PATH
  set PATH /opt/homebrew/opt/libpq/bin $PATH
  set PATH /opt/homebrew/opt/node@18/bin $PATH
end


#######################################
# alias
#######################################
# eza
alias ls='eza -ghHl --icons --git --sort=ext'
alias la='eza -ghHl --icons --git --sort=ext -a'
alias tree='eza -ghHl --tree --icons --git --sort=ext'

# git
alias gits='git status -u'
alias gitd='git diff'
alias gitl='git log'
alias gitg="git log --graph --date-order --all --pretty=format:'%h %C(magenta)%ad %C(ul cyan)[%cn]%C(reset) %C(yellow bold)%s %C(red)%w(80)%d' --date=short"

# vim
alias vi='nvim'
alias vim='nvim'
alias fvim='vim $(fzf)'

# else
alias myip='curl inet-ip.info'

# Added by Antigravity
fish_add_path /Users/kyokio/.antigravity/antigravity/bin

# Added by `rbenv init` on 2026年 3月14日 土曜日 13時59分51秒 JST
status --is-interactive; and rbenv init - --no-rehash fish | source
