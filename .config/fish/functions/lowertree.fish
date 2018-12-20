# Defined in /tmp/fish.BJVLwN/lowertree.fish @ line 1
function lowertree
	set -l src $argv[1]
  if [ -d $src ]
    pushd $src
    for f in *
      lowertree $f
    end
    popd
  end
  set -l dest (string lower $src)
  if [ $src != $dest ]
    mv $src $dest
  end
end
