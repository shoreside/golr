require 'spec_helper'
require 'game'

describe Game do
       
  context '#initialize' do
    it "a Game must have a minimum dimension of 3 by 3 cells" do
      expect {
        Game.new(2,3)
      }.to raise_error
      expect {
        Game.new(3,2)
      }.to raise_error
    end
  end  
  
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
      game = Game.new(5,5)
    
      game.set_alive(2,3)
      game.set_alive(2,4)
    
      game.living_neighbors(2,3).should == 1
    end
  
    it "a new Game with three adjacent living cells returns a count of two living cells around the initial living cell" do
      game = Game.new(5,5)
    
      game.set_alive(2,3)
      game.set_alive(2,4)
      game.set_alive(3,3)
    
      game.living_neighbors(2,3).should == 2
    end   
  end
  
  context '#coordinates' do
    it "splits a key given as String into an array of integer coordinates" do
      game = Game.new(5,5)
    
      game.coordinates('1_3').should == [1,3]    
    end      
  end
  
  context '#next_generation' do
    it "compultes next two generations for an oscillator" do
      game = Game.new(5,5)
    
      game.set_alive(3,2)
      game.set_alive(3,3)
      game.set_alive(3,4)
    
      next_grid = game.next_generation
    
      next_grid[game.key(2,3)].should be_true
      next_grid[game.key(3,3)].should be_true
      next_grid[game.key(4,3)].should be_true   
    
      next_next_grid = game.next_generation(next_grid)
    
      next_next_grid[game.key(3,2)].should be_true
      next_next_grid[game.key(3,3)].should be_true
      next_next_grid[game.key(3,4)].should be_true    
    end   
  end  
    
end