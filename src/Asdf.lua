local add = require 'add'
local subtract = require 'subtract'
local declare = require 'declare'
local get = require 'get'
local substring = require 'substring'

return function()
  local vars = {}
  vars.read = function(k) return vars[k].value end
  vars.write = function(k, v) vars[k].value = v end
  vars.type = function(k) return vars[k].type end
  vars.declare = function(k, v) vars[k] = v end

  return function(_args)
    local args = {}
    for v in _args:gmatch('%a+') do
      table.insert(args, v)
    end

    local function parse_action()
      if #args == 4 then
        if args[1] == 'a' then
          return 'add'
        elseif args[1] == 's' then
          if vars[args[2]].type == 's' then
            return 'substring'
          else
            return 'subtract'
          end
        elseif args[1] == 'd' then
          return 'declare'
        end
      elseif #args == 1 then return 'get'
      end
    end

    local action = parse_action()

    if action == 'declare' then
      declare(vars, args)
    elseif action == 'get' then
      return get(vars, args)
    elseif action == 'add' then
      add(vars, args)
    elseif action == 'subtract' then
      subtract(vars, args)
    elseif action == 'substring' then
      substring(vars, args)
    end
  end
end
