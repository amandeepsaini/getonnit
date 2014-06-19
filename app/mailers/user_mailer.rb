class UserMailer < ActionMailer::Base
  default from: "getonnitteam@getonnit.com"

  def invite_user(email, name, sender)
  	@name = name
  	@sender = sender
  	mail(:to => email, :subject => "You've been invited to getonnit!")


  end
  
  def registration_confirmation(user)
  	@user = user
    mail(:to => user.email, :subject => "Registered")
  end
end
