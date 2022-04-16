# color
set -l blue             00bcc6
set -l light_blue       8ed0ff
set -l green            00c694
set -l dark_green       287480
set -l red              ff6161
set -l pink             c600c0
set -l light_pink       f8bbf6
set -l orange           c66400
set -l yellow           ffff00


function _prompt_dir
  printf (set_color green)' %s'(prompt_pwd)
  set color normal
end

function _prompt_user
  printf (set_color black)'[%s]' (set_color red)(whoami)(set_color black)
  set_color normal
end

function _git_branch
  set -l git_branch (git branch 2>/dev/null | grep -e '\*' | sed 's/^..\(.*\)/\1/')
  if string length -q -- $git_branch
    printf (set_color e0de94)'{%s}' $git_branch
  end
  set_color normal
end
 
function fish_prompt
  # 最初に書かないと他の関数でstatusが上書きされる
  set -l last_status $status
  if [ $last_status -eq 0 ]
    set status_icon (set_color c66400)' '
  else
    set status_icon (set_color c66400)' '
  end

  _prompt_user
  _prompt_dir
  _git_branch
  printf $status_icon
  printf (set_color grey)'$ '
end

function fish_right_prompt
  echo -n (set_color --bold black)
	date "+%H:%M:%S"
	echo -n (set color normal)
end
