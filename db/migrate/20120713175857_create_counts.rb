class CreateCounts < ActiveRecord::Migration
  def up
    create_table :counts do |t|
      t.string :name, :default => "Untitled"
      t.integer :num, :default => 0
    end
  end

  def down
    drop_table :counts
  end
end
