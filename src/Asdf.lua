local add = require 'add'
local subtract = require 'subtract'
local declare = require 'declare'
local declare_array = require 'declare_array'
local get = require 'get'
local substring = require 'substring'
local fetch = require 'fetch'

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

    if #args == 4 then
      if args[1] == 'a' then
        add(vars, args)
      elseif args[1] == 's' then
        if vars[args[2]].type == 's' then
          substring(vars, args)
        else
          subtract(vars, args)
        end
      elseif args[1] == 'd' then
        declare(vars, args)
      end
    elseif #args == 5 then
      declare_array(vars, args)
    elseif #args == 1 then
      return get(vars, args)
    elseif args[1] == 'f' then
      return fetch(vars, args)
    end
  end
end
