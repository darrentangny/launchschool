# class TextAnalyzer
#   def process
#     text = File.new("sandwich_code.txt").read
#     yield text
#   end
# end

# a = TextAnalyzer.new
# a.process { |text| puts text }

# Launch School Solution

class TextAnalyzer
  def process
    file = File.open("sandwich_code.txt")
    yield file.read
    file.close
  end
end

a = TextAnalyzer.new
a.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
a.process { |text| puts "#{text.split("\n").count} lines" }
a.process { |text| puts "#{text.split.count} words" }