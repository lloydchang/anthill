class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :idea_id
      t.has_attached_file :image
      t.timestamps
    end
  end

  def self.down
  	drop_attached_file :users, :image
  	drop_table :images
  end
end
