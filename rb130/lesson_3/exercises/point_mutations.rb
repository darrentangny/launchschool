# class DNA
#   attr_reader :strand_1

#   def initialize(dna_strand)
#     @strand_1 = dna_strand
#   end

#   def hamming_distance(dna_strand)
#     length = [strand_1, dna_strand].min.size
#     idx = 0
#     counter = 0
#     loop do
#       break if idx == length
#       if strand_1[idx] != dna_strand[idx]
#         counter += 1
#       end
#       idx += 1
#     end
#     counter
#   end
# end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    shorter = @strand.length < comparison.length ? @strand: comparison
    differences = 0

    shorter.length.times do |idx|
      differences += 1 unless @strand[idx] == comparison[idx]
    end

    differences
  end
end