class AddDomainToCompanies < ActiveRecord::Migration
  def self.up
  	change_table :companies do |t|
  		t.string :domain
  	end
  	Company.all.each do |c|
  		c.update_attribute(:domain, c.name.downcase.sub(".","-"))
  	end
  end

  def self.down
  	remove_column :companies, :domain
  end
end
