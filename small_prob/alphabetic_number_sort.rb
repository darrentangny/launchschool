WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve 
thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
NUM_WORD_HASH = {}

WORDS.each_with_index do |word, index|
  NUM_WORD_HASH[word] = index
end


def alphabetic_number_sort(int_arr)
  arr = []
  int_arr.map do |num|
    arr << NUM_WORD_HASH.key(num)
  end
  arr.sort!
  arr.map! { |str_num| str_num.replace(NUM_WORD_HASH.values_at(str_num)) }
  # _at(str_num)) }
  # arr.each { |str_num| p NUM_WORD_HASH.values_at(str_num) }
  arr
end

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| WORDS[number] }
end

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]