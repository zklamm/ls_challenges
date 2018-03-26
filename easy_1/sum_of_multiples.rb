# Write a program that, given a number, can find the sum of all the multiples
# of particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are
# multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of
# these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of
# numbers. If no set of numbers is given, default to 3 and 5.

class SumOfMultiples
  def self.to(target, nums=[3, 5])
    multiples = []
    (1...target).each do |i|
      nums.each { |num| multiples << i if i % num == 0 }
    end
    multiples.uniq.sum
  end

  def initialize(*nums)
    @nums = nums
  end

  def to(target)
    class.to(target, @nums)
  end
end


p SumOfMultiples.new(4, 5, 7).to(20)
p SumOfMultiples.to(20)
