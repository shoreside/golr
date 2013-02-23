module Golr

  class GameReader

    def self.from_string(multi_line_string)
      keys = []
      row = 1
      columns = count_columns(multi_line_string)
      multi_line_string.split(/\r?\n/).each do |line|
        keys |= keys_from_line(line, row).flatten
        row += 1
      end
      rows = row - 1
      Game.new(columns, rows, keys)
    end

    private

    def self.count_columns(multi_line_string)
      first_line = multi_line_string.split(/\r\n?|\n/).first
      first_line.strip.bytesize - 2
      # TODO: not entirely clear why this works even on Travis, while string.size did not
    end

    def self.keys_from_line(line, row)
      char_in_line = 1
      keys_in_line = []
      line.strip!
      line.gsub!('|','')
      line.each_char do |c|
        keys_in_line << Key.key(char_in_line, row) if c == 'o'
        char_in_line += 1
      end
      keys_in_line
    end

  end

end
