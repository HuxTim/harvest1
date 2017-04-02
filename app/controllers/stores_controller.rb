class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

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
    @current_page = 1
  end

  def ajax_reviews
    # @store = Store.find(params[:id])
    # @reviews = @store.reviews.all.paginate(page:params['current_review_page'].to_i + 1,per_page:5)
    #
    # respond_to do |format|
    #   format.html { render  partial: "reviews", locals: { reviews: @reviews }}
    #   format.json { render @reviews}
    # end
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
    @store = Market.find(params['market_id']).stores.new()
    puts @store.market_id
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Market.find(params['id']).store.new()
    

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
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
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
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
end
