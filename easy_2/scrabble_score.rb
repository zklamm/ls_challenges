# Write a program that, given a word, computes the scrabble score for that word.

# Letter Values
# You'll need these:

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

# Examples

# "cabbage" should be scored as worth 14 points:

# 3 points for C
# 1 point for A, twice
# 3 points for B, twice
# 2 points for G
# 1 point for E
# And to total:

# 3 + 2*1 + 2*3 + 2 + 1
# = 3 + 2 + 6 + 3
# = 5 + 9
# = 14

# input: str composed of eng letters
# output: int, which is scrabble score representation of input
# assumption: case insensitive
# logic: validate input by checking to see if all chars are a letter
#       use a hash to store scrabble score values to each letter key
#   iterate through word, adding score of each letter to total..return total

class Scrabble
  VALUES = [
    1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3,
    1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10
  ]
  SCORES = ('A'..'Z').to_a.zip(VALUES).to_h.freeze

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word.nil? ? '' : word.upcase.strip
  end

  def score
    @word.each_char.reduce(0) { |sum, char| sum + SCORES[char] }
  end
end
