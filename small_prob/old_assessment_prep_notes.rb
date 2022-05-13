# class GoodDog
# 	def initialize(name)
# 		@name = name
# 	end
	
# 	def name
# 		@name
# 	end

# 	def name=(n)
# 		@name = n
# 	end

# 	def speak
# 		"#{@name} says arf!"
# 	end
# end

# Refactoring of above with shortcuts:

# class GoodDog
# 	attr_accessor :name

# 	def initialize(name)
# 		@name = name
# 	end

# 	def speak
# 		"#{name} says arf!"
# 	end
# end

# sparky = GoodDog.new('Sparky')
# p sparky.speak

# fido = GoodDog.new('Fido')
# p fido.speak
# p fido.name

# fido.name = ("Spartacus")
# p fido.name

# module Speak
# 	def speak(str)
# 		puts str
# 	end
# end

# class GoodDog
# 	include Speak
# end

# sparky = GoodDog.new

# sparky.speak "ruff"


# def anagrams(word, array)
# 	array.select do |el|
# 		el.chars.sort == word.chars.sort
# 	end
# end

# p anagrams('a', ['a','b','c'])

# def power(num1, num2)
# 	return nil if num2 < 0
# 	num = num1
# 	case num2
# 	when 0 ; return 1
# 	when 1 ; return num1
# 	else ; (num2 - 1).times { num = num1 * num }
# 	end
# 	num
# end

# def power(base, exponent)
# 	exponent.negative? ? nil : exponent.zero? ? 1 : base * power(base, exponent - 1)
# end

# def power(b, e)
# 	([b]*e).inject(1, :*) if e >= 0
# end

# p power(10, 0) == 1
# p power(-5, 3) == -125
# p power(-4, 2) == 16
# p power(10, 0) == 1
# p power(2, 3) == 8
# p power(3, 2) == 9
# p power(-5, 3) == -125
# p power(-4, 2) == 16
# p power(8, -2) == nil

# def solution(arr1, arr2)
# 	arr1.map.with_index { |n, i| (n - arr2[i]).abs ** 2 }.sum.fdiv(arr1.count)
# end

# p solution([1, 2, 3], [4, 5, 6]) == 9
# p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
# p solution([-1, 0], [0, -1]) == 1

# def cakes(recipe, ingredients)
# 	recipe.map do |k,v| 
# 		if ingredients.key?(k) == false
# 			return 0
# 		else
# 			(ingredients[k] / recipe[k])
# 		end
#   end.min
# end

# def cakes(recipe, available)
# 	recipe.map { |k,v| available[k].to_i / v }.min
# end

# p cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200})
# p cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000})


# def generateHashtag(str)
# 	return false unless str.chars.any? /[a-z]/i
# 	str = str.squeeze(' ')
# 	str[0] == ' ' ? str = str[1..-1] : nil
# 	return false if str.split.map { |word| word.capitalize }.join.prepend('#').length > 140
# 	str.split.map { |word| word.capitalize }.join.prepend('#')
# end

# def generateHashtag(str)
# 	str = '#' << str.split.map(&:capitalize).join
# 	str.size <= 140 && str.size > 1 ? str : false
# end

# p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat")
# p generateHashtag("Do We have A Hashtag")


# def longest(str)
# 	str.chars.slice_when { |a, b| a > b }
# 		.max_by(&:size)
# 		.join
# end

# def longest(str)
# 	('a'..'z').to_a.join('*') + '*'
	
# def scramble(s1, s2)
# 	s1.chars.uniq.all? { |x| s2.count(x) <= s1.count(x) }
# end

# def scramble(s1, s2)
# 	hsh = Hash.new(0)
# 	s2.chars.each { |char| hsh[char] += 1 }
# 	s2.chars.uniq.each { |char| return false if s1.count(char) < hsh[char] }
# 	true
# end

# p scramble('rkqodlw', 'world')
# p scramble('cedewaraaossoqqyt', 'codewars')
# p scramble('katas', 'steak')


# def mindLocation(field)
# 	field.each_with_index { |x, i| return i, x.index(1) if x.include?(1) }
# end

# def mineLocation(field)
# 	result = []
# 	field.each_with_index do |row, idx|
# 		if row.include?(1)
# 			result << idx
# 			field[idx].each_with_index do |column, idx|
# 				if column == 1
# 					result << idx
# 				end
# 			end
# 		end
# 	end
# 	result
# end

# p mineLocation([ [1, 0], [0, 0] ])
# p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ])
# p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ])

# def get_char_count(str)
#   hsh = Hash.new(0)
#   str.chars.each do |char|
#     if char.match? /[a-z0-9]/i
#       hsh[char.downcase] += 1
#     end
#   end
#   result = Hash.new([])
#   hsh.each do |k, v|
#     result[v] += [k]
#   end
#   result.each { |k, v| v.sort!}
#   result
# end

# def get_char_count(str)
#   arr = str.scan(/[a-z\d]/i)
#   arr.uniq.sort.group_by { |el| arr.count(el) }
# end

# p get_char_count('Mississippi')
# get_char_count("Hello. Hello? HELLO!!")

# def title_case(title, minor_words = '')
#   title.capitalize.split.map do |word|
#     minor_words.downcase.split.include?(word) ? word : word.capitalize
#   end.join(' ')
# end

# def title_case(str, minor_words = '')
#   return '' if str == '' # because of their first test case
#   arr = str.split
#   minor = minor_words.split
#   minor.empty? ? nil : minor = minor_words.split.map(&:downcase)
#   result = []
#   result << arr[0].capitalize
#   arr[1..-1].each do |word|
#     if minor.include? word.downcase
#       result << word.downcase
#     else
#       result << word.capitalize
#     end
#   end
#   result.join(' ')
# end


# p title_case('', '')
# p title_case('a clash of KINGS', 'a an the of')
# p title_case('THE WIND IN THE WILLOWS', 'The In')
# p title_case('the quick brown fox')


# def persistence(num, iteration = 0)
#   return iterations if n < 10

#   persistence(n.digits.inject(:*), iterations + 1)
# end 

# very nice, i love it. not mine. remember this for recursion.

# def persistence(num)
#   counter = 0
#   result = num
#   loop do
#     break if result.to_s.length < 2
#     result = helper(result)
#     counter += 1
#   end
#   counter
# end

# def helper(num)
#   arr = num.to_s.chars.map(&:to_i)
#   result = arr.inject do |product, num|
#     product * num
#   end
# end

# p persistence 999


# def fields(str)
#   str.split(/[ \t,]+/)
# end

# def url?(url_str)
#   url_str.match?(/\Ahttps?:\/\/\S+\z/)
# end

# EACH OF THE BELOW ARE MY OWN SOLUTION A DAY OR TWO APART

# def expanded_form(num)
#   num = num
#   result = []
#   until num == 0
#     placeholder, rem = num.divmod(10)
#     if rem != 0
#       num = placeholder
#       result.prepend(rem)
#     end
#   end
#   result.join(' + ')
# end

# def expanded_form(num)
#   arr = []
#   num.to_s.reverse.chars.each_with_index do |char, idx| #see digits method below
#     if char == '0'
#       next
#     else
#       arr.prepend((char.to_i) * (10 ** idx))
#     end
#   end
#   str = ''
#   arr[0...-1].each { |num| str << "#{num} + " }
#   str + "#{arr.last}"
# end

# def expanded_form(num)
#   arr = []
#   num.digits.each_with_index do |num, idx|
#     if char == 0
#       next
#     else
#       arr.prepend((num) * (10 ** idx))
#     end
#   end
#   str = ''
#   arr[0...-1].each { |num| str << "#{num} + " }
#   str + "#{arr.last}"
# end

# p expanded_form(70304)



# def spin_words(str)
#   str.split.map do |word|
#     if word.length > 4
#       word.reverse
#     else
#       word
#     end
#   end.join(' ')
# end

# p spin_words('Welcome')
# p spin_words('Hey fellow warriors')


# def is_valid_walk(walk)
#   y_axis = 0
#   x_axis = 0
#   walk.each do |direction|
#     case direction
#     when 'n'
#       y_axis += 1
#     when 's'
#       y_axis -= 1
#     when 'w'
#       x_axis -= 1
#     when 'e'
#       x_axis += 1
#     end
#   end
#   walk.count == 10 && x_axis == 0 && y_axis == 0
# end

# def is_valid_walk(walk)
#   walk.count('w') == walk.count('e') and
#   walk.count('n') == walk.count('s') and
#   walk.count == 10
# end

# is_valid_walk(['n','s','n','s','n','s','n','s','n','s'])
# !is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e'])
# !is_valid_walk(['w'])
# !is_valid_walk(['n','n','n','s','n','s','n','s','n','s'])


# def kebabize(str)
#   string = ''
#   str.chars.each do |char|
#     if char.match? /[a-z]/
#       string << char
#     elsif char.match?(/[A-Z]/) && string.empty?
#       string << char.downcase
#     elsif char.match /[A-Z]/
#       string << '-' << char.downcase
#     else
#       next
#     end
#   end
#   string
# end

# 'HiThereGuy'.split(/(?=[A-Z])/) # => ['Hi', 'There', 'Guy']


# def pangram?(str)
#   counter = 0
#   string = str.chars.map { |char| char.downcase }
#   ('a'..'z').each do |alphabet|
#     if string.include? alphabet
#       counter += 1
#     else
#       next
#     end
#   end
#   counter == 26 ? true : false
# end

# def pangram(str)
#   ('a'..'z').all? { |x| str.include? x }
# end

# def pangram(str)
#   str.downcase.scan(/[a-z]/).uniq.count == 26
# end

# p pangram?("The quick brown fox jumped over the lazy dog.")


# sort out all letters into separate array
# feed these back into original string, in sequence via gsub or something on
# condition that it must be replacing  a letter


# def scramble_words(str)
#   str.split.map do |word|
#     arr = []
#     result = ''
#     if word.length <= 2
#       result << word
#     else
#       chars = word.chars
#       chars[1..-2].each do |char|
#         if char.match? /[a-z]/i
#           arr << char
#         else
#           next
#         end
#       end
#       arr.sort!
#       if chars[0].match? /[a-z]/i
#         arr.prepend(chars[0])
#       end
#       if chars[-1].match? /[a-z]/i
#         arr << chars[-1]
#       end
#       word.chars.each do |char|
#         if char.match? /[a-z]/i
#           result << arr.shift
#         else
#           result << char
#         end
#       end
#     end
#     result
#   end.join(' ').to_s
# end

# p scramble_words('dcba')

# take string, obtain length, find factors, iterate through these with initial
# lines of string, and multiply these and compare if equal to original string
# while counting number of multiplications performed

# def f(str)
#   factors = factors(str.length)
#   strings = []
#   factors.each do |factor|
#     1.upto(str.length / factor) do |num|
#       variable = str.slice(0, factor) * num
#       if variable == str
#         return [str.slice(0, factor), num]
#       end
#     end
#   end
# end


# def factors(num)
#   arr = []
#   1.upto(num) { |number| num % number == 0 ? arr << number : nil }
#   arr
# end

# def solve(str)
#   arr = []
#   length = str.length
#   steps = 0 # number of times to shift forward with slice method
#   loop do
#     0.upto(steps) do |step|
#       arr << str.slice(step, length).to_i
#     end
#     steps += 1
#     length -= 1
#     break if length == 0
#   end
#   arr.select { |num| num.odd? }.count
# end

# p solve('1341')


# # alternative solution, like the use of first and last

# def solve(s) 
#   substring_array = []
#   (0..s.length-1).each do |first|
#     (first..s.length-1).each do |last|
#       substring_array << s[first..last] if s[first..last].to_i.odd?
#     end
#   end
#   substring_array.count
# end
      

# def solve(num_str)

#   arr = []
#   arr << num_str.chars
#   loop do
#     counter = arr[0].count - 1
#     num_position = 1
#     if arr.first == arr.last && arr.count > 1
#       arr.pop
#       break
#     end
#     until counter == 0
#       arr << arr.last.clone
#       arr[-1][-num_position], arr[-1][-num_position -1], = arr[-1]\
#       [-num_position - 1], arr[-1][-num_position]
#       num_position += 1
#       counter -= 1
#     end
#   end
#   arr.uniq.map { |sub_arr| sub_arr.join.to_i }.select { |num| num.odd? }.count
# end

# p solve('1341')
#eureka! does all permutations, unfortunately, not what was asked for

=begin
# create nested arrays by breaking up initial number into chars
then find size, use as a counter
another counter to keep track of current number being moved from end to beginning
keep swapping pieces until it reaches end.
reset counters and repeat until array matches first one in nested collection

# [ nested arrays ].map { |arr| .join.to_i }.select { |num| num.odd? }

# problem, how to mess around with substrings without mutating the orignal
# how could i make an actual bonafide copy of the substring and store that somewhere
    so I don't have to worry about this?
=end
