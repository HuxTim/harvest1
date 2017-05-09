class ProductImageController < ApplicationController
  before_action :set_product, only: [:ajax_create]
  before_action :set_product_image, only: [:ajax_destory]
  before_action :require_login, only: [:ajax_create, :ajax_destory]

  def ajax_create
    @product_image = @product.product_images.create(product_images_params)
    if @product_image.save
      render json: { message: "success" }, :status => 200
    else
      render json: { error: @product_image.errors.full_messages.join(',')}, :status => 400
    end
  end

  def ajax_destory
    @product_image.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product_image
    @product_image = ProductImage.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_image][:product_id])
  end

  def product_images_params
    params.require(:product_image).permit(:image)
  end
end
