module ApplicationHelper
  def select_state_data
    CS.states(:us).collect{|k, v| [k.to_s + "-" + v, k.to_s] }
  end

  def select_city_data(state = "AK")
    CS.cities(state, :us)
  end
end
