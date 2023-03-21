local add = require 'add'
local append_to_array = require 'append_to_array'
local append_strings = require 'append_strings'
local subtract = require 'subtract'
local declare = require 'declare'
local declare_array = require 'declare_array'
local get = require 'get'
local substring = require 'substring'
local string_length = require 'string_length'
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

    if #args == 1 then
      return get(vars, args)
    end

    if args[1] == 'a' then
      if vars.type(args[2]) == 'd' then
        add(vars, args)
      elseif vars.type(args[2]) == 's' then
        append_strings(vars, args)
      elseif vars.type(args[2]) == 'a' then
        append_to_array(vars, args)
      end
    elseif args[1] == 's' then
      if vars[args[2]].type == 's' then
        substring(vars, args)
      elseif vars[args[2]].type == 'd' and vars[args[3]].type == 's' then
        string_length(vars, args)
      else
        subtract(vars, args)
      end
    elseif args[1] == 'd' then
      if #args == 4 then
        declare(vars, args)
      else
        declare_array(vars, args)
      end
    elseif args[1] == 'f' then
      return fetch(vars, args)
    end
  end
end
