class AddCompanyToIdeas < ActiveRecord::Migration
  def self.up
  	change_table :ideas do |t|
  		t.integer :company_id
  	end
  	Idea.all.each do |i|
  		i.update_attribute(:company_id, i.user.company_id)
  	end
  end

  def self.down
  	remove_column :ideas, :company_id
  end
end
