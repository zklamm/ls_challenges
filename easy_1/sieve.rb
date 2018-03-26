class Sieve
  def initialize(limit)
    @range = 2..limit
  end

  def primes
    list = {}
    @range.each { |num| list[num] = true }
    @range.each do |num|
      list.each_key do |key|
        list[key] = false if key % num == 0 && key / num != 1
      end
    end
    list.select { |_, value| value }.keys
  end
end
