# Defined in - @ line 1
function cxt --wraps='cargo xtest' --description 'alias cxt cargo xtest'
  cargo xtest $argv;
end
