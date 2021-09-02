# Defined in /tmp/fish.TPruaK/fish_title.fish @ line 2
function fish_title
    set -q argv[1]; or set argv "fish"
    echo -ns "$argv · "(fish_prompt_pwd_dir_length=1 prompt_pwd)
    #if test "$_" != fish
    #    echo -ns "$argv[1] · $formatted_cwd"
    #else
    #    echo -ns "fish · $formatted_cwd"
    #end
end
