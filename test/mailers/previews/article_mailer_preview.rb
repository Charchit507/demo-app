# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/article_mailer/create_mail
  def create_mail
    ArticleMailer.with(user: user.first).create_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/article_mailer/update_mail
  def update_mail
    ArticleMailer.update_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/article_mailer/delete_mail
  def delete_mail
    ArticleMailer.delete_mail
  end

end
