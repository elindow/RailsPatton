class CreatePlayers < ActiveRecord::Migration
	def change
		create_table :players do |t|
			t.string :fname
			t.string :lname
			t.integer :atbats
			t.integer :hits
			
			t.timestamps
		end
	end
end