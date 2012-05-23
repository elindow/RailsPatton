require 'spec_helper'

describe "players/edit.html.haml" do
	before(:each) do
		@player = Fabricate(:player)
		assign(:players, Player.all)
	end
	it "renders an edit form" do
		render
		assert_select "form", action: player_path(@player), method: "post" do
			assert_select "input#player_fname", :name => "player[fname]"	
		end	
	end
end
	