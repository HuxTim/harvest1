class SubscriptionMailer < ApplicationMailer
  default from: "HarvestApp1@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mailer.subscription_digest.subject

  #receives an array of user models
  def send_emails()
    #variables
    #algorithm
    1.times do
      SubscriptionMailer.subscription_digest().deliver_now
    end
  end

  def subscription_digest()
    @stores = {}
    Store.all[0..2].each do |store|
      @stores[store] = []
      store.products.all[0..1].each do |product|
        @stores[store].push(product)
      end
    end
    mail to: "HarvestApp1@gmail.com", subject: "Harvest: Your Weekly Specials"
  end
end
