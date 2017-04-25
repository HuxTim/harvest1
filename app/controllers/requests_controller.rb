class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new(store_id: current_user.vendor.store.id,market_id: params[:market_id])
    respond_to do |format|
        format.html { render  partial: "new", locals: { request: @request }}
    end
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.status = 0
    @request.open_time = 0
    @request.close_time = 0
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request.market, notice: 'Application was successfully send.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { redirect_to @request.market, :flash => { :error => @request.errors.map{|k,v| "#{k} #{v}"}.join(',') }  }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:open_time,:close_time,:market_id,:store_id)
    end
end
