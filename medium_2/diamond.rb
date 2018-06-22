require 'pry'

class Diamond
  LETTERS = ('A'..'Z').to_a

  def self.make_diamond(letter)
    new(letter)
  end

  def initialize(letter)
    return letter + "\n" if letter == 'A'
    @width = 2 * (LETTERS.index(letter)) + 1
    diamond = top(letter) + middle(letter) + top(letter).reverse
    diamond.join("\n") + "\n"
  end

  def top(letter)
    number_of_rows = LETTERS.index(letter)
    current_letter = 'A'
    rows = [current_letter.center(@width)]
    spaces = 1
    (number_of_rows - 1).times do |variable|
      current_letter = current_letter.next
      rows << ((current_letter + ' ' * spaces + current_letter).center(@width))
      spaces += 2
    end
    rows
  end

  def middle(letter)
    [letter + ' ' * (@width - 2) + letter]
  end
end
