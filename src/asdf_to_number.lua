  return function(n)
    local o = 0
    for v in n:gmatch('%a') do
      o = o * 4
      o = o + ({
        a = 0,
        s = 1,
        d = 2,
        f = 3
      })[v]
    end
    return o
  end
