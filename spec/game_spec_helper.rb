class GameSpecHelper
  def self.count_cells_alive(grid)
    grid.keys.inject(0) do |result, element|
      result +=1 if grid[element]
      result
    end
  end
end
