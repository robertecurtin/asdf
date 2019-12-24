
return function(vars, args)
  -- d <type> <name> <value>
  vars[args[3]] = {
    type = args[2],
    value = args[4]
  }
end
