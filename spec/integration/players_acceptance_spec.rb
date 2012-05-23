require "spec_helper"
require "selenium-webdriver"

#Chrome webdriver
#Capybara.register_driver :selenium do |app|
#@driver = Capybara::Selenium::Driver.new(app, :browser => :chrome)
#end

feature "Players Integrtion Test", :js => true do
	scenario "are displayed in a table" do
		player = Fabricate(:player)
		visit "/players"
		page.should have_css "td", text: player.fname
		page.should have_css "td", text: player.lname
	end

	scenario "data can be shown" do
		player = Fabricate(:player)
		visit "/players/#{player.id.to_s}"
		#page.should have_content player.fname
		page.should have_content player.lname
	end

	scenario "can be created" do
		visit "/players/new"
		fill_in "Fname", :with => 'first name'
		fill_in "Lname", :with => 'last name'	
		click_on "Create Player"
		Player.count.should == 1
		Player.last.fname.should == 'first name'
		Player.last.lname.should == 'last name'		
	end

	scenario "can be edited" do
		player = Fabricate(:player)
		visit "/players/#{player.id.to_s}/edit"
		fill_in "Fname", :with => 'edited fname'
		fill_in "Lname", :with => 'edited lname'			
		click_on "Update Player"
		player.reload.fname.should == 'edited fname'
		player.reload.lname.should == 'edited lname'
	end

=begin
	scenario "can be destroyed"  do
		player = Fabricate(:player)
		visit "/players"	
		page.driver.browser.switch_to.alert.accept					#didn't work
		page.driver.browser.confirm(true) {browser.button.click}	#ditto
		click_link "Destroy"		
		#alert = page.driver.switchTo().alert()						#ditto
		#alert.getText()											#ditto
		#alert.accept												#ditto
	end
=end

	scenario "can be destroyed" do
		player = Fabricate(:player)
		visit "/players"	
		page.evaluate_script('window.confirm = function() { return true; }')
		click_link "Destroy"	
		Player.count.should == 0		
	end
	
	scenario "doesn't exist" do
		visit "/players/-1"
		page.should have_content "404 Error - Not Found"
	end
	
end
