module RequestsHelper
  def translate_status_to_market_owner(status)
    if status == 0
      "Unread"
    elsif status == 1
      "Readed"
    elsif status == 2
      "Refused"
    elsif status == 3
      "Refused"
    elsif status == 4
      "Accepted"
    elsif status == 5
      "Accepted"
    elsif status == 6
      "Accepted"
    end
  end

  def translate_status_to_request_sender(status)
    if status == 0
      "Unread"
    elsif status == 1
      "Readed"
    elsif status == 2
      "Refused"
    elsif status == 3
      "Refused"
    elsif status == 4
      "Accepted"
    elsif status == 5
      "Accepted"
    elsif status == 6
      "Accepted"
    end
  end
end
