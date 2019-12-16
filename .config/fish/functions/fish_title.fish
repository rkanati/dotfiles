# Defined in /home/rk/.config/fish/functions/fish_title.fish @ line 2
function fish_title
	echo -ns (homeify $PWD)
  if test "$_" != fish
    echo -ns " ― $argv"
  else
    echo -ns " ― fish"
  end
end
