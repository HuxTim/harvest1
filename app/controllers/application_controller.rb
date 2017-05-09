class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper
  include ProductsHelper


  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '129.64.133.110'
    else
      request.remote_ip
    end
  end

  def cities
    state = params[:state]
    respond_to do |format|
      format.json { render json: {cities: CS.cities(state)}}
      format.html { render json: {cities: CS.cities(state)}}
    end
  end

  def error
    @status_code = params[:code] || 500
    @p = Geocoder::Calculations.distance_between(Geocoder.coordinates(Market.first.address + Market.first.city + Market.first.state), Geocoder.coordinates(remote_ip)) #request.remote_ip instead of remote_ip
    render "layouts/error_page"
  end
end
