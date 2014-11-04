class UserMailer < ActionMailer::Base
  default from: "info@regdevice.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://regdevice.com'
    mail(to: @user.email, subject: 'Welcome to My RegDevice.com')
  end
end
