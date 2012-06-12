class AddCompanyAlias < ActiveRecord::Migration
  def up
  	add_column :companies, :subdomain, :string
  	Company.all.each do |c|
  		c.update_attribute(:subdomain, c.name.gsub(/\..*/,""))
  	end
  	add_index :companies, :subdomain,   :unique => true

  end

  def down
  	remove_index :companies, :subdomain,   :unique => true
  	remove_column :companies, :subdomain

  end
end
