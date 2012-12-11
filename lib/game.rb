class Game
       
  def initialize(columns, rows)
    raise "Game must be at least 3 by 3 cells in size" unless columns > 2 && rows > 2
    @columns = columns
    @rows = rows
    @grid = init_grid
    @rules = Rules.new
  end    
        
  def init_grid 
    new_grid = {}
    Range.new(1, @columns).to_a.each do |x_|
      Range.new(1, @rows).to_a.each do |y_|
        new_grid[key(x_, y_)] = false
      end      
    end
    new_grid
  end
  
  def next_generation(current_grid = nil)               
    next_grid = init_grid              
    @grid = current_grid if current_grid
    @grid.each_key do |key|
      x, y = coordinates(key)
      next_grid[key] = @rules.evaluate(living_neighbors(x, y), alive?(key))
    end                                                                                 
    next_grid
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
  
end
