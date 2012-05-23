require 'spec_helper'

describe "players/new.html.haml" do

  before(:each) do
    assign(:player, Fabricate(:player))
  end

  it "renders new player form" do
    render
	assert_select "form", action: player_path(:player), method: "post" do
		assert_select "input#player_fname", :name => "player[fname]"	
	end
  end
end