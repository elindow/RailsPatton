require 'spec_helper'

describe "A Player" do

	context "with data" do
		let (:player) { Player.new }
		
		before(:each) do
			player.fname = "FName"
			player.lname = "LName"
		end
		
		it "is valid" do
			player.should be_valid
		end
		
		it "can be persisted" do
			player.fname = "FName"
			player.lname = "LName"
			player.save.should be_true
			Player.count.should == 1
		end
		
	end
	
end

		