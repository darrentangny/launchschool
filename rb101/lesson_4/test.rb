# number_of_pets = {
#   'dogs' => 2,
#   'cats' => 4,
#   'fish' => 1
# }
# pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
# counter = 0

# loop do
#   break if counter == number_of_pets.size
#   current_pet = pets[counter]
#   current_pet_number = number_of_pets[current_pet]
#   puts "I have #{current_pet_number} #{current_pet}!"
#   counter += 1
# end

## Practice problem 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end