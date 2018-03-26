class Series
  def initialize(str)
    @ints = str.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError, 'Slice is too large' if n > @ints.size
    @ints.each_cons(n).to_a
  end
end
