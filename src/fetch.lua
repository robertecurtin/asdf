local asdf_to_number = require 'asdf_to_number'
return function (vars, args)
  -- f [index] [array]
  local index = asdf_to_number(vars.read(args[2]))
  return vars.read(args[3])[index].value
end
