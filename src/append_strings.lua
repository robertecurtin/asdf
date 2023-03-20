return function(vars, args)
  -- a [string1] [string2] [string3]
  -- appends 2+3 and store in 1
  local string2 = vars.read(args[3])
  local string3 = vars.read(args[4])
  vars.write(args[2], string2 .. string3)
end
