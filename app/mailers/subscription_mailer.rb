class SubscriptionMailer < ApplicationMailer
  default from: "HarvestApp1@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mailer.subscription_digest.subject

  #receives an array of user models
  def send_emails()
    #gather all users from subscriptions DB *users*
    users = []
    Subscription.all.each do |sub|
      if !users.include? sub.user_id
        users.push sub.user_id
      end
    end
    #for each user with subscriptions
    users.each do |user|
      products = []
      sCount = 0
      pCount = 0
      #go through the stores where they are subscribed at
      (Subscription.where(user_id: user.id).sort_by {rand}).each do |sub|
        #go through products of store
        specials = (Store.where(vendor_id: sub.vendor_id).first.products.where(is_special: true).sort_by {rand})
        while pCount <= 2 and !specials.empty? do
          product = specials.pop
          if product.updated_at > sub.updated_at
            products.push product
            sub.updated_at = Time.now
            sCount = sCount + 0.5
          end
        end
        pCount = 0
        sCount = sCount.round
        if sCount = 3
          SubscriptionMailer.subscription_digest(user, products).deliver_now
        end
      end
        if sCount > 0 and sCount < 3
          while sCount < 3
            randomRecommendations = Product.where(is_special: true).sample.store.products
            if randomRecommendations.count > 1
            products.merge *randomRecommendations.sample(2)
            else
            products.push randomRecommendations.sample
            end
            sCount = sCount + 1
          end
          SubscriptionMailer.subscription_digest(user, products).deliver_now
        end
    end

    #for loop for all users
      #*products*
      #go through each subscription for that user
      #subscription.where(user_id: id).sort_by {rand}
      #store count variable
      #for each subscription, look for 2 items from that vendor
      #if reach 3 stores send email
      #if reach end send email if products has more than 2 products
      #do nothing
    #dont forget to update the subscription if it gets added
    #algorithm
  end

  def subscription_digest(user, products)
    @stores = Hash.new
    products.each do |prod|
      if @stores[prod.store].nil?
        @stores[prod.store] = [prod]
      else
        @stores[prod.store] = @stores[prod.store].push prod
      end
    end

    @user = user
      mail to: user.email, subject: "Harvest: Check out these CRAZY Deals at your Local Farmers Markets!"
  end
end
