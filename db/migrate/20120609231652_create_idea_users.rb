class CreateIdeaUsers < ActiveRecord::Migration
  def change
    create_table :idea_users do |t|
      t.integer :user_id
      t.integer :idea_id

      t.timestamps
    end
  end
end
