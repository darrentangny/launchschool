## Practice problem 1

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end

## Problem 2

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# total = 0
# ages.each do |key, value|
#   total += value
# end
# p total

## Problem 3

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.keep_if do |key, value|
#   value < 100
# end

# p ages

## Problem 4

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# min_age = 9999
# ages.values.each do |age|
#   if age < min_age
#     min_age = age
#   end
# end

# p min_age

# A much better solution was theirs: ages.values.min

## Problem 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

goal_name = []
flintstones.each do |name|
  if name[0..1] == 'Be'
    goal_name << name
  end
end
p goal_name

p flintstones.index { |name| name[0,2] == 'Be' }