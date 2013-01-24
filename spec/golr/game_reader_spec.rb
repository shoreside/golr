require 'spec_helper'
require 'golr/game_reader'

module Golr

  describe GameReader do

    context "#from_string" do

      it "should read a multiline description that uses 'o' for active cells" do
#        pending "some refactoring required before we activate this"
        multi_line_description = <<-eos
          |        |
          |  o     |
          | o   o  |
          |   o    |
          |     o  |
          |o      o|
          |        |
        eos
        puts multi_line_description
        game = GameReader.new.from_string(multi_line_description)
        game.columns.should == 6
        game.rows.should == 7
        # game.active_keys.should = []
      end

    end

  end

end