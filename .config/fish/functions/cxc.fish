# Defined in - @ line 1
function cxc --wraps='cargo xcheck' --description 'alias cxc cargo xcheck'
  cargo xcheck $argv;
end
