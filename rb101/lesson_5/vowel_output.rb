hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = ['a','e','i','o','u']
vowel_number = []

hsh.each do |_,v|
  v.each do |word|
    word.chars.each do |letter|
      puts letter if vowels.include?(letter)
      vowel_number << letter if vowels.include?(letter)
    end
  end
end

puts "The vowel count is #{vowel_number.size}"