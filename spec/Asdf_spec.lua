local Asdf = require 'Asdf'

describe('Asdf', function()
  local asdf

  local chars = { 'a', 's', 'd', 'f' }

  setup(function()
    asdf = Asdf()
  end)

  local function given_this_variable_has_been_declared_as_a_string(v, s)
    asdf(string.format('d s %s %s', v, s))
  end

  local when_this_variable_is_declared_as_a_string = given_this_variable_has_been_declared_as_a_string

  local function given_this_variable_has_been_declared_as_a_number(v, n)
    asdf(string.format('d d %s %s', v, n))
  end

  local when_this_variable_is_declared_as_a_number = given_this_variable_has_been_declared_as_a_number

  local function given_this_variable_has_been_declared_as_an_array(array, value_type, value)
    asdf(string.format('d a %s %s %s', array, value_type, value))
  end

  local when_this_variable_is_declared_as_an_array = given_this_variable_has_been_declared_as_an_array

  local function when_these_numbers_are_added(a, b, c)
    asdf(string.format('a %s %s %s', a, b, c))
  end

  local function when_these_numbers_are_subtracted(a, b, c)
    asdf(string.format('s %s %s %s', a, b, c))
  end

  -- local function when_these_strings_are_appended(a, b)
  --   asdf(string.format('s %s %s', a, b))
  -- end

  local function when_this_string_is_spliced(a, b, c)
    asdf(string.format('s %s %s %s', a, b, c))
  end

  local function the_value_of_this_variable_should_be(v, expected)
    assert.are.same(expected, asdf(v))
  end

  local function the_value_in_the_array_at_this_index_should_be(array, index, expected)
    assert.are.same(expected, asdf('f %s %s', index, array))
  end

  it('should return any single digit number', function()
    for _, var in pairs(chars) do
      for _, value in pairs(chars) do
        when_this_variable_is_declared_as_a_number(var, value)
        the_value_of_this_variable_should_be(var, value)
      end
    end
  end)

  it('should return numbers with multiple digits', function()
    for _, var in pairs(chars) do
      for _, value in pairs({
        'as',
        'asdf',
        'fdsaasdf'
      }) do
        when_this_variable_is_declared_as_a_number(var, value)
        the_value_of_this_variable_should_be(var, value)
      end
    end
  end)

  it('should add numbers', function()
    given_this_variable_has_been_declared_as_a_number('a', 'a')
    given_this_variable_has_been_declared_as_a_number('s', 's')
    given_this_variable_has_been_declared_as_a_number('d', 'd')

    when_these_numbers_are_added('a', 's', 'd')
    the_value_of_this_variable_should_be('a', 'f')
  end)

  it('should add numbers with multiple digits', function()
    given_this_variable_has_been_declared_as_a_number('a', 'a')
    given_this_variable_has_been_declared_as_a_number('s', 'sdaf') -- 1203 / d99
    given_this_variable_has_been_declared_as_a_number('d', 'fdsa') -- 3210 / d228

    when_these_numbers_are_added('a', 's', 'd')
    the_value_of_this_variable_should_be('a', 'ssasf') -- 11013 / d327
  end)

  it('should subtract numbers', function()
    given_this_variable_has_been_declared_as_a_number('a', 'a')
    given_this_variable_has_been_declared_as_a_number('s', 's')
    given_this_variable_has_been_declared_as_a_number('d', 'd')

    when_these_numbers_are_subtracted('a', 'd', 's')
    the_value_of_this_variable_should_be('a', 's')
  end)

  it('should subtract numbers with multiple digits', function()
    given_this_variable_has_been_declared_as_a_number('a', 'a')
    given_this_variable_has_been_declared_as_a_number('s', 'sadfd') -- 10232 / d302
    given_this_variable_has_been_declared_as_a_number('d', 'dsfa') -- 2130 / d160

    when_these_numbers_are_subtracted('a', 's', 'd')
    the_value_of_this_variable_should_be('a', 'dsad') -- 2102
  end)

  it('should return any string', function()
    for _, var in pairs(chars) do
      for _, value in pairs(chars) do
        when_this_variable_is_declared_as_a_string(var, value)
        the_value_of_this_variable_should_be(var, value)
      end
    end
  end)

  -- it('should append strings', function()
  --   given_this_variable_has_been_declared_as_a_string('a', 's')
  --   given_this_variable_has_been_declared_as_a_string('d', 'f')

  --   when_these_strings_are_appended('a', 'd')
  --   the_value_of_this_variable_should_be('a', 'sf')
  -- end)

  it('should support substrings', function()
    given_this_variable_has_been_declared_as_a_string('asdf', 'asdf')
    given_this_variable_has_been_declared_as_a_number('a', 'a')
    given_this_variable_has_been_declared_as_a_number('s', 's')
    given_this_variable_has_been_declared_as_a_number('f', 'f')

    when_this_string_is_spliced('asdf', 's', 'f')
    the_value_of_this_variable_should_be('asdf', 'sdf')

    when_this_string_is_spliced('asdf', 'a', 's')
    the_value_of_this_variable_should_be('asdf', 'sd')

    when_this_string_is_spliced('asdf', 'a', 'a')
    the_value_of_this_variable_should_be('asdf', 's')
  end)

  it('should initialize an array', function()
    -- when_this_variable_is_declared_as_an_array('a', 's', 'd')
    -- the_value_in_the_array_at_this_index_should_be('a', 's', 'd')
  end)
end)
