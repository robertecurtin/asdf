local number_to_asdf = require 'number_to_asdf'
local asdf_to_number = require 'asdf_to_number'

return function(vars, args)
  -- a <digit 1> <digit 2> <digit 3>
  vars.write(args[2], number_to_asdf(
    asdf_to_number(vars.read(args[3])) +
    asdf_to_number(vars.read(args[4]))))
end
