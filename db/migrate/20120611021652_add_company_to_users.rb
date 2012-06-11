class AddCompanyToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :company_id, :integer
  	User.all.each do |u|
  		name, company_name = u.email.split("@")
  		company = Company.find_or_create_by_name(company_name.downcase)
 		u.update_attribute(:company_id, company.id)
  	end

  end

  def self.down
  	remove_column :users, :company_id
  end
end
