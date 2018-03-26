# Pig Latin is a made-up children's language that's intended to be confusing.
# It obeys a few simple rules (below), but when it's spoken quickly it's really
# difficult for non-children (and non-native speakers) to understand.

# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of
# the word.
# Rule 2: If a word begins with a consonant sound, move it to the end of the
# word, and then add an "ay" sound to the end of the word.
# There are a few more rules for edge cases, and there are regional variants
# too.

# class PigLatin
#   VOWELS = %w[a e i o u xr yt]
#   EDGE_CASES = %w[qu squ]
#   SUFFIX = 'ay'

#   def self.translate(words)
#     pig_words = words.split.map do |word|
#       start = starting_sound(word)
#       word[start.size..-1] + start + SUFFIX
#     end
#     pig_words.join(' ')
#   end

#   def self.starting_sound(word)
#     word.chars.each_with_object('') do |char, move_these|
#       move_these << char
#       return move_these[0..-2] if vowel?(char) && !edge?(move_these)
#       return ''                if VOWELS.include?(move_these)
#     end
#   end

#   def self.vowel?(char)
#     VOWELS.include?(char)
#   end

#   def self.edge?(chars)
#     EDGE_CASES.include?(chars)
#   end
# end

class PigLatin
  def self.translate(phrase)
    phrase.split.map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    word = move_consonant_sound(word) unless starts_with_vowel_sound?(word)
    word + 'ay'
  end

  def self.starts_with_vowel_sound?(word)
    word.match(/\A[aeiou]|[xy][^aeiou]/)
  end

  def self.move_consonant_sound(word)
    pattern = word.match(/\A([^aeiou]*qu|[^aeiou]+)(.*)/)
    pattern[2] + pattern[1]
  end
end
