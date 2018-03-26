# def odd_words(str)
#   words = str[0..-2].split
#   new_sentence = []
#   words.each_with_index do |word, idx|
#     new_sentence << (idx.odd? ? word.reverse : word)
#   end
#   new_sentence.join(' ') + '.'
# end

# This solution processes per character, appeasing the bonus challenge
def odd_words(sentence)
  words = sentence[0..-2].split
  new_sentence = []
  words.each_with_index do |word, idx|
    new_word = []
    word.chars.each do |char|
      idx.odd? ? new_word.unshift(char) : new_word.push(char)
    end
    new_sentence << new_word.join
  end
  new_sentence.join(' ') + '.'
end

p odd_words("whats the matter with kansas.")
