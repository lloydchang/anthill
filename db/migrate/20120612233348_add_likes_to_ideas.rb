class AddLikesToIdeas < ActiveRecord::Migration
  def self.up
  	change_table :ideas do |t|
  		t.integer :likes, :default => 1
  	end
  end

  def self.down
  	remove_column :ideas, :likes
  end
end
