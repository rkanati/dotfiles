
# make cd resolve symlinks, like fish pre-3.0
#function cd
#  if test (count $argv) -eq 0
#    builtin cd
#  else
#    builtin cd (realpath $argv)
#  end
#end

umask 027

