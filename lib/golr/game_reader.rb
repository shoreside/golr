module Golr

  class GameReader

    def from_string(multi_line_string)
      keys = []
      rows = 0
      columns = count_columns(multi_line_string)
      multi_line_string.split(/\r?\n/).each do |line|
        keys << keys_from_line(line, rows).flatten
        rows += 1
      end
      Game.new(columns, rows, keys)
    end

    private

    def keys_from_line(line, row)
      char_in_line = 0
      keys_in_line = []
      line.gsub!('|','')
      line.each_char do |c|
        keys_in_line << Key.key(char_in_line, row) if c == 'o'
        char_in_line += 1
      end
      keys_in_line
    end

    def count_columns(multi_line_string)
      first_line = multi_line_string.split(/\r?\n/).first
      first_line.length.size - 2 # do not count the borders (denoted by '|')
    end

  end

end
