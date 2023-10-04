# kyokio fish

source ~/.config/fish/config_common.fish

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

# java
alias mvn="~/.m2/wrapper/dists/apache-maven-3.8.7-bin/1ktonn2lleg549uah6ngl1r74r/apache-maven-3.8.7/bin/mvn"



### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/kshiozaw/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
