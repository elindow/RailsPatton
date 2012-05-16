require "spec_helper"
require "selenium-webdriver"

@driver = Selenium::WebDriver.for :url => "localhost:3000"

feature "Players", :selenium => :driver do
	scenario "are displayed in a table" do
		player = Fabricate(:player)
		visit "/players"
		page.should have_css "td", text: player.lname
	end
	scenario "can be destroyed" do
		player = Fabricate(:player)
		visit "/players"	
		page.evaluate_script('window.confirm = function() { return true; )')
		click_link "Destroy"
		Player.count.should == 0
	end
end
