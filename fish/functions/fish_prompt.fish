# color
set gold ffd170
set orange_lite f2ac57
set orange_midd f28444
set orange_deep c66400


function _prompt_dir
  printf (set_color $orange_lite)' %s'(prompt_pwd)
  set color normal
end

function _git_branch
  set -l git_branch (git branch 2>/dev/null | grep -e '\*' | sed 's/^..\(.*\)/\1/')
  if string length -q -- $git_branch
    printf (set_color grey)' on '
    printf (set_color $gold)' %s ' $git_branch
  end
  set_color normal
end
 
function fish_prompt
  # check status code
  set -l last_status $status
  if [ $last_status -eq 0 ]
    set status_icon (set_color $orange_deep)' '
  else
    set status_icon (set_color $orange_deep)' '
  end

  _prompt_dir
  _git_branch
  printf $status_icon
  printf (set_color grey)' '
end

function fish_right_prompt
  echo -n (set_color --bold black)
	date "+%H:%M:%S"
	echo -n (set color normal)
end
