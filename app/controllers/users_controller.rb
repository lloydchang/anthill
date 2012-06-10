class UsersController < ApplicationController
  def profile
  	@user = User.find_by_id(params[:id]) || current_user
  end
end
