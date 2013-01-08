require 'spec_helper'
require 'game'
require 'game_printer'

describe GamePrinter do

  context '#pretty_print' do

    it 'produces expected output in given io object (String)' do
      game = Game.new(9,7, ["2_4", "3_5", "1_3", "5_5"])
      result = GamePrinter.print(game, StringIO.new).string
      result.should == "       \n       \no      \n o     \n  o o  \n       \n       \n       \n       \n"
    end
  end


end