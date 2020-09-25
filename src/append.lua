local number_to_asdf = require 'number_to_asdf'
local asdf_to_number = require 'asdf_to_number'

return function(vars, args)
  -- a [array] [var]
  local array = vars.read(args[2])
  table.insert(array, { type = vars.type(args[3]), value = vars.read(args[3]) })
  vars.write(args[2], array)
end
