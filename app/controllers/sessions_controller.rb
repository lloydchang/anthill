class SessionsController < Devise::SessionsController

def create
  if user = User.find_by_email(params[:user][:email])
    sign_in(:user,user)
    redirect_to(root_path)
  else
    super
  end
  puts "="*50
end

end