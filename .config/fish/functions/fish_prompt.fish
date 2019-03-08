function fish_prompt
  set -l prev_stat $status

  set -g prompt_segs
  function add_seg
    set -g prompt_segs $prompt_segs "$argv"
  end

  # whoami
  add_seg (set_color brmagenta; whoami)

  # previous status
  if [ "$prev_stat" -ne 0 ]
    add_seg (set_color brred; echo -n "🗙 $prev_stat")
  end

  # pwd
  add_seg (set_color brblue; homeify $PWD)

  # git at the end
  set -l branch (git symbolic-ref --short HEAD ^/dev/null)
  if [ "$branch" ]
    add_seg (set_color bryellow; echo -n " $branch")
  else
    set -l commit (git rev-parse --short HEAD ^/dev/null)
    if [ "$commit" ]
      add_seg (set_color brgreen; echo -n "⚑ $commit")
    end
  end

  # newline
  function c_rst
    set_color normal
  end

  echo -s (c_rst)

  # print segments
  for seg in $prompt_segs
    # print text
    c_rst
    set_color brcyan
    echo -ns "$seg "
  end

  # print end
  echo -ens (c_rst) "\n" (set_color brcyan) "  ◇ " (c_rst)

  set -e prompt_segs

  # reset cursor, ugh
  echo -ens "\e[q" "\e[?25h" # reset style; show
end

