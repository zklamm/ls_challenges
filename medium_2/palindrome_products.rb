# Write a program that can detect palindrome products in a given range.

# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers (range 10 ~ 99) is 9009 = 91 x 99.
require 'pry'
class Palindromes
  attr_reader :max_factor, :products
  attr_accessor :palindromes

  def initialize(options)
    @max_factor = options[:max_factor]
    nums = (1..max_factor).to_a
    @products = nums.product(nums).map { |product| product.reduce(:*) }
    @palindromes = []
  end

  def generate
    products.each do |product|
      palindromes << product if product.to_s == product.to_s.reverse
    end
    palindromes
  end

  def largest
    palindromes.max
  end

  def value
    largest
  end

  def factors
    
  end
end
