module MarketsHelper
  def isMarketOwner(market)
    if(market.user.id == current_user.id)
      return true
    else
      return false
    end
  end
end
