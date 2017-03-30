module ApplicationHelper
  def state_list
    CS.states(:in).keys.collect{|x| x.to_s }
  end

  def city_list(state = " ")
    CS.states(:state, :us)
  end
end
