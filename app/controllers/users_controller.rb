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
    from = Time.now - 24.hour
    to = Time.now
    @buy_items = current_user.buy_items.paginate(page: params[:page]).order(created_at: "DESC").where(created_at: from..to)
  end

  def leave
    user = current_user
    if user.update_attribute(:status, 2)
       flash[:success] = "またのご利用お待ちしております。"
       redirect_to stationery_index_path
    else
      render 'new'
    end
  end


  def cancel
    #user = current_user
    debugger
    buy_items = BuyItem.find(params[:id])
    if buy_items.update_attribute(:receive, fault)
       flash[:success] = "注文を取り消しました"
       redirect_to bought_path
    else
      render 'new'
    end
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
