require 'date'

class Meetup
  WEEK_LENGTH = 7

  def initialize(month, year)
    @date = Date.new(year, month)
  end

  def day(weekday, schedule)
    @date += 1 until @date.__send__("#{weekday}?")
    update(schedule)
  end

  def update(schedule)
    case schedule
    when :second then @date + WEEK_LENGTH
    when :third  then @date + WEEK_LENGTH * 2
    when :fourth then @date + WEEK_LENGTH * 3
    when :last   then last_weekday_of_month
    when :teenth then teenth_weekday_of_month
    else @date
    end
  end

  def last_weekday_of_month
    new_date = @date + WEEK_LENGTH * 4
    new_date -= WEEK_LENGTH unless new_date.mon == @date.mon
    new_date
  end

  def teenth_weekday_of_month
    @date += WEEK_LENGTH until (13..19).cover?(@date.mday)
    @date
  end
end
