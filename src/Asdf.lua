return function()
  local vars = {
  }

  local function number_to_asdf(n)
    return ({
      [0] = 'a',
      [1] = 's',
      [2] = 'd',
      [3] = 'f'
    })[n]
  end

  local function asdf_to_number(n)
    return ({
      a = 0,
      s = 1,
      d = 2,
      f = 3
    })[n]
  end

  return function(_args)
    local args = {}
    for v in _args:gmatch('%a') do
      table.insert(args, v)
    end

    local function parse_action()
      if #args == 4 then
        if args[1] == 'a' then
          return 'add'
        elseif args[1] == 's' then
          return 'subtract'
        elseif args[1] == 'd' then
          return 'declare'
        end
      elseif #args == 1 then return 'get'
      end
    end

    local action = parse_action()

    if action == 'declare' then
      -- d <type> <name> <value>
      vars[args[3]] = {
        type = args[2],
        value = args[4]
      }
    elseif action == 'get' then
      -- a/s/d/f
      return vars[args[1]].value
    elseif action == 'add' then
      -- a <digit 1> <digit 2> <digit 3>
      vars[args[2]].value = number_to_asdf(
        asdf_to_number(vars[args[3]].value) + asdf_to_number(vars[args[4]].value))
    elseif action == 'subtract' then
      -- s <digit 1> <digit 2> <digit 3>
      vars[args[2]].value = number_to_asdf(
        asdf_to_number(vars[args[3]].value) - asdf_to_number(vars[args[4]].value))
    end
  end
end
