class AddPlayerIdToHitter < ActiveRecord::Migration
  def change
      add_column :hitters, :player_id, :integer
  end
end
