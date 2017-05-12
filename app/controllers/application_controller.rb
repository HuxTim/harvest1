class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper
  include ProductsHelper

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '129.64.121.237'
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
    render "layouts/error_page"
  end
end
