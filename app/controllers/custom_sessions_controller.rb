class CustomSessionsController < Devise::SessionsController
skip_before_filter :require_no_authentication , :only=>[:create]

def create
	puts "="*40
  if user = User.find_by_email(params[:user][:email])
  	if user.valid_password?(params[:user][:password])
	    sign_in(:user,user) 
	    redirect_to(dashboard_ideas_path)
	end
  else
  	user = User.create(:email=>params[:user][:email], :password=>params[:user][:password], :first_name=>"Jim", :last_name=>"Ant")
    redirect_to(root_url) unless user.errors.empty?
    name, company_name = user.email.split("@")
    company_name = company_name.downcase
    company = Company.find_or_create_by_name(company_name)
    user.company_id = company.id
    user.save
    sign_in(:user, user)
    redirect_to(dashboard_ideas_path)
  end
end

end