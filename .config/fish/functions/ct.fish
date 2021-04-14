# Defined via `source`
function ct --wraps='cargo test -q' --description 'alias ct cargo test -q'
  cargo test -q $argv; 
end
