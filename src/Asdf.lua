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
  vars.exists = function(k) return vars[k] end

  local invalid_input = function(context)
    return function(vars, args)
      error('Invalid input: ' .. context, vars, args)
    end
  end

  return function(_args)
    local args = {}
    local types = {}
    for v in _args:gmatch('%a+') do
      table.insert(args, v)
      table.insert(types, vars.exists(v) and vars.type(v) or false)
    end

    if #args == 1 then
      return get(vars, args)
    end

    return (({
      a = function()
        return (({
          a = append_to_array,
          s = append_strings,
          d = add
        })[types[2]])(vars, args)
      end,
      s = function()
        if not types[2] then
          invalid_input('s')()
        else
          return (({
            a = invalid_input('s a'),
            s = substring,
            d = function(vars, args)
              if types[3] == 's' then
                string_length(vars, args)
              else
                subtract(vars, args)
              end
            end,
            f = invalid_input('s f')
          })[types[2]])(vars, args)
        end
      end,
      d = function()
        if #args == 4 then
          declare(vars, args)
        else
          declare_array(vars, args)
        end
      end,
      f = function()
        return fetch(vars, args)
      end
    })[args[1]])()
  end
end
