class AddPlayers < ActiveRecord::Migration
	def change
		add_column :players, :league, :string 
		add_column :players, :team, :string
		add_column :players, :runs, :integer
		add_column :players, :rbi, :integer
	end
end