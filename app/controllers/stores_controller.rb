class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = Store.find(params[:id])
    @products = @store.products.all.paginate(page:1,per_page:6)
    @reviews = @store.store_reviews.all.order("created_at DESC").paginate(page:1,per_page:5)
    @current_page = 1
    @review = StoreReview.new(store_id: params[:id])
  end

  def ajax_reviews
    @store = Store.find(params[:id])
    @reviews = @store.store_reviews.all.order("created_at DESC").paginate(page:params['current_review_page'].to_i + 1,per_page:5)
    respond_to do |format|
      format.html { render  partial: "reviews", locals: { reviews: @reviews }}
      format.json { render @reviews}
    end
  end

  def ajax_products
    @store = Store.find(params[:id])
    @products = @store.products.all.paginate(page:params['current_product_page'].to_i + 1,per_page:6)
    respond_to do |format|
      format.html { render  partial: "products", locals: { products: @products }}
      format.json { render @products}
    end
  end

  # GET /stores/new
  def new
    #need to be change
    @store = Store.new()
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    # puts current_user
    # puts current_user.name
    @store = Store.new(name: params['store']['name'],
    market_id: 23,
    vendor_id: current_user.vendors.all.first.id,
    description: params['store']['description'],
    open_time: timestampe_helper(params['open_day'], params['store']['open_time']),
    close_time: timestampe_helper(params['open_day'], params['store']['close_time']))


    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render json: {store_id: @store.id}}
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    @store.name = params['store']['name']
    @store.description = params['store']['description']
    @store.open_time = timestampe_helper(params['open_day'], params['store']['open_time'])
    @store.close_time = timestampe_helper(params['open_day'], params['store']['close_time'])
    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @market =   @store.market
    @store.destroy
    respond_to do |format|
      format.html { redirect_to @market , notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:description, :open_time, :close_time)
    end

    def require_login
      unless current_user
        redirect_to login_path, notice: 'Please log in first!'
      end
    end
end
