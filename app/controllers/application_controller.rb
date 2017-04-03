class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def cities
    state = params[:state]
    respond_to do |format|
      format.json { render json: {cities: CS.cities(state)}}
      format.html { render json: {cities: CS.cities(state)}}
    end
  end

  def index
      @search = Product.ransack(params[:q])
      @products = @search.result
  end
end
