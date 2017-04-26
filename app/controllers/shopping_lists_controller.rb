class ShoppingListsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]


  # Huiming Jia, implement add and delete shop list function directly on product card don't detele
  def create
    @shopping_list = ShoppingList.create(product_id: params[:product_id],
    user_id: current_user.id)

    respond_to do |format|
      if @shopping_list.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render json: {notice: 'Add successfully.'}}
      else
        format.html { render :new }
        format.json { render json: {statue: :unprocessable_entity}}
      end
    end
  end

  def destroy
    @shopping_list = ShoppingList.where(product_id: params[:id],
    user_id: current_user.id).all.first
    respond_to do |format|
      if @shopping_list and @shopping_list.user_id == current_user.id
        @shopping_list.destroy
        format.json { render json: {notice: 'Delete successfully.'} }
      else
        format.json { render json: {statue: :unprocessable_entity} }
      end
    end
  end

  private
    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
    end

    def require_login
      unless current_user
        redirect_to login_path, notice: 'Please log in first!'
      end
    end
end
