# Write a program that will take a decimal number, and convert it to the
# appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary, and
# those who don't. You and your fellow cohort of those in the "know" when it
# comes to binary decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.

# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
# The program should consider strings specifying an invalid binary as the value
# 0.

class SecretHandshake
  def initialize(input)
    @binary = input.class == Integer ? input.to_s(2) : input.to_i.to_s
  end

  def commands
    options = ['wink', 'double blink', 'close your eyes', 'jump']
    handshake = []
    @binary.chars.reverse.each_with_index do |char, idx|
      handshake << options[idx] if char == '1'
      handshake.reverse! if char == '1' && idx == 4
    end
    handshake.compact
  end
end

p SecretHandshake.new(31).commands
