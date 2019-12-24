local asdf_to_number = require 'asdf_to_number'

return function(vars, args)
  -- s [str] [digit 1] [digit 2]
  vars.write(args[2], vars.read(args[2]):sub(
    asdf_to_number(vars.read(args[3])) + 1,
    asdf_to_number(vars.read(args[4])) + 1))
end
