require 'golr/key'
require 'golr/rules'

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
        next_grid[key] = @rules.evaluate(living_neighbors(key), alive?(key))
      end
      @grid = next_grid
      self
    end

    def alive?(key)
      @grid[key] == true
    end

    private

    def living_neighbors(key)
      living = neighboring_keys(key).inject(0) do |result, _key|
        result += 1 if alive?(_key)
        result
      end
    end

    def neighboring_keys(key)
      neighbor_keys = []
      x,y = Key.coordinates(key)
      ((x-1)..(x+1)).to_a.each do |_x|
        ((y-1)..(y+1)).to_a.each do |_y|
          neighbor_keys << Key.key(_x,_y) unless x == _x && y == _y
        end
      end
      neighbor_keys
    end

  end

end
