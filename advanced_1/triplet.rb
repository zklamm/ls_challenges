class Triplet
  def self.where(sum: nil, min_factor: 1, max_factor: 1)
    combos = (min_factor..max_factor).to_a.combination(3).to_a
    combos.select! { |combo| combo.sum == sum } if sum
    combos.map { |combo| new(*combo) }.select(&:pythagorean?)
  end

  def initialize(*nums)
    @nums = *nums
  end

  def sum
    @nums.sum
  end

  def product
    @nums.reduce(:*)
  end

  def pythagorean?
    @nums[0]**2 + @nums[1]**2 == @nums[2]**2
  end
end
