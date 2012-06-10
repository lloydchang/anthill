class CustomSessionsController < Devise::SessionsController
skip_before_filter :require_no_authentication , :only=>[:create]

def create
	puts "="*40
  if user = User.find_by_email(params[:user][:email])
    sign_in(:user,user)
    redirect_to(dashboard_ideas_path)
  else
  	user = User.create(:email=>params[:user][:email], :password=>"123456", :first_name=>"Tom", :last_name=>"Ratcliff")
    sign_in(:user, user)
    redirect_to(dashboard_ideas_path)
  end
end

end