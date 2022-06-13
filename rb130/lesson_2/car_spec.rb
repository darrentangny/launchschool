require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    _(car.wheels).must_equal 4      # this it the expectation
  end
end

# The above more closely resembles RSpec syntax
