class Notifier < ActionMailer::Base
  include UrlHelper
   
  default from: "support@getanthill.com"


  def idea_invite(user, idea)
    @user = user
    @idea  = idea
    mail(:to => user.email, :subject => "You are invited on '#{idea.title}' idea")
  end


end
