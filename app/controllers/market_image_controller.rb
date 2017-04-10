class MarketImageController < ApplicationController
  # before_action :set_market_image, only: [:ajax_create, :edit, :update, :destroy]
  before_action :set_market, only: [:ajax_create, :edit, :update, :destroy, :new]

  def ajax_create
    market_images_params.each {|para| print para}
    @market_image = @market.market_images.create(market_images_params)
    if @market_image.save
      render json: { message: "success" }, :status => 200
    else
      render json: { error: @market_image.errors.full_messages.join(',')}, :status => 400
    end
  end


private
# Use callbacks to share common setup or constraints between actions.
def set_market_image
  @market_image = MarketImage.find(params[:id])
end

def set_market
  @market = Market.find(params[:market_image][:market_id])
end

def market_images_params
  params.require(:market_image).permit(:image)
end
end
