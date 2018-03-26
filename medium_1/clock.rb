class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = hour % HOURS_PER_DAY
    @minute = minute
    update_time if minute < 0
  end

  def +(minutes)
    @hour += minutes / MINUTES_PER_HOUR
    @minute += minutes % MINUTES_PER_HOUR
    Clock.new(@hour, @minute)
  end

  def -(minutes)
    self.+(-minutes)
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    format('%.2d:%.2d', @hour, @minute)
  end

  private

  def update_time
    @hour -= 1
    @minute += MINUTES_PER_HOUR
  end
end
