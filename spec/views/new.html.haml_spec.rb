require 'spec_helper'

describe "players/new.html.haml" do

  before(:each) do
    assign(:player, Fabricate(:player))
  end

  it "renders new player form" do
    render
	assert_select "form"
  end
end