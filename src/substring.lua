local number_to_asdf = require 'number_to_asdf'
local asdf_to_number = require 'asdf_to_number'

return function(vars, args)
  -- s <str> <digit 1> <digit 2>
  vars[args[2]].value = vars[args[2]].value:sub(
    asdf_to_number(vars[args[3]].value) + 1, asdf_to_number(vars[args[4]].value) + 1)
end
