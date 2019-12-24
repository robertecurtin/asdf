return function (vars, args)
  -- f [index] [array]
   return vars.read(args[3])[args[2]]
end