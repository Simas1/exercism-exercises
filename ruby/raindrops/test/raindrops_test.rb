require_relative '../raindrops'
require 'minitest/autorun'

class RaindropsTest < Minitest::Test
  def test_1
    assert_equal '1', Raindrops.convert(1)
  end
  def test_3
    assert_equal 'Pling', Raindrops.convert(3)
  end
  def test_5
    assert_equal 'Plang', Raindrops.convert(5)
  end
  def test_vocabulary
    vocabulary = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
    }
    assert_equal vocabulary, Raindrops::VOCABULARY
  end
end
