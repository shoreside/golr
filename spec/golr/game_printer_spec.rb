require 'spec_helper'
require 'golr/game_printer'

module Golr

  describe GamePrinter do

    context '#print' do

      it 'produces expected output in given io object (String)' do        
        game = Game.new(9,7, ["2_4", "3_5", "1_3", "5_5"])
        io = StringIO.new
        GamePrinter.print(game, io)
        io.string.should == "\n  o    \n   o   \n    o  \n       \n    o  \n       \n       \n       \n       \n\n"
      end
    end

  end

end