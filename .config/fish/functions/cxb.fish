# Defined in - @ line 1
function cxb --wraps='cargo xbuild' --description 'alias cxb cargo xbuild'
  cargo xbuild $argv;
end
