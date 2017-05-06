class SubscriptionsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  before_action :set_subscriptions, only: [:destroy]


  def index

  end

  # Huiming Jia, implement add and delete shop list function directly on product card don't detele
  def create
    @subscription = Subscription.create(vendor_id: Store.find(params[:store_id]).vendor_id,
    user_id: current_user.id)

    respond_to do |format|
      if @subscription.save
        format.json { render json: {statue: 'Add successfully.'}}
      else
        format.json { render json: {statue: 'Something Wrong.'}}
      end
    end
  end

  def destroy
    @subscription = Subscription.find(@subscription.id)
    respond_to do |format|
      if @subscription and @subscription.user_id == current_user.id
        @subscription.destroy
        format.json { render json: {notice: 'Delete successfully.'} }
      else
        format.json { render json: {statue: :unprocessable_entity} }
      end
    end
  end

  private
    def set_subscriptions
      @subscription = Subscription.find(params[:id])
    end

    def require_login
      unless current_user
        redirect_to login_path, notice: 'Please log in first!'
      end
    end
end
