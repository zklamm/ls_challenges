class Fibonacci
  def self.nth(n)
    fibos = [1, 1]
    fibos << fibos[-1] + fibos[-2] until fibos.size == n
    fibos.last
  end
end

p Fibonacci.nth(11)
