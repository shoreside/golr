require 'spec_helper'
require 'golr/game'

module Golr
  describe Game do

    context '#alive?' do
      it "a new Game returns dead cell for any coordinates within its grid boundaries" do
        key = Key.key(rand(5) + 1, rand(5) + 1)
        game = Game.new(5,5)

        game.alive?(key).should be_false
      end

      it "a new Game accepts and returns a living cell at any coordinates within its grid boundaries" do
        key = Key.key(rand(5) + 1, rand(5) + 1)
        game = Game.new(5,5, [key])

        game.alive?(key).should be_true
      end
    end

    context '#neighboring_keys' do
      it "any Game returns 8 neighboring cell coordinates for any given cell coordinate" do
        key = Key.key(rand(5) + 1, rand(5) + 1)
        game = Game.new(5,5)

        game.neighboring_keys(key).size.should == 8
      end
    end

    context '#living_neighbors' do
      it "a new Game with one living cell returns zero living cells around that one living cell" do
        x,y = rand(5) + 1, rand(5) + 1
        key = Key.key(x, y)

        game = Game.new(5,5, [key])

        game.living_neighbors(key).should == 0
      end

      it "a new Game with two adjacent living cells returns a count of one living cell around the initial living cell" do
        game = Game.new(5,5, ["2_3", "2_4"])

        game.living_neighbors(Key.key(2,3)).should == 1
      end

      it "a new Game with three adjacent living cells returns a count of two living cells around the initial living cell" do
        game = Game.new(5,5, ["2_3", "2_4", "3_3"])

        game.living_neighbors(Key.key(2,3)).should == 2
      end
    end

  end

end