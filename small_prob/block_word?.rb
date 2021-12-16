# SPELLING_BLOCKS = {
#   'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A', 'G' => 'T',
#   'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U', 'V' => 'I', 'L' => 'Y',
#   'Z' => 'M'
# }
SPELLING_BLOCKS = %w(B O X K D Q C P N A G T R E F S J W H U V I L Y Z M)

def block_word?(str)
  forbidden_chars = []
  str.chars.each do |char|
    if SPELLING_BLOCKS.any?(char)
      if SPELLING_BLOCKS.index(char).even?
        forbidden_chars << SPELLING_BLOCKS[SPELLING_BLOCKS.index(char) + 1]
      else
        forbidden_chars << SPELLING_BLOCKS[SPELLING_BLOCKS.index(char) - 1]
      end
    end
    return false if forbidden_chars.any?(char)
  end
  return true
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true