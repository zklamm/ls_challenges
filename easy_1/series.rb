# Write a program that will take a string of digits and give you all the
# possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234
# And the following 4-digit series:

# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you deserve
# whatever you get.

require 'pry'
class Series
  attr_reader :ints, :size

  def initialize(str)
    @ints = str.chars.map(&:to_i)
    @size = str.size
  end

  def slices(n)
    raise ArgumentError if n > size || ints.size != size
    combos = ints.combination(n).to_a
    series = []
    diff = 0
    idx = 0
    (size - n + 1).times do
      series << combos[idx]
      diff += 1
      idx += pascal(n - 1, size - diff)
    end
    series
  end

  private

  def factorial(num=0)
    (1..num).reduce(:*) || 1
  end

  def pascal(n, k)
    factorial(k) / (factorial(n) * factorial(k - n))
  end
end

testing = Series.new('012345')
p testing.slices(4)
