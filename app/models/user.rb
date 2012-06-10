class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :title, :department, :skills

  has_many :ideas
  has_many :idea_users
  has_many :collaborate_ideas, :through => :idea_users, :source=> :idea, :foreign_key=>"idea_id"

  def full_name    
    first_name.empty? && !last_name.empty? ? email :  "#{first_name} #{last_name}"
  end

end
