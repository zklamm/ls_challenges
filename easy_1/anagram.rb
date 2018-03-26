# Write a program that, given a word and a list of possible anagrams, selects
# the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists"
# "google" "inlets" "banana" the program should return a list containing
# "inlets". Please read the test suite for exact rules of anagrams.

class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select { |candidate| anagram?(candidate) }
  end

  private

  def anagram?(candidate)
    return false if candidate.downcase == @word.downcase
    comparison_form(@word) == comparison_form(candidate)
  end

  def comparison_form(str)
    str.downcase.chars.sort
  end
end
