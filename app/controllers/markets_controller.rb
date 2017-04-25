class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  # GET /markets
  # GET /markets.json
  def addstore
    @store = Store.find(params['store_id'])
    respond_to do |format|
      if @store.update(market_id: @market.id)
        format.html { redirect_to @market, notice: 'Store was successfully added.' }
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render :new }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @markets = Market.all
  end

  # GET /markets/1
  # GET /markets/1.json
  def show
    @market = Market.find(params[:id])
    @stores = @market.stores.all.paginate(page:1,per_page:6)
    @reviews = @market.market_reviews.all.order("created_at DESC").paginate(page:1,per_page:5)
    @current_page = 1
    @review = @market.market_reviews.new(market_id: params[:id])
  end

  def ajax_reviews
    @market = Market.find(params[:id])
    @reviews = @market.market_reviews.all.order("created_at DESC").paginate(page:params['current_review_page'].to_i + 1,per_page:5)

    respond_to do |format|
      format.html { render  partial: "shared/reviews", locals: { reviews: @reviews }}
      format.json { render @reviews}
    end
  end

  def ajax_stores
    @market = Market.find(params[:id])
    @stores = @market.stores.all.paginate(page:params['current_store_page'].to_i + 1,per_page:6)
    respond_to do |format|
      format.html { render  partial: "shared/stores", locals: { stores: @stores }}
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
    @market = Market.new(market_params)
    @market.user_id = current_user.id
    @market.rating = 0
    respond_to do |format|
      if @market.save
        format.html { redirect_to @market, notice: 'Market was successfully created.' }
        format.json { render json: {market_id: @market.id}}
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
      params.require(:market).permit(:city, :state, :zipcode, :description, :open_time => timestampe_helper(params['open_day'], params['market']['open_time']), :close_time => timestampe_helper(params['open_day'], params['market']['close_time']))
    end

    def require_login
      unless current_user
        redirect_to login_path, notice: 'Please log in first!'
      end
    end
end
