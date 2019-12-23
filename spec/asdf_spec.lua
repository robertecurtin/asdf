local Asdf = require 'Asdf'

describe('asdf', function()
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

  local function when_these_numbers_are_added(a, b, c)
    asdf(string.format('a %s %s %s', a, b, c))
  end

  local function when_these_numbers_are_subtracted(a, b, c)
    asdf(string.format('s %s %s %s', a, b, c))
  end

  local function when_these_strings_are_appended(a, b)
    asdf(string.format('s %s %s', a, b))
  end

  local function the_value_of_this_variable_should_be(v, expected)
    assert.are.same(expected, asdf(v))
  end

  it('should return any string', function()
    for _, var in pairs(chars) do
      for _, value in pairs(chars) do
        when_this_variable_is_declared_as_a_string(var, value)
        the_value_of_this_variable_should_be(var, value)
      end
    end
  end)

  -- it('should append strings', function()
  --   given_this_variable_is_set_to_a_string('a', 's')
  --   given_this_variable_is_set_to_a_string('d', 'f')
  --   when_these_strings_are_appended('a', 'd')
  --   the_value_of_this_variable_should_be('a', 'sf')
  -- end)

  it('should return any number', function()
    for _, var in pairs(chars) do
      for _, value in pairs(chars) do
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

  it('should add numbers', function()
    given_this_variable_has_been_declared_as_a_number('a', 'a')
    given_this_variable_has_been_declared_as_a_number('s', 's')
    given_this_variable_has_been_declared_as_a_number('d', 'd')

    when_these_numbers_are_subtracted('a', 'd', 's')
    the_value_of_this_variable_should_be('a', 's')
  end)
end)
