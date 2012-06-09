class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :problem
      t.text :solution
      t.string :video
      t.text :requirements
      t.integer :user_id
      t.timestamps
    end
  end
end
