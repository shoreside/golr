require 'spec_helper'
require 'golr/game_reader'

module Golr

  describe GameReader do

    context "#from_string" do

      it "should read a multiline description that uses 'o' for active cells" do
        multi_line_description = <<-eos
          |        |
          |  o     |
          | o   o  |
          |   o    |
          |     o  |
          |o      o|
          |        |
        eos
        game = GameReader.from_string(multi_line_description)
        game.columns.should == 8
        game.rows.should == 7
        io = StringIO.new
        GamePrinter.print(game, io)
        io.string.should == "\n o     \no      \n  o    \n       \n o o   \n       \n    o  \n       \n\n"
      end

    end

  end

end