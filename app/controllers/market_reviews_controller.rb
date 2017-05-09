class MarketReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]
  # before_action :require_login, only: [:create, :destroy]

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

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_review
      @review = MarketReview.find(params[:id])
    end

    def market_reviews_params
      params.require(:market_review).permit(:comment,:rating,:market_id)
    end
end
