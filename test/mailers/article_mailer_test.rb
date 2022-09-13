require 'test_helper'

class ArticleMailerTest < ActionMailer::TestCase
  test "create_mail" do
    mail = ArticleMailer.create_mail
    assert_equal "Create mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "update_mail" do
    mail = ArticleMailer.update_mail
    assert_equal "Update mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "delete_mail" do
    mail = ArticleMailer.delete_mail
    assert_equal "Delete mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
