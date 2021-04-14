# Defined in - @ line 1
function cxr --wraps='cargo xrun' --description 'alias cxr cargo xrun'
  cargo xrun $argv;
end
