class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  # GET /searches
  # GET /searches.json
  def index
    #Does a full text search on each model: Products, Markets, and Stores.
    query = preprocess(params[:q])
    if query == nil or query == ""
      query = nil
    end
    @query = params[:q]
    @page = 0

    # search products
    @search = Product.solr_search do
       fulltext params[:q]
       paginate :page => 1, :per_page => Product.all.count
     end
    @products = @search.results

    if params[:tag].present?
      tag = params[:tag]
      @products = @products.select{ |product| product.tag.include?(tag)}
    end

    if params[:group].present?
      gro = params[:group]
      @products = @products.select{ |product| product.group.include?(gro)}
    end

    # search stores
    @search = Store.solr_search do
        fulltext query
        paginate :page => 1, :per_page => Store.all.count
    end
    @stores = @search.results

    # search markets
    @search = Market.solr_search do
       fulltext query
       paginate :page => 1, :per_page => Market.all.count
    end
    @markets =  @search.results

    #Filters results based on selected option.
    if params[:option] == "Stores"
        @markets = []
        @products= []
        render "stores/index"
    elsif params[:option] == "Products"
        @markets = []
        @stores= []
        @results = @products
        render "index"
    elsif params[:option] == "Markets"
        @products = []
        @stores= []
        render "markets/index"
    else
        render "index"
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.fetch(:search, {})
    end

    def preprocess(query)
      require 'rubygems'
      require 'fast_stemmer'
      # queries = query.split(" ").each do |word|
      #   if word == nil
      #     word = ""
      #   end
      #   Stemmer::stem_word(word)
      # end
      if query == nil
        query = ""
      end
      Stemmer::stem_word(query)
 # -> 'run'
    end
end
