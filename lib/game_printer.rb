class GamePrinter

  def self.print(game, io = STDOUT)
    Range.new(1, game.columns).to_a.each do |x|
      Range.new(1, game.rows).to_a.each do |y|
        printf(io, game.grid[game.key(x,y)] == true ? 'o' : ' ')
      end
      printf(io, "\n")
    end
  end

end