class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper
  def cities
    state = params[:state]
    respond_to do |format|
      format.json { render json: {cities: CS.cities(state)}}
      format.html { render json: {cities: CS.cities(state)}}
    end
  end

end
