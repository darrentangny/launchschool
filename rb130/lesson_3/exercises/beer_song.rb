# class BeerSong
#   def self.verse(line, range = nil)
#     line_number = line
#     result = ''
#     loop do
#       if range == nil
#         result << "#{line_1(line_number)}#{line_2(line_number)}"
#         break
#       elsif line_number < range
#         break
#       else
#         result << "#{line_1(line_number)}#{line_2(line_number)}\n"
#         line_number -= 1
#       end
#       break if line < range
#     end
#     result
#   end

#   def self.lyrics
#     BeerSong.verse(99, 0)
#   end

#   def self.verses(line, range = nil)
#     BeerSong.verse(line, range)
#   end

#   private

#   def self.line_1(line)
#     case line
#     when 0
#       "No more bottles of beer on the wall, no more bottles of beer.\n"
#     when 1
#       "1 bottle of beer on the wall, 1 bottle of beer.\n"
#     else
#       "#{line} bottles of beer on the wall, #{line} bottles of beer.\n"
#     end
#   end

#   def self.line_2(line)
#     case line
#     when 0
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     when 1
#       "Take it down and pass it around, no more bottles of beer on the wall.\n"
#     when 2
#       "Take one down and pass it around, 1 bottle of beer on the "\
#       "wall.\n"
#     else
#       "Take one down and pass it around, #{line - 1} bottles of beer on the "\
#       "wall.\n"
#     end
#   end
# end

# LS
class Verse
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def single_verse
    case bottles
    when 0
      zero_bottle_verse
    when 1
      single_bottle_verse
    when 2
      two_bottle_verse
    else
      default_verse
    end
  end

  private

  def default_verse
    "#{bottles} bottles of beer on the wall, #{bottles}" +
    " bottles of beer.\nTake one down and pass it around, " +
    "#{bottles-1} bottles of beer on the wall.\n"
  end

  def two_bottle_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer " +
    "on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer " +
    "on the wall.\n"
  end

  def zero_bottle_verse
    "No more bottles of beer on the wall, no more bottles " +
    "of beer.\nGo to the store and buy some more, 99 bottles " +
    "of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(number)
    Verse.new(number).single_verse
  end

  def self.verses(start, stop)
    current_verse = start
    result = []

    while current_verse >= stop
      result << "#{verse(current_verse)}"
      current_verse -= 1
    end

    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end

puts BeerSong.verses(99, 98)