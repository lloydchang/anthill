class UsersController < ApplicationController
  layout 'logged'
  before_filter :authenticate_user!
  
  def profile
  	@user = User.find_by_id(params[:id]) || current_user
  end

end
