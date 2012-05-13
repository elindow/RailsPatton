require 'spec_helper'

describe Player do
  it "can be created with a name" do
    Player.new({fname: "new", lname: "player"}).should be_valid
  end
  it "cannot be created without a name" do
    Player.new.should_not be_valid
  end
end