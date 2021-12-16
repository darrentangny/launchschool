def double_consonants(str)
  string = ''
  str.each_char do |char|
    if char.match?(/[A-Za-z&&[^aeiouAEIOU]]/)
      string << char * 2
    else
      string << char
    end
  end
  string
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

# CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
CONSONANTS = ('a'..'z').reject |chr| "aeiou".include?(chr) }

def double_consonants(str)
  result = ''
  str.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end