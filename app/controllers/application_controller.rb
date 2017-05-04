class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper
  include ProductsHelper

  def cities
    state = params[:state]
    respond_to do |format|
      format.json { render json: {cities: CS.cities(state)}}
      format.html { render json: {cities: CS.cities(state)}}
    end
  end

  def error
    status_code = params[:code] || 500
    render partial: "shared/error_page",
  end
end
