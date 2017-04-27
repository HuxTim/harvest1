class StoreReviewsController < ApplicationController
  before_action :require_login, only: [:create]
  before_action :require_login, only: [:create, :destroy]

  def create
    @store_review = StoreReview.create(store_reviews_params)
    @store_review.user_id = current_user.id
    respond_to do |format|
      if @store_review.save
        format.html { redirect_to @store_review.store, notice: 'Reviews was successfully submitted.' }
        format.json { render :show, status: :created, location: @store_review }
      else
        format.html { redirect_to @store_review.store, :flash => { :error => @store_review.errors.map{|k,v| "#{k} #{v}"}.join(',') }   }
        format.json { render json: @store_review.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def store_reviews_params
      params.require(:store_review).permit(:comment,:rating,:store_id)
    end

    def require_login
      unless current_user
        redirect_to login_path, notice: 'Please log in first!'
      end
    end
end
