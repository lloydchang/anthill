class Idea < ActiveRecord::Base

	default_scope :order=>"created_at DESC"

	belongs_to :user
	belongs_to :company
	has_many :images, :dependent => :destroy
	has_many :idea_users, :dependent => :destroy
	has_many :users, :through => :idea_users
	has_many :comments, :dependent => :destroy

	def liked?(user)
		UserLike.count(:conditions=>{:user_id=>user.id, :idea_id=>id}) > 0
	end

	def like(user)
		UserLike.find(:first, :conditions=>{:user_id=>user.id, :idea_id=>id}) || UserLike.create(:user_id=>user.id, :idea_id=>id)
		update_attribute(:likes, likes + 1)
	end

end
