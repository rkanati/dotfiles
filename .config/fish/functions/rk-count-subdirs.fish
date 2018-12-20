function rk-count-subdirs
  for d in */
    echo -s (find $d -type f | wc -l) \t $d
  end | sort -rn
end

