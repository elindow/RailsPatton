class Hitter < ActiveRecord::Base
  attr_accessible :ab, :cs, :dbl, :g, :h, :hr, :r, :rbi, :sb, :trp
  
  belongs_to :player
  
  
  	def ba
		self.h || self.h= 0
		self.ab || self.ab = 1	#atbats must be non-zero to avoid divzero
		if self.ab == 0 then
			@ba = 0
		else
			@ba = self.h * 1000 / self.ab
		end
	end
end
