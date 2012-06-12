class Company < ActiveRecord::Base

	has_many :ideas
	has_many :users

	validate :subdomain, :uniqueness => true

	before_create :update_alias

	def update_alias
		company_alias = domain.gsub(/\..*/,"")
		i = 1
		while(Company.find_by_subdomain(company_alias)) do
		 company_alias = company_alias + i.to_s 
		 i = i + 1
		end
		self.subdomain = company_alias
	end

end
