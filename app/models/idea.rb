class Idea < ActiveRecord::Base

	belongs_to :user
	belongs_to :company
	has_many :images
	has_many :idea_users
	has_many :users, :through => :idea_users
	has_many :comments
end
