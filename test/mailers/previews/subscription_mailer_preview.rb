# Preview all emails at http://localhost:3000/rails/mailers/subscription_mailer
class SubscriptionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscription_mailer/subscription_digest
  def subscription_digest(user, products)
    SubscriptionMailer.subscription_digest
  end
end
