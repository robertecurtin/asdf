local number_to_asdf = require 'number_to_asdf'
local asdf_to_number = require 'asdf_to_number'

return function(vars, args)
  -- a <digit 1> <digit 2> <digit 3>
  vars[args[2]].value = number_to_asdf(
    asdf_to_number(vars[args[3]].value) + asdf_to_number(vars[args[4]].value))
end
