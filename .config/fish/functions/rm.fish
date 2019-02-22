function rm
  if status is-interactive
    command rm -I $argv
  else
    command rm $argv
  end
end

