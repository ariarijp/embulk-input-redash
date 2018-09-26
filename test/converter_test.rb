require 'test_helper'
require 'time'
require 'embulk/input/redash/converter'

Converter = Embulk::Input::Redash::Converter

class ConverterTest < Test::Unit::TestCase
  data(
    'boolean' => [true, :boolean, true],
    'long' => [123, :long, 123],
    'timestamp' => [Time.parse('2018-09-24 20:15:45'),
                    :timestamp,
                    '2018-09-24 20:15:45'],
    'double' => [1.23, :double, 1.23],
    'string' => ['embulk', :string, 'embulk']
  )

  def test_convert(data)
    expected, type, value = data
    assert_equal(expected, Converter.convert(type, value))
  end
end
