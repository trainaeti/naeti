require 'test_helper'

class PostofficeTest < ActionMailer::TestCase
  test "contact" do
    mail = Postoffice.contact
    assert_equal "Contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "on_site_training" do
    mail = Postoffice.on_site_training
    assert_equal "On site training", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
