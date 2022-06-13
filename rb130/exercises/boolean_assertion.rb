require 'minitest/autorun'

class MyTestSuite < MiniTest::Test
  def test_value
    assert 2.odd?, 'value is not odd'
  end

  def test_downcase
    assert_equal 'xyz', value.downcase
  end
end