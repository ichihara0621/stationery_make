class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def edit
    @user  = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Stationery App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def bought
    user = current_user
    if user.status == 0
      @buy_items = BuyItem.paginate(page: params[:page]).order(created_at: "DESC").where(receive: false, send_status: true)


    else
       from = Time.now - 24.hour
       to = Time.now
       @buy_items = current_user.buy_items.paginate(page: params[:page]).order(created_at: "DESC").where(created_at: from..to, receive: true)
    end 
  end

  def leave
    user = current_user
    if user.update_attribute(:status, 2)
       flash[:success] = "またのご利用お待ちしております。"
       session[:user] = nil 
       redirect_to stationery_index_path
    else
      render 'new'
    end
  end


  def cancel
    #user = current_user
    buy_item = BuyItem.find(params[:id])
    if buy_item.update_attribute(:receive, false)
       flash[:success] = "注文を取り消しました"
       redirect_to bought_path
    else
      render 'new'
    end
  end

  def stop
     BuyItem.transaction do
        buy_item = BuyItem.find(params[:id])
        debugger
        return_count = buy_item.count
        stationery_array = buy_item.stationery_id
        @stock = Stock.find_by(stationery_id: stationery_array)
        stock_count = @stock.count
        new_stock = stock_count + return_count
        @stock.update_attributes!(count: new_stock) 
     
         if buy_item.update_attribute(:send_status, false)
            flash[:success] = "配送を中止します"
            redirect_to bought_path
         else
           render 'new'
         end
     end
   
     rescue =>e
      render 'new'
  end

  # パスワード再設定の属性を設定する
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :address, :password,
                                   :password_confirmation)
    end

    

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
