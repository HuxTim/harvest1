module ApplicationHelper


  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{self.bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def select_state_data
    CS.states(:us).collect{|k, v| [k.to_s + "-" + v, k.to_s] }
  end

  def select_city_data(state = "AK")
    CS.cities(state, :us)
  end

  def city_list(state = " ")
    CS.states(:state, :us)
  end

  def day_list()
    days = [
      ["Monday", 0],
      ["Tuesday", 1],
      ["Wednesday", 2],
      ["Thursday", 3],
      ["Friday", 4],
      ["Saturday", 5],
      ["Sunday", 6]
    ]
  end


  def day_hash()
    days = {
      "Monday" => 0,
      "Tuesday" => 1,
      "Wednesday" => 2,
      "Thursday" => 3,
      "Friday" => 4,
      "Saturday" => 5,
      "Sunday" => 6
    }
  end

  def timestampe_helper(day, time)
    timestampe = day.to_i * 86400
    time = time.split(' ')
    if time[1] == 'PM'
      timestampe = timestampe + 43200
    end
    timestampe = timestampe + time[0].split(':')[0].to_i * 3600 + time[0].split(':')[1].to_i * 60
  end

  def get_day_from_timestamp(timestampe)
    day = (timestampe / 86400)
    case day
    when 0
      return "Monday"
    when 1
      return "Tuesday"
    when 2
      return "Wednesday"
    when 3
      return "Thursday"
    when 4
      return "Friday"
    when 5
      return "Saturday"
    when 6
      return "Sunday"
    else
      return "Unknown"
    end
  end

  def get_time_from_timestamp(timestampe)
    time = (timestampe % 86400)
    if (time / 3600).to_i > 9
      hour = (time / 3600).to_i.to_s
    else
      hour = '0' + (time / 3600).to_i.to_s
    end

    if (time % 3600 / 60).to_i > 9
      min = (time % 3600 / 60).to_i.to_s
    else
      min = '0' + (time % 3600 / 60).to_i.to_s
    end

    if time > 43200
      time = time - 43200
      return hour + ":" + min + " PM"
    else
      return hour + ":" + min + " AM"
    end
  end

  def isVendor
    if(logged_in? and current_user.vendor)
      return true
    else
      return false
    end
  end
end
