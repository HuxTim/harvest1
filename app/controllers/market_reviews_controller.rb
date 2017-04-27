class MarketReviewsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]


  def create
    @market_review = MarketReview.create(market_reviews_params)
    @market_review.user_id = current_user.id
    respond_to do |format|
      if @market_review.save
        format.html { redirect_to @market_review.market, notice: 'Reviews was successfully submitted.' }
        format.json { render :show, status: :created, location: @market_review }
      else
        format.html { redirect_to @market_review.market, :flash => { :error => @market_review.errors.map{|k,v| "#{k} #{v}"}.join(',') }   }
        format.json { render json: @market_review.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def market_reviews_params
      params.require(:market_review).permit(:comment,:rating,:market_id)
    end

    def require_login
      unless current_user
        redirect_to login_path, notice: 'Please log in first!'
      end
    end
end
