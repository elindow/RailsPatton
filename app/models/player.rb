class Player < ActiveRecord::Base
	validates_presence_of :lname
	validates_presence_of :fname
	
end