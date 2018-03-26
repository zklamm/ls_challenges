class Index
  attr_accessor :index

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @index = 0
  end

  def increment
    index + 1 == @buffer_size ? self.index = 0 : self.index += 1
  end
end

class CircularBuffer
  class BufferEmptyException < RuntimeError; end
  class BufferFullException < RuntimeError; end

  attr_accessor :current, :oldest
  attr_reader :buffer

  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
    @oldest = Index.new(buffer_size)
    @current = Index.new(buffer_size)
  end

  def read
    raise BufferEmptyException if buffer.all?(&:nil?)
    return_value = buffer[oldest.index]
    buffer[oldest.index] = nil
    oldest.increment
    return_value
  end

  def write(elem)
    return if elem.nil?
    raise BufferFullException if buffer.none?(&:nil?)
    buffer[current.index] = elem
    current.increment
  end

  def write!(elem)
    return if elem.nil?
    return write(elem) unless buffer.none?(&:nil?)
    buffer[oldest.index] = elem
    oldest.increment
    current.increment
  end

  def clear
    buffer.map! { nil }
  end
end
