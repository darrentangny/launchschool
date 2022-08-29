# Comment
class PerfectNumber
  def self.classify(number)
    raise StandardError unless number > 0

    @divisors = []
    1.upto(number - 1) do |iterator|
      @divisors << iterator if (number % iterator).zero?
    end
    if @divisors.sum == number
      'perfect'
    elsif @divisors.sum < number
      'deficient'
    else
      'abundant'
    end
  end
end
