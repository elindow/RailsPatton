class CreateHitters < ActiveRecord::Migration
  def change
    create_table :hitters do |t|
      t.integer :ab
      t.integer :h
      t.integer :dbl
      t.integer :trp
      t.integer :hr
      t.integer :r
      t.integer :rbi
      t.integer :sb
      t.integer :cs
      t.integer :g

      t.timestamps
    end
  end
end
