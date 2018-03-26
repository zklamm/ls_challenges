# Write a program that can generate the lyrics of the 99 bottle bear song. See
# the test suite for the entire song.

class Pass
  attr_reader :pass

  def initialize(i)
    @pass = case i
            when 0 then zeroth_verse
            when 1 then first_verse
            when 2 then second_verse
            else        normal_verse(i)
            end
  end

  private

  def zeroth_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def first_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def second_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def normal_verse(i)
    "#{i} bottles of beer on the wall, #{i} bottles of beer.\n" \
    "Take one down and pass it around, #{i - 1} bottles of beer on the wall.\n"
  end

  def to_s
    @pass
  end
end

class BeerSong
  def initialize
    @song = []
    0.upto(99) { |i| @song << Pass.new(i) }
    @song
  end

  def verse(start)
    @song[start].pass
  end

  def verses(start, finish)
    (finish..start).map { |i| @song[i].pass }.reverse.join("\n")
  end

  def lyrics
    @song.reverse.join("\n")
  end
end

puts BeerSong.new.verses(99,98)
