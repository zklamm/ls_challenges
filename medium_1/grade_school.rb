class School
  attr_reader :roster

  def initialize
    @roster = Hash.new { |roster, level| roster[level] = [] }
  end

  def to_h
    roster.each_value(&:sort!).sort.to_h
  end

  def add(name, level)
    roster[level] << name
  end

  def grade(level)
    roster[level]
  end
end
