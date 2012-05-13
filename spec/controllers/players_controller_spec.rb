require 'spec_helper'

def mock_player(stubs={})
	@mock_player ||= mock_model(Player, stubs).as_null_object
end

describe PlayersController do
	describe "GET index" do
		it "has a 200 status code" do
			get :index
			response.code.should eq("200")
		end		
		it 'assigns all players to @players' do
			Player.stub(:all) { [mock_player] }
			get :index
			assigns(:players).should eq([mock_player])
		end
	end
	
	describe "new player" do
		it "can be created with a name" do
			Player.new({fname: "new", lname: "player"}).should be_valid
		end
		it "cannot be created without a name" do
			Player.new.should_not be_valid
		end
	end

	describe "PUT update" do
		before(:each) do
			@player = Fabricate(:player)
		end
		it "updates player" do
			put :update, :id => @player.id.to_s, :player => { 'lname' => 'updated' }
			@player.reload.lname.should == 'updated'
		end
	end

  
 
	
	
end
