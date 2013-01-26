module Golr

  class GameReader

    def self.from_string(multi_line_string)
      keys = []
      rows = 0
      columns = count_columns(multi_line_string)
      multi_line_string.split(/\r?\n/).each do |line|
        keys |= keys_from_line(line, rows).flatten
        rows += 1
      end
      Game.new(columns, rows, keys)
    end

    
    private

    def self.count_columns(multi_line_string)
      first_line = multi_line_string.split(/\r\n?|\n/).first
      first_line.strip.bytesize - 4 # not nice, but works even on Travis, unlike length.size - 2
    end

    def self.keys_from_line(line, row)
      char_in_line = 0
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