class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :update_password, :markets, :requests, :reviews, :shopping_list]
  before_action :require_login, only: [:edit, :update, :show,:update_password, :update,:markets,:requests,:reviews]
  before_action :user_shopping_list, only: [:show, :shopping_list]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    render :show, locals: { user: @user = @user, board: board = "dashboard"}
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    render :show, locals: { user: @user = current_user, board: board = "edit"}
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_reset_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :show, locals: { user: @user, board: board = "edit"} }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password
    @user = User.find(params[:id])
    if @user &&  @user.authenticate(params[:user][:old_password])
      if @user.update(user_reset_password_params)
        redirect_to @user, notice: 'Password was successfully changed.'
      else
        render :show, locals: { user: @user, board: board = "change_password"}
      end
    else
      @user.errors.add(:password, "Password Wrong")
      render :show, locals: { user: @user, board: board = "change_password"}
    end
  end

  def change_password
    render :show, locals: { user: @user = current_user, board: board = "change_password"}
  end


  def shopping_list
    render :show, locals: { user: @user = current_user, board: board = "shopping_list"}
  end

  def markets
    render :show, locals: { user: @user = current_user, board: board = "markets"}
  end

  def reviews
    render :show, locals: { user: @user = current_user, board: board = "reviews"}
  end

  def requests
    render :show, locals: { user: @user = current_user, board: board = "requests"}
  end

  def bevendor
    render :show, locals: { user: @user = current_user, board: board = "bevendor"}
  end

  private

    def user_shopping_list
      @meats = []
      @grains = []
      @vegetables = []
      @fruits = []
      @misc = []
      @items = [@vegetables, @fruit, @grains, @meats, @misc]
      ShoppingList.where(:user_id => @user.id).each do |item|
        if item.product.group.eql? "Vegetable"
          @vegetables.push(item)
        elsif item.product.group.eql? "Fruit"
          @fruit.push(item)
        elsif item.product.group.eql? "Grain"
          @grains.push(item)
        elsif item.product.group.eql? "Meat"
          @meats.push(item)
        else item.product.group.eql? "Misc."
          @misc.push(item)
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,
                        :zipcode)
    end

    def user_reset_params
      params.require(:user).permit(:name,:zipcode)
    end

    def user_reset_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
