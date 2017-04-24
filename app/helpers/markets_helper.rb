module MarketsHelper
  def isMarketOwner(market)
    if(market.user.id == current_user.id)
      return true
    else
      return false
    end
  end


  def joined_in?(market)
    if current_user.vendor.store and StoreMarketRelationship.where(:store_id => current_user.vendor.store.id, :market_id => market.id).any?
      return true
    else
      return false
    end
  end
end
