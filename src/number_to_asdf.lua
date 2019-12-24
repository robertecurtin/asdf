  return function(n)
    local o = ''
    while n > 0 do
      o = o .. ({
        [0] = 'a',
        [1] = 's',
        [2] = 'd',
        [3] = 'f'
      })[n % 4]
      n = math.floor(n / 4)
    end
    return o:reverse()
  end

