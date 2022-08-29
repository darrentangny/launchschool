class DNA
  attr_reader :strand

  def initialize(dna_strand)
    @strand = dna_strand
  end

  def hamming_distance(dna_strand)
    length = [strand, dna_strand].min.size
    idx = 0
    counter = 0
    loop do
      break if idx == length

      if strand[idx] != dna_strand[idx] then counter += 1
      idx += 1
    end
    counter
  end
end