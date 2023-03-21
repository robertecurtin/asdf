local number_to_asdf = require 'number_to_asdf'

return function(vars, args)
  -- s [digit] [string]
  vars.write(args[2], number_to_asdf(string.len(vars.read(args[3]))))
end

