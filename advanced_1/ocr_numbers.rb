class OCR
  CIPHER = {
    '1' => '  |  |',   '2' => ' _ _||_',  '3' => ' _ _| _|',
    '4' => '|_|  |',   '5' => ' _|_ _|',  '6' => ' _|_|_|',
    '7' => ' _  |  |', '8' => ' _|_||_|', '9' => ' _|_| _|',
    '0' => ' _| ||_|'
  }

  def initialize(text)
    @multi_lines = text.split(/\n\n/)
    @pieces = []
    text.lines.each { |line| @pieces << filter_to_pieces(line.chomp) }
    @pieces[0] += [nil] if @pieces[0].size < @pieces[1].size
    @pieces.delete_if(&:empty?)
    @pieces = @pieces.transpose.map(&:join)
  end

  def convert
    return convert_multi_lines if @multi_lines.size > 1
    string_number = ''
    @pieces.each do |piece|
      CIPHER.each { |digit, rows| string_number << digit if piece == rows }
      string_number << '?' unless CIPHER.values.include?(piece)
    end
    string_number
  end

  private

  def filter_to_pieces(line)
    line.chars.each_slice(3).map(&:join).map(&:rstrip)
  end

  def convert_multi_lines
    @multi_lines.map { |line| OCR.new(line).convert }.join(',')
  end
end
