class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  include ProductsHelper

  def index
    @products = Product.all
  end

  def show
    if !@product.popularity
      @product.update(popularity: 1)
    else
      @product.update(popularity: @product.popularity + 1)
    end
    respond_to do |format|
      format.html { render  partial: "products/show", locals: { products: @product }}
      format.json { render @products}
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @tags = tag_list
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.popularity = 0;
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product.store, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else

        format.html { redirect_to @product.store, :flash => { :error => @product.errors.map{|k,v| "#{k} #{v}"}.join(',') }   }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product.store, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { redirect_to @product.store, :flash => { :error => @product.errors.map{|k,v| "#{k} #{v}"}.join(',') }  }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @store = @product.store
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @store, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params[:product][:tag] = params[:product][:tag].reject { |i| i.empty? }.join(",")
    if params[:price_number]
      params[:product][:price] = params[:price_number] + "/" + params[:product][:price]
    else
      params[:product][:price] = nil
    end
    params.require(:product).permit(:group,:store_id, :name, :quantity, :price, :description, :tag, :is_special)
  end
end
