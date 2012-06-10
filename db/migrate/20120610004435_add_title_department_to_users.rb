class AddTitleDepartmentToUsers < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|
  		t.string :title
  		t.string :department
  		t.text :skills
  	end
  end
end
