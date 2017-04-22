class StoreMarketRelationshipsController < ApplicationController
  before_action :set_store_market_relationship, only: [:show, :edit, :update, :destroy]

  # GET /store_market_relationships
  # GET /store_market_relationships.json
  def index
    @store_market_relationships = StoreMarketRelationship.all
  end

  # GET /store_market_relationships/1
  # GET /store_market_relationships/1.json
  def show
  end

  # GET /store_market_relationships/new
  def new
    @store_market_relationship = StoreMarketRelationship.new
  end

  # GET /store_market_relationships/1/edit
  def edit
  end

  # POST /store_market_relationships
  # POST /store_market_relationships.json
  def create
    @store_market_relationship = StoreMarketRelationship.new(store_market_relationship_params)

    respond_to do |format|
      if @store_market_relationship.save
        format.html { redirect_to @store_market_relationship, notice: 'Store market relationship was successfully created.' }
        format.json { render :show, status: :created, location: @store_market_relationship }
      else
        format.html { render :new }
        format.json { render json: @store_market_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_market_relationships/1
  # PATCH/PUT /store_market_relationships/1.json
  def update
    respond_to do |format|
      if @store_market_relationship.update(store_market_relationship_params)
        format.html { redirect_to @store_market_relationship, notice: 'Store market relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_market_relationship }
      else
        format.html { render :edit }
        format.json { render json: @store_market_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_market_relationships/1
  # DELETE /store_market_relationships/1.json
  def destroy
    @store_market_relationship.destroy
    respond_to do |format|
      format.html { redirect_to store_market_relationships_url, notice: 'Store market relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_market_relationship
      @store_market_relationship = StoreMarketRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_market_relationship_params
      params.fetch(:store_market_relationship, {})
    end
end
