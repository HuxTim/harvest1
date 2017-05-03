module RequestsHelper
  def translate_status_to_market_owner(status)
    if status == 0
      "Unread"
    elsif status == 1
      "Accepted"
    elsif status == 2
      "Refused"
    end
  end
end
