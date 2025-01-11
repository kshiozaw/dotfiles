# kyokio fish

source ~/.config/fish/config_common.fish

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
# normal
alias prog='cd ~/Documents/program/'
alias g++='g++-14';
