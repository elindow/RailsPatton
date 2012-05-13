require 'spec_helper'

describe "players/index.html.haml" do
	before(:each) do
		@player = Fabricate(:player)
		assign(:players, Player.all)
	end
	it "renders a list of things" do
		render
		assert_select "tr>td", :text => @player.fname, :count => Player.count
	end
end
	