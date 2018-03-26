require 'pry'

class Cipher
  LETTERS = ('a'..'z').to_a

  attr_reader :key

  def initialize(key='a')
    binding.pry
    @key = LETTERS.index(key)
  end

  def encode(message)
    message.chars.map do |char|
      (char.ord + key).chr
    end
  end

  def decode(message)
    message.chars.map { |char| (char.ord - key).chr }
  end
end
