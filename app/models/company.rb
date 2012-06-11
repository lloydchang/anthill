class Company < ActiveRecord::Base

	has_many :ideas
	has_many :users

end
