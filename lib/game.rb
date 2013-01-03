class Game

  attr_reader :grid

  def initialize(columns, rows, living_cells = [])
    raise "Game must be at least 3 by 3 cells in size" unless columns > 2 && rows > 2
    @columns = columns
    @rows = rows
    @grid = init_grid(living_cells)
    @rules = Rules.new
  end

  def init_grid(living_cells = [])
    new_grid = {}
    Range.new(1, @columns).to_a.each do |x|
      Range.new(1, @rows).to_a.each do |y|
        _key = key(x, y)
        new_grid[_key] = living_cells.include?(_key) ? true : false
      end
    end
    new_grid
  end

  def evolve
    next_grid = init_grid
    @grid.each_key do |key|
      x, y = coordinates(key)
      next_grid[key] = @rules.evaluate(living_neighbors(x, y), alive?(key))
    end
    @grid = next_grid
    self
  end

  def set_alive(x, y)
    @grid[key(x, y)] = true
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
        neighbor_keys << key(x_,y_) unless x == x_ && y == y_
      end
    end
    neighbor_keys
  end

  def key(x, y)
    "#{x}_#{y}"
  end

  def coordinates(key)
    split = key.split('_')
    [split[0].to_i, split[1].to_i]
  end

  def pretty_print(io = STDOUT)
    printf(io, "\n")
    Range.new(1, 5).to_a.each do |y|
      Range.new(1, 5).to_a.each do |x|
        state_char = grid[key(x,y)] == true ? 'o' : ' '
        printf(io, state_char)
      end
      printf(io, "\n")
    end
  end

end
