require "spec_helper"
require "selenium-webdriver"

feature "Players", :js => true do
	scenario "are displayed in a table" do
		player = Fabricate(:player)
		visit "/players"
		page.should have_css "td", text: player.lname
	end

	scenario "data can be shown" do
		player = Fabricate(:player)
		visit "/players/#{player.id.to_s}"
		#visit "/players"
		#click_link "Show"
		page.should have_content player.fname
	end

	scenario "can be created" do
		visit "/players/new"
		#click_link "New Player"
		fill_in "Fname", :with => 'first name'
		fill_in "Lname", :with => 'last name'	
		click_on "Create Player"
		Player.count.should == 1
		Player.last.fname.should == 'first name'
	end

	scenario "can be edited" do
		player = Fabricate(:player)
		visit "/players/#{player.id.to_s}/edit"
		fill_in "Fname", :with => 'edited fname'
		fill_in "Lname", :with => 'edited lname'			
		click_on "Update Player"
		player.reload.fname.should == 'edited fname'
	end
	
	scenario "can be destroyed" do
		player = Fabricate(:player)
		visit "/players"	
		page.driver.browser.switch_to.alert.accept
		#page.evaluate_script('window.confirm = function() { return true; )')
		click_link "Destroy"	

		Player.count.should == 1
	end
end
