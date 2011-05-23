class UserMailer < ActionMailer::Base
  default :from => "concierge.g06@gmail.com"

  def registration_confirmation(user, num)
    @user = user
    @num = num
    mail(:to => "#{user.userName} <#{user.email}>", :subject => "Registered")
  end
end
