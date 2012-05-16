require 'spec_helper'

describe "A Player" do

	context "with data" do
		let (:player) { Player.new }
		
		before(:each) do
			player.fname = "FName"
			player.lname = "LName"
			player.atbats = 1
			player.hits = 0
			player.runs = 0
			player.rbi = 0
		end
		
		it "is valid" do
			player.should be_valid
		end
		
		it "can be persisted" do
			player.save.should be_true
			Player.count.should == 1
		end
		
	end
	
end

		