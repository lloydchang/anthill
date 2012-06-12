class CreateUserLikes < ActiveRecord::Migration
  def change
    create_table :user_likes do |t|
      t.integer :user_id
      t.integer :idea_id

      t.timestamps
    end
  end
end
