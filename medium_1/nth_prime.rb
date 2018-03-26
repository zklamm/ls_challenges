class Prime
  def self.nth(n)
    raise ArgumentError if n == 0
    primes = [2]
    possible = 3
    until primes.size == n
      primes << possible if prime?(possible)
      possible += 2
    end
    primes[n - 1]
  end

  def self.prime?(possible)
    (2..Math.sqrt(possible)).each do |i|
      return false if possible % i == 0
    end
    true
  end
end
