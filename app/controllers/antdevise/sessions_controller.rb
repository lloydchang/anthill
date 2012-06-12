class Antdevise::SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication , :only=>[:create]

  def create
    if user = User.find_by_email(params[:user][:email])
    	if user.valid_password?(params[:user][:password])
  	    sign_in(:user,user) 
  	    redirect_to(dashboard_url(:user => user))
  	end
    else
    	user = User.create(:email=>params[:user][:email], :password=>params[:user][:password], :first_name=>"Jim", :last_name=>"Ant")
      sign_in(:user, user)
      dashboard_url(:subdomain => user)
    end
  end

end