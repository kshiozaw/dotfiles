
function abc
  set file "abc$argv[1]"
  cd ~/documents/program/AtCoder/ABC
  
  if test -z $argv[1]
    # echo 引数入れろばか
    cd ~/documents/program/AtCoder/ABC
  else if test -d $file
    cd $file
  else
    echo "dirないよ。作ったろか？(y/n)"
    read ans
    if test $ans = "y"
      mkdir $file
      cd $file
    end
  end
end
