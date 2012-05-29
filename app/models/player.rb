class Player < ActiveRecord::Base
	validates_presence_of :lname
	validates_presence_of :fname
	validates_presence_of :atbats
	validates_presence_of :hits
	validates_presence_of :runs
	validates_presence_of :rbi
	
	has_one :hitter
	
	def ba
		self.hits || self.hits= 0
		self.atbats || self.atbats = 1	#atbats must be non-zero to avoid divzero
		#self.atbats == 0 {@ba = 0} || {@ba = self.hits * 1000 / self.atbats} #figure out more elegant syntax?
		if self.atbats == 0 then
			@ba = 0
		else
			@ba = self.hits * 1000 / self.atbats
		end
	end
	
end