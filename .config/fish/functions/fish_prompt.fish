function fish_prompt
  set -l prev_stat $status

  set -g prompt_segs
  function add_seg
    set -g prompt_segs $prompt_segs "$argv"
  end

  # previous status
  if [ "$prev_stat" -ne 0 ]
#   add_seg (set_color -o brred; echo -n "🗙 $prev_stat")
    add_seg (set_color -o; echo -n "🗙 $prev_stat")
  end

  # pwd
# add_seg (set_color bryellow; echo -n $PWD | sed "s#^$HOME#~#")
  add_seg (set_color -o; echo -n $PWD | sed "s#^$HOME#~#")

  # git at the end
  set -l branch (git symbolic-ref --short HEAD ^/dev/null)
  if [ "$branch" ]
#   add_seg (set_color green; echo -n " $branch")
    add_seg (set_color -o; echo -n " $branch")
  else
    set -l commit (git rev-parse --short HEAD ^/dev/null)
    if [ "$commit" ]
#     add_seg (set_color magenta; echo -n "⚑ $commit")
      add_seg (set_color -o; echo -n "⚑ $commit")
    end
  end

  # whoami
# add_seg (set_color brmagenta; whoami)
  add_seg (set_color -o; whoami)

  # newline
  function c_rst
    set_color normal
  end

  function c_bg
    set_color -b brcyan
  end

  function c_sep
    set_color brcyan
    set_color -r
  end

  echo -ns (c_rst) \n (c_bg) " "

  # print segments
  set -l first_seg yes
  for seg in $prompt_segs
    # print separator
    if [ -z "$first_seg" ]
      echo -ns " " (c_rst; c_sep) "" (c_rst; c_bg) " "
    end

    # print text
#   echo -ns "$seg " (c_rst) "· "
    c_rst
    set_color -b brcyan
    set_color    black
    echo -ns "$seg"
    set -l first_seg
  end

  # print end
# echo -ns " " (c_rst; set_color black) 
  echo -ns " " (c_rst; set_color brcyan) 

  # prompt
  echo -ns (c_rst; set_color brwhite) \n "  ◇ " (c_rst)

  set -e prompt_segs

  # reset cursor, ugh
  echo -ens "\e[ q" "\e[?25h" # reset style; show
end
