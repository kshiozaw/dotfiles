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
# SDKMAN
#######################################
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
# set sdkman dir
if not test -n "$SDKMAN_DIR"
    set -x SDKMAN_DIR (brew --prefix sdkman-cli)/libexec
end
 
# sdk command
function sdk
    bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh && sdk $argv"
end
 
# add paths
for ITEM in $SDKMAN_DIR/candidates/*
    set -gx PATH $ITEM/current/bin $PATH
end

#######################################
# alias
#######################################

# java
alias mvn="~/.m2/wrapper/dists/apache-maven-3.8.7-bin/1ktonn2lleg549uah6ngl1r74r/apache-maven-3.8.7/bin/mvn"



### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/kshiozaw/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
