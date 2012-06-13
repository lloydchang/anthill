class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@users = current_user.company.users.order("id DESC")
  end
  
  def profile
  	@user = User.find_by_id(params[:id]) || current_user
  end

  def userroot
  	redirect_to(dashboard_url(:user=>current_user))
  end

end
