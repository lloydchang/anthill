class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :idea
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :title, :department, :skills, :image, :idea

  has_many :ideas
  has_many :idea_users
  has_many :collaborate_ideas, :through => :idea_users, :source=> :idea, :foreign_key=>"idea_id"

  has_many :comments
  belongs_to :company

  has_attached_file :image,
      :path => "/users/:id/:id_:style",
    :styles => {
      :tiny => "25x25#",
      :tiny2 => "50x50#",
      :small => "125x125#" },
    :storage => :s3,
    :bucket => 'joinme',
    :s3_credentials => {
      :access_key_id => 'AKIAJ4XWOBHDDCG7TJXQ',
      :secret_access_key => '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'
    },
    :default_url =>'/images/noavatar.jpg'
  
  before_create :update_company

  def update_company
    name, company_name = email.split("@")
    company_domain = company_name.downcase
    #do company thing
    company = Company.find_or_create_by_domain(company_domain)
    self.company_id = company.id
  end

  def full_name    
    first_name.blank? && !last_name.blank? ? email :  "#{first_name} #{last_name}"
  end

end
