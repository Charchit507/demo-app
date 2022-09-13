class ArticleMailer < ApplicationMailer
  default from: 'support@ckblogs.com'

  def create_mail(object)
    @object = object
    @user = params[:user]
    mail to: @user.email, subject: "A new entry for #{object.class} has been created"
  end

  def update_mail(object)
    @object = object
    @user = params[:user]
    mail to: @user.email, subject: "A new entry for #{object.class} has been updated"
  end

  def delete_mail(object)
    @object = object
    @user = params[:user]
    mail to: @user.email, subject: "A new entry for #{object.class} has been deleted"
  end
end
