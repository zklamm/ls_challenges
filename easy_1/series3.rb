class Series
  def initialize(str)
    @digits = str.chars.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError if @digits.size < num
    @digits.each_cons(num).to_a
  end
end
