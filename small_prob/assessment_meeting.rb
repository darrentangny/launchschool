=begin
# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20
=end


# Explicit rules:
# -given an integer N, find the number of integers less than or equal to N that are odd but NOT prime.
# -N is between 1 and 10000
# -prime numbers are numbers that are only divisible by itself and 1, and start from 2,3,5,7,11,13...

# Data structure:
# Input:
# integer
# Output:
# integer

# Algorithm:
# -Initialize `numbers_arr` as an empty array, it will contain all numbers from 1 up to X.
# -Loop through a range from (1..X), and append to `numbers_arr` each number.
# -Iterate through `numbers_arr`, selecting only numbers that are odd, and not prime.
# -Return the count of `numbers_arr.

# def odd_not_prime(int)
#   numbers_arr = []
#   (1..int).each do |n|
#     numbers_arr << n
#   end
#   counter = 0
#   while counter < numbers_arr.size
#     if numbers_arr[counter].odd? && numbers_arr[counter] % 2
#       numbers_arr.delete(counter)
#     end
#     counter += 1
#   end
#   numbers_arr.size
# end




=begin
# Problem:
  -Establish the *quantity* of numbers greater than 0 but <= "x" that are odd AND not prime.
# Examples:
  p odd_not_prime(15) == 3
  p odd_not_prime(48) == 10
  p odd_not_prime(82) == 20
# Data structures:
  -We will be inputting an integer, and expecting an integer as output.
  -We may be adding qualifying numbers to an array for later counting
# Algo:
  -Consider (iterating/looping) each number > 0 but <= x in turn
    -Test whether it is odd
    -Test whether it is prime
  -If it odd and not prime add it to an array
  -After iteration, count the elements in the array and output the number of 
    elements as our answer 
# Code:
  ?? what is this section again ??
=end

def prime?(num)
  return false if num == 1
  2.upto(num - 1) do |current_num|
    return false if num % current_num == 0
  end
  true
end

def isnt_prime?(int_in)
  (2..int_in-1).to_a.select { |e| int_in % e == 0 }.size > 0
end

def odd_not_prime(int_in)
  output = []
  (1..int_in).to_a.each do |n|
    output << n if (( n.odd? && isnt_prime?(n) ) || n == 1)
    end
  output.size
end

p odd_not_prime(15) #== 3
p odd_not_prime(48) #== 10
p odd_not_prime(82) #== 20

# insufficient algo detail vis prime determination
# implementation discluded '1's ?

=begin
# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'

************************
Problem: take a string, compare individual words to 
one another, scoring them based on character. Return
highest score, or earliest appearing word in even of tie

Example: method('abc def') == 'def'
method('abc def fed') == 'def'

Data structure: will use hash structure for scores. 
ASCII numbers would come in handy, but don't recall how to access these.
Will use array to iterate through individual words for scoring.

Algorithm: will split string into array structure and iterate through these. each word will be broken down into individual letters via #chars and score will be tallied. will be stored as winning variable if greater than (not equal to) current winning variable.

=end

LETTERS = { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9, j: 10, k: 11, l: 12, m: 13, n: 14, o: 15, p: 16, q: 17, r: 18, s: 19, t: 20, u: 21, v: 22, w: 23, x: 24, y: 25, z: 26 }

def alphabet_score(str)
  winner = ''
  str.split.each do |word|
    if word_score(word) > word_score(winner)
      winner = word
    end
  end
  winner
end
    
def word_score(word)
  sum = 0
  word.chars.each do |char|
    sum += LETTERS[char.to_sym]
  end
  sum
end






