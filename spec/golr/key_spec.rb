require 'spec_helper'
require 'golr/key'

module Golr

  describe Key do

    context '#coordinates' do
      it "splits a key given as String into an array of integer coordinates" do
        Key.coordinates('1_3').should == [1,3]
      end
    end

  end

end