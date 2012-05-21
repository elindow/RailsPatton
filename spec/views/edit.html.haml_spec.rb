require 'spec_helper'

describe "players/edit.html.haml" do
	before(:each) do
		@player = Fabricate(:player)
		assign(:players, Player.all)
	end
	it "renders an edit form" do
		render
		assert_select "form"
		assert_select "input"
	end
end

describe "players/_form.html.haml" do
	before(:each) do
		@player = Fabricate(:player)
		assign(:players, Player.all)
	end
	it "renders the form" do
		render
		assert_select "input"
	end
end
	