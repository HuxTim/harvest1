require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  test "subscription_digest" do
    mail = SubscriptionMailer.subscription_digest
    assert_equal "Subscription digest", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
