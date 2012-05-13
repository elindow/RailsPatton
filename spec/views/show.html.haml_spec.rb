require 'spec_helper'

describe "players/show.html.haml" do
	before(:each) do
		@player = Fabricate(:player)
		assign(:players, Player.all)
	end
	it "renders a list of player fields" do
		render
		assert_select "li", 8
	end
end
	