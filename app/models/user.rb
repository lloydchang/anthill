class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :title, :department, :skills, :image

  has_many :ideas
  has_many :idea_users
  has_many :collaborate_ideas, :through => :idea_users, :source=> :idea, :foreign_key=>"idea_id"

  has_attached_file :image,
      :path => "/users/:id/:id_:style",
    :styles => {
      :tiny => "25x25",
      :small => "125x125#" },
    :storage => :s3,
    :bucket => 'joinme',
    :s3_credentials => {
      :access_key_id => 'AKIAJ4XWOBHDDCG7TJXQ',
      :secret_access_key => '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'
    }
  
  def full_name    
    first_name.blank? && !last_name.blank? ? email :  "#{first_name} #{last_name}"
  end

end
