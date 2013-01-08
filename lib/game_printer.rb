class GamePrinter

  def self.print(game, io = STDOUT)
    Range.new(1, game.columns).to_a.each do |y|
      Range.new(1, game.rows).to_a.each do |x|
        printf(io, game.grid[game.key(x,y)] == true ? 'o' : ' ')
      end
      printf(io, "\n")
    end
    io
  end

end