# Comment
class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = !multiples.empty? ? multiples : [3, 5]
  end

  def to(num)
    multiples.each_with_object([]) do |mult, obj|
      (1...num).each { |number| obj << number if (number % mult).zero? }
    end.uniq.sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end
end
