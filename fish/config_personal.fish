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
end


#######################################
# alias
#######################################
# normal
alias prog='cd ~/Documents/program/'

# gcc/g++
# include searchにbits/stdc++.h用のpathを追加
alias gcc='gcc-13 --sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk'
alias g++='g++-13 --sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk --std=c++17'

