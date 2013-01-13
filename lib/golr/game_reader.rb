require 'game'

module Golr

  class GameReader

    def from_string(multi_line_string)
      keys = []
      row = 0
      columns = how_many_cloumns multi_line_string
      multi_line_string.split(/\r?\n/).each do |line|
        keys << keys_from_line(line, row).flatten
        row += 1
      end
      Game.new(columns, rows, keys)
    end

    private

    def keys_from_line(line, row)
      char_in_line = 0
      keys_in_line = []
      line.gsub!('|','')
      line.each_char do |c|
        keys_in_line << Game.new(5,5).key(char_in_line, row) if c == 'o'
        char_in_line += 1
      end
      puts keys_in_line.to_s
      keys_in_line
    end

    def how_many_cloumns(multi_line_string)
      first_line = multi_line_string.split(/\r?\n/).first
      first_line.length.size - 2
    end

  end

end