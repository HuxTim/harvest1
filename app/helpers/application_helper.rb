module ApplicationHelper


  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '129.64.121.237'
    else
      request.remote_ip
    end
  end


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

  def hour_hash()
    hour = {"9AM"=> 9, "10AM" => 10, "11AM" => 11, "12PM" => 12, "1PM" => 13, "2PM" => 14, "3PM" => 15,
     "4PM" => 16, "5PM" => 17, "6PM" => 18, "7PM" => 19, "8PM" => 20}
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

  def timestamp_helper(day, time)
    timestamp = day.to_i * 86400
    time = time.split(' ')
    if time[1] == 'PM'
      timestamp = timestamp + 43200
    end
    timestamp = timestamp + time[0].split(':')[0].to_i * 3600 + time[0].split(':')[1].to_i * 60
  end

  def get_day_from_timestamp(timestamp)
    day = (timestamp / 86400)
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

  def get_time_from_timestamp(timestamp)
    time = (timestamp % 86400)
    if (time / 3600).to_i > 9
      hour = (time / 3600).to_i
      if hour > 12
        hour = hour - 12
      end
        hour = hour.to_s
    else
      hour = ' ' + (time / 3600).to_i.to_s
    end

    if (time % 3600 / 60).to_i > 9
      min = (time % 3600 / 60).to_i.to_s
    else
      min = '0' + (time % 3600 / 60).to_i.to_s
    end

    if time > 43199
      time = time - 43200
      return hour + ":" + min + " PM"
    else
      return hour + ":" + min + " AM"
    end
  end

  def isVendor(user = current_user)
    if(user.vendor)
      return true
    else
      return false
    end
  end

  def darken_color(hex_color, amount=0.4)
    hex_color = hex_color.gsub('#','')
    rgb = hex_color.scan(/../).map {|color| color.hex}
    rgb[0] = (rgb[0].to_i * amount).round
    rgb[1] = (rgb[1].to_i * amount).round
    rgb[2] = (rgb[2].to_i * amount).round
    "#%02x%02x%02x" % rgb
  end

  # Amount should be a decimal between 0 and 1. Higher means lighter
  def lighten_color(hex_color, amount=0.6)
    hex_color = hex_color.gsub('#','')
    rgb = hex_color.scan(/../).map {|color| color.hex}
    rgb[0] = [(rgb[0].to_i + 255 * amount).round, 255].min
    rgb[1] = [(rgb[1].to_i + 255 * amount).round, 255].min
    rgb[2] = [(rgb[2].to_i + 255 * amount).round, 255].min
    "#%02x%02x%02x" % rgb
  end

  def require_login
    unless current_user
      redirect_to login_path, :flash => { :error => 'Please log in first!'}
    end
  end

  #input products list; output [product distance] in order of distance
  def dst_SortProducts(products)

    distances = []
    distProd = Hash.new

    products.each do |prod|
      if !distances.include? p_calculateDistance(prod)
        distances.push p_calculateDistance(prod)
        distProd[p_calculateDistance(prod)] = []
      end
      distProd[p_calculateDistance(prod)] = distProd[p_calculateDistance(prod)].push prod
    end

    distances.each do |d|
      distProd[d].sort!
    end

    distances.sort!
    sortedProducts = []
    distances.each do |d|
      sortedProducts.push *distProd[d]
    end
    return sortedProducts
  end

  #input products list; output [product distance] in order of distance
  #same algo as above
  def dst_SortStores(stores)
    distances = []
    distStores = Hash.new

    stores.each do |str|
      if !distances.include? s_calculateDistance(str)
        distances.push s_calculateDistance(str)
        distStores[s_calculateDistance(str)] = []
      end
      distStores[s_calculateDistance(str)] = distStores[s_calculateDistance(str)].push str
    end

    distances.each do |d|
      distStores[d].sort!
    end

    distances.sort!
    sortedStores = []
    distances.each do |d|
      sortedStores.push *distStores[d]
    end
    return sortedStores
  end

  #input products list; output [product distance] in order of distance
  #same algo as above
  def dst_SortMarkets(markets)
    distances = []
    distMark = Hash.new

    markets.each do |mkt|

      distMark[mkt] = m_calculateDistance(mkt)

    end
    sortedMarkets = []
    distMark.each do |key,value|
      puts key.name
      puts value
    end
    sorted_hash = distMark.sort_by {|_key, value| value}

    sorted_hash.each do |item|
      sortedMarkets.push item[0]
    end
    return sortedMarkets
  end

  def p_calculateDistance(product)
    distance = 12425 #fun trvia, farthest distance two cities can be in the world#returns the most closest market
    product.store.markets.each do |market|
      if Geocoder::Calculations.distance_between(Geocoder.coordinates(market.address + market.city + market.state), Geocoder.coordinates(remote_ip)) < distance #request.remote_ip instead of remote_ip
        distance = Geocoder::Calculations.distance_between(Geocoder.coordinates(market.address + market.city + market.state), Geocoder.coordinates(remote_ip))
      end
    end
    return distance
  end

  def s_calculateDistance(store)
    distance = 12425
    store.markets.each do |market|
      if Geocoder::Calculations.distance_between(Geocoder.coordinates(market.address + market.city + market.state), Geocoder.coordinates(remote_ip)) < distance#request.remote_ip instead of remote_ip
        distance = Geocoder::Calculations.distance_between(Geocoder.coordinates(market.address + market.city + market.state), Geocoder.coordinates(remote_ip))
      end
    end
    return distance
  end

  def m_calculateDistance(market)
    return distance = Geocoder::Calculations.distance_between(Geocoder.coordinates(market.address + market.city + market.state), Geocoder.coordinates(remote_ip)) #request.remote_ip instead of remote_ip
  end
end
