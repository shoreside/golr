module Golr

  class Game

    attr_reader :grid, :columns, :rows

    def initialize(columns, rows, living_cells = [])
      @columns = columns
      @rows = rows
      @grid = init_grid(living_cells)
      @rules = Rules.new
    end

    def init_grid(living_cells = [])
      new_grid = {}
      Range.new(1, @columns).to_a.each do |x|
        Range.new(1, @rows).to_a.each do |y|
          key = Key.key(x, y)
          new_grid[key] = living_cells.include?(key) ? true : false
        end
      end
      new_grid
    end

    def evolve
      next_grid = init_grid
      @grid.each_key do |key|
        x, y = Key.coordinates(key)
        next_grid[key] = @rules.evaluate(living_neighbors(x, y), alive?(key))
      end
      @grid = next_grid
      self
    end

    def set_alive(x, y)
      @grid[Key.key(x, y)] = true
    end

    def alive?(key)
      @grid[key] == true
    end

    def living_neighbors(x, y)
      living = neighboring_keys(x,y).inject(0) do |result, key|
        result += 1 if alive?(key)
        result
      end
    end

    def neighboring_keys(x, y)
      neighbor_keys = []
      ((x-1)..(x+1)).to_a.each do |x_|
        ((y-1)..(y+1)).to_a.each do |y_|
          neighbor_keys << Key.key(x_,y_) unless x == x_ && y == y_
        end
      end
      neighbor_keys
    end

  end

end
