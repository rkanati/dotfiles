function homeify
  echo "$argv" | sed "s#^$HOME#~#"
end

