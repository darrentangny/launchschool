## Program takes out all 'g' characters from string--example of selection

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# selected_chars = ''
# counter = 0

# loop do
#   current_char = alphabet[counter]

#   if current_char == 'g'
#     selected_chars << current_char # appends current_char into the selected_chars string
#   end

#   counter += 1
#   break if counter == alphabet.size
# end

# p selected_chars # => "g"

## New Program applies above concepts to transformation

# fruits = ['apple', 'banana', 'pear']
# transformed_elements = []
# counter = 0

# loop do
#   current_element = fruits[counter]

#   transformed_elements << current_element + 's' # appends transformed string into array

#   counter += 1
#   break if counter == fruits.size
# end

# p transformed_elements # => ['apples', 'bananas', 'pears']

## New Program to select all vowels in given string

# def select_vowels(str)
#   selected_chars = ''
#   counter = 0

#   loop do
#     current_char = str[counter]

#     if 'aeiouAEIOU'.include?(current_char)
#       selected_chars << current_char
#     end

#     counter += 1
#     break if counter == str.size
#   end

#   selected_chars
# end

# p select_vowels('the quick brown fox')

# sentence = 'I wandered lonely as a cloud'
# p select_vowels(sentence)

# number_of_vowels = select_vowels('hello world').size
# p number_of_vowels

# def select_fruit(produce_list)
#   produce_keys = produce_list.keys
#   counter = 0
#   selected_fruits = {}
  
#   loop do
#     # this has to be at the top in case produce_list is empty hash
#     break if counter == produce_keys.size

#     current_key = produce_keys[counter]
#     current_value = produce_list[current_key]

#     if current_value == 'Fruit'
#       selected_fruits[current_key] = current_value
#     end

#     counter += 1
#   end

#   selected_fruits
# end


# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p select_fruit(produce)

## Transformation code entirely contained in method definition:

# def double_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number == numbers[counter]
#     doubled_numbers << current_number * 2

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]

## Method that multiplies every array item by specified value

# my_numbers = [1,4,3,7,2,6]

# def multiply(array, input)
#   new_array = []
#   array.each do |element|
#     new_array << element * 3
#   end
#   p new_array
# end

# multiply(my_numbers, 3)

## Method that takes a string and returns a new string containing only specified letters

# def select_letter(sentence, character)
#   selected_chars = ''
#   counter = 0

#   loop do
#     break if counter == sentence.size
#     current_char = sentence[counter]

#     if current_char == character
#       selected_chars << current_char
#     end

#     counter += 1
#   end

#   selected_chars
# end

# question = 'How many times does a particular character appear in this sentence?'
# p select_letter(question, 'a')
# p select_letter(question, 'a').size

## The for loop

alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end