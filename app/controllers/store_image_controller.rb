class StoreImageController < ApplicationController
  before_action :set_store, only: [:ajax_create]
  before_action :set_store_image, only: [:ajax_destory]
  before_action :require_login, only: [:ajax_create, :ajax_destory]

  def ajax_create
    @store_image = @store.store_images.create(store_images_params)
    if @store_image.save
      render json: { message: "success" }, :status => 200
    else
      render json: { error: @store_image.errors.full_messages.join(',')}, :status => 400
    end
  end

  def ajax_destory
    @store_image.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_store_image
    @store_image = StoreImage.find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_image][:store_id])
  end

  def store_images_params
    params.require(:store_image).permit(:image)
  end
end
