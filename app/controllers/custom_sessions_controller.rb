class CustomSessionsController < Devise::SessionsController
skip_before_filter :require_no_authentication , :only=>[:create]

def create
	puts "="*40
  if user = User.find_by_email(params[:user][:email])
    sign_in(:user,user)
    redirect_to(dashboard_ideas_path)
  else
    super
  end
end

end