function fish_title
  echo -ns (homeify $PWD)
  if test "$_" != fish
    echo -ns " ◊ $argv"
  end
  echo " ― fish"
end
