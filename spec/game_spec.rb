require 'spec_helper'
require 'game'
require 'game_spec_helper'

describe Game do

  context '#alive?' do
    it "a new Game returns dead cell for any coordinates within its grid boundaries" do
      game = Game.new(5,5)

      game.alive?(game.key(rand(5),rand(5))).should be_false
    end

    it "a new Game accepts and returns a living cell at any coordinates within its grid boundaries" do
      x,y = rand(5), rand(5)
      game = Game.new(5,5)

      game.set_alive(x,y)

      game.alive?(game.key(x,y)).should be_true
    end
  end

  context '#neighboring_keys' do
    it "any Game returns 8 neighboring cell coordinates for any given cell coordinate" do
      x,y = rand(5), rand(5)
      game = Game.new(5,5)

      game.neighboring_keys(x,y).size.should == 8
    end
  end

  context '#living_neighbors' do
    it "a new Game with one living cell returns zero living cells around that one living cell" do
      x,y = rand(5), rand(5)

      game = Game.new(5,5)
      game.set_alive(x,y)

      game.living_neighbors(x,y).should == 0
    end

    it "a new Game with two adjacent living cells returns a count of one living cell around the initial living cell" do
      game = Game.new(5,5, ["2_3", "2_4"])

      game.living_neighbors(2,3).should == 1
    end

    it "a new Game with three adjacent living cells returns a count of two living cells around the initial living cell" do
      game = Game.new(5,5, ["2_3", "2_4", "3_3"])

      game.living_neighbors(2,3).should == 2
    end
  end

  context '#coordinates' do
    it "splits a key given as String into an array of integer coordinates" do
      game = Game.new(5,5)

      game.coordinates('1_3').should == [1,3]
    end
  end

  context '#evolve' do
    it "computes next two generations for an oscillator" do
      game = Game.new(5,5, ["3_2", "3_3", "3_4"])

      initial_grid = game.grid
      first_generation = game.evolve.grid

      first_generation[game.key(2,3)].should be_true
      first_generation[game.key(3,3)].should be_true
      first_generation[game.key(4,3)].should be_true

      second_generation = game.evolve.grid
      second_generation.should have_same_cell_states_as initial_grid
    end

    it "computes a behive which is one example for a still life" do
      game = Game.new(6,5, ["2_3","3_2","3_4","4_2","4_4","5_3"])

      initial_grid = game.grid

      game.evolve.grid.should have_same_cell_states_as initial_grid
    end

    it "computes a 5-cell glider" do
      game = Game.new(8,8, ["1_2","2_3","3_1","3_2","3_3"])
      initial_grid = game.grid
      # run through 4 iterations and check for down-right-shifted glider
      4.times.each { game.evolve }
      shifted_glider = game.grid

      shifted_glider[game.key(1,2)].should be_false
      shifted_glider[game.key(3,1)].should be_false
      shifted_glider[game.key(3,2)].should be_false
      shifted_glider[game.key(3,3)].should be_false

      shifted_glider[game.key(2,3)].should be_true
      shifted_glider[game.key(3,4)].should be_true
      shifted_glider[game.key(4,2)].should be_true
      shifted_glider[game.key(4,3)].should be_true
      shifted_glider[game.key(4,4)].should be_true
    end

  end

end