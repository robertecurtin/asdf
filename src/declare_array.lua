return function(vars, args)
  -- d a [name] [type] [value]
  vars.declare(args[3], {
    type = 'a',
    value = {
      type = args[4],
      value = args[5]
  }})
end
