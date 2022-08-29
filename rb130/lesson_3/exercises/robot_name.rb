class Robot
  attr_reader :name
  @@names = []

  def initialize
    @name = generate_name
  end

  def reset
    @name = generate_name
  end

  def generate_name
    loop do
      name = ''
      2.times { name << rand(65..90).chr }
      3.times { name << rand(0..9).to_s }
      @@names << name
      return name if @@names.count(name) == 1
    end
  end
end