class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :update_password, :markets, :change_password,:requests, :reviews, :shopping_list]
  before_action :require_login, only: [:edit, :update, :show,:change_password,:update_password, :update,:markets,:requests,:reviews]
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
    render :show, locals: { user: @user = @user, board: board = "dashboard",item: @items}
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
    render :show, locals: { user: @user = @user, board: board = "change_password"}
  end


  def shopping_list
    @valid = !params[:date].empty? && !params[:hour1].empty? && !params[:hour2].empty?
    if @valid
      @hour1 = to_timestamp(params[:date], params[:hour1])
      @hour2 = to_timestamp(params[:date], params[:hour2])
      if @hour2 > @hour1
        @schedule = getList(@hour1, @hour2)
      end
    end
    render :show, locals: { user: @user = @user, board: board = "shopping_list", item: @items }
  end

  def markets
    render :show, locals: { user: @user = @user, board: board = "markets"}
  end

  def reviews
    render :show, locals: { user: @user = @user, board: board = "reviews"}
  end

  def requests
    render :show, locals: { user: @user = @user, board: board = "requests"}
  end

  def bevendor
    render :show, locals: { user: @user = @user, board: board = "bevendor"}
  end

  private

    def getMarketsAvailable(hour1, hour2)
      markets = []
      Market.all.each do |mkt|
        if mkt.close_time > hour1 && mkt.open_time < hour2
          markets.push(mkt)
        end
      end
      return markets
    end

    def getMarketProducts(markets)
      marketproducts = Hash.new
      #make an empty array to contain all products for each market using a HT
      markets.each do |mkt|
        marketproducts[mkt] = []
      end
      #fill each array in each hash
      markets.each do |mkt|
        #go through each store in each market
        mkt.stores.each do |str|
          str.products.each do |pdt|
            marketproducts[mkt].push(pdt)
          end
        end
      end
      return marketproducts
    end

    def getList(hour1, hour2)
      @list = Hash.new
      @schedule = Hash.new
      @marketproducts = getMarketProducts(getMarketsAvailable(0, 1000000)) #HT with market => products

      if @marketproducts.empty?
        return @schedule
      end

      #search through all markets
      @marketproducts.each do |mkt, products|
        @schedule[mkt] = Hash.new
        #search through the list
        ShoppingList.where(:user_id => @user.id).each do |item|
        #search through all products at the market for each item in the shopping list
          #if items are nominally similar, for now eql works because of the way the data is seeded but for improvement there should be a feature to have different comparison styles
          products.each do |prod|
            if prod.name.eql? item.product.name
              if @list[item].nil?
                @list[item] = prod
                #replace the existing item if another item is more popular
              elsif !prod.popularity.nil? and !@list[item].popularity.nil?
                if @list[item].popularity < prod.popularity
                @list[item] = prod
                end
              end
            end
          end
        end

        @list.each do |s_item, item|
          if @schedule[mkt][item.store].nil?
            @schedule[mkt][item.store] = [item]
          else
            @schedule[mkt][item.store].push(item)
          end
        end
        @list = Hash.new
      end
      return @schedule
    end

    def user_shopping_list
      @schedule = {:date => "", :hour1 => "", :hour2 => ""}
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

    def to_timestamp(date, hour)
      (hour_hash[hour]*3600+day_hash[date]*86400)
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
