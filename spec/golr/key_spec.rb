require 'spec_helper'
require 'golr/key'

module Golr

  describe Key do

    context '#coordinates' do
      it "splits a key given as String into an array of integer coordinates" do
        Key.coordinates('1_3').should == [1,3]
      end
    end

    context '#key' do
      it "concatenates two given values into a key (String)" do
        Key.key(1,3).should == '1_3'
      end
    end

  end

end