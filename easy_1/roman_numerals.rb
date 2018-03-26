# The Romans were a clever bunch. They conquered most of Europe and ruled it
# for hundreds of years. They invented concrete and straight roads and even
# bikinis. One thing they never discovered though was the number zero. This
# made writing and dating extensive histories of their exploits slightly more
# challenging, but the system of numbers they came up with is still in use
# today. For example the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these
# letters have lots of straight lines and are hence easy to hack into stone
# tablets).

#  1  => I
# 10  => X
#  7  => VII
# There is no need to be able to convert numbers larger than about 3000. (The
# Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each
# digit separately starting with the left most digit and skipping any digit
# with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals 1990
# is MCMXC:

# 1000=M
# 900=CM
# 90=XC
# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII
# See also: http://www.novaroma.org/via_romana/numbers.html

class Integer
  def to_roman
    convert(digits[3], 'M') + convert(digits[2], 'CDM') +
      convert(digits[1], 'XLC') + convert(digits[0], 'IVX')
  end

  private

  def convert(dig, sym)
    case dig
    when 9    then sym[0] + sym[2]
    when 5..8 then sym[1] + sym[0] * (dig - 5)
    when 4    then sym[0] + sym[1]
    when 1..3 then sym[0] * dig
    else           ''
    end
  end
end
