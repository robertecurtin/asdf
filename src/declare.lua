
return function(vars, args)
  -- d <type> <name> <value>
  vars.declare(args[3], {
    type = args[2],
    value = args[4]
  })
end
