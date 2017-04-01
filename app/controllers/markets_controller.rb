class MarketsController < ApplicationController
  include ApplicationHelper
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /markets
  # GET /markets.json
  def index
    @markets = Market.all
  end

  # GET /markets/1
  # GET /markets/1.json
  def show
    @market = Market.find(params[:id])
    @stores = @market.stores.all.paginate(page:1,per_page:6)
    @reviews = @market.reviews.all.paginate(page:1,per_page:5)
    @current_page = 1
    @review = Review.new(market_id: params[:id])
  end

  def ajax_reviews
    @market = Market.find(params[:id])
    @reviews = @market.reviews.all.paginate(page:params['current_review_page'].to_i + 1,per_page:5)

    respond_to do |format|
      format.html { render  partial: "reviews", locals: { reviews: @reviews }}
      format.json { render @reviews}
    end
  end

  def ajax_stores
    @market = Market.find(params[:id])
    @stores = @market.stores.all.paginate(page:params['current_store_page'].to_i + 1,per_page:6)
    respond_to do |format|
      format.html { render  partial: "stores", locals: { stores: @stores }}
      format.json { render @stores}
    end
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets
  # POST /markets.json
  def create
    @market = Market.new(name: params['market']['name'],
    city: params['market']['city'],
    state: params['market']['state'],
    zipcode: params['market']['zipcode'],
    rating: 0,
    description: params['market']['description'],
    open_time: timestampe_helper(params['open_day'], params['market']['open_time']),
    close_time: timestampe_helper(params['open_day'], params['market']['close_time']))
    respond_to do |format|
      if @market.save
        format.html { redirect_to @market, notice: 'Market was successfully created.' }
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render :new }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markets/1
  # PATCH/PUT /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to @market, notice: 'Market was successfully updated.' }
        format.json { render :show, status: :ok, location: @market }
      else
        format.html { render :edit }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_url, notice: 'Market was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      params.require(:market).permit(:city, :state, :zipcode, :rating, :description, :open_time, :close_time)
    end
end
