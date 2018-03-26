class PhoneNumber
  def initialize(digits)
    @letters = digits.match(/[a-z]/i)
    @digits = digits.scan(/[01]?\d/).join
    @digits = @digits[1..-1] if @digits.size == 11 && @digits.start_with?('1')
  end

  def number
    return '0000000000' if @digits.size != 10 || @letters
    @digits
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end
