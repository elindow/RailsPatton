class SetDefaultHitsOnPlayers < ActiveRecord::Migration
  def up
	change_column :players, :hits, :integer, :default => 0
	change_column :players, :atbats, :integer, :default => 0
	change_column :players, :runs, :integer, :default => 0
	change_column :players, :rbi, :integer, :default => 0
  end

  def down
  end
end
