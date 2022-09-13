class UserMailer < ApplicationMailer
  default from: 'support@ckblogs.com'

  def welcome_email
    @user = params[:user]
    mail(
      to: @user.email,
      subject: 'Welcome to CK Blogs'
    )
  end
end
