# Write a program that can calculate the Hamming difference between two DNA
# strands.

# A mutation is simply a mistake that occurs during the creation or copying of
# a nucleic acid, in particular DNA. Because nucleic acids are vital to
# cellular functions, mutations tend to cause a ripple effect throughout the
# cell. Although mutations are technically mistakes, a very rare mutation may
# equip the cell with a beneficial attribute. In fact, the macro effects of
# evolution are attributable by the accumulated result of beneficial
# microscopic mutations over many generations.

# The simplest and most common type of nucleic acid mutation is a point
# mutation, which replaces one base with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands
# taken from different genomes with a common ancestor, we get a measure of the
# minimum number of point mutations that could have occurred on the
# evolutionary path between the two strands.

# This is called the 'Hamming distance'

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you
# have two sequences of unequal length, you should compute the Hamming distance
# over the shorter length.

# assume all strings will be uppercase, and chars will be ether 'G' 'A' 'T' 'C'

class DNA
  def initialize(strand)
    @original_strand = strand
  end

  # if other strand is larger, cut it down to match original size
  # if original is longer, cut it down to match other size
  # store each of these updated sizes into new variables

  def hamming_distance(other_strand)
    distance = 0
    ending_idx = [@original_strand.size, other_strand.size].min
    (0...ending_idx).each do |idx|
      distance += 1 if @original_strand[idx] != other_strand[idx]
    end
    distance
  end
end

strand = DNA.new('GCATGCATTACG')
p strand.hamming_distance('GATCGATGGATGTAG')
