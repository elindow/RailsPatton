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
	
	describe "GET new" do
		it "can be created with a name" do
			Player.new({fname: "new", lname: "player", atbats: 1, hits: 0, runs: 0, rbi: 0}).should be_valid
		end
		it "cannot be created without a name" do
			Player.new.should_not be_valid
		end
	end
	
	describe "GET edit" do
		before(:each) do
			@player = Fabricate(:player)
		end	
		it "can find a plyeer to be edited" do
			@player = Player.find(@player.id)
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

	describe "POST create" do
		before(:each) do
			@player = Fabricate(:player)
		end
	it "it creates a player" do
			@player.save.should be_true
		end
	end
		
	describe "DELETE destroy" do
		before(:each) do
			@player = Fabricate(:player)
		end
		it "can delete a player" do 
			@player.destroy
			@player.should be_destroyed
		end
	end
	
	describe "player doesn't exist" do
		before do
			get :show, :player => 'none'
		end
			it { should_not assign_to :player }
			it { should_not render_template :show }
			it { should respond_with :not_found }
			it { should respond_with_content_type :html }
		end
	
	
end
