class StationeryController < ApplicationController
  before_action :logged_in_user, only: [:add]
  before_action :admin_user, only: [:create, :edit, :new, :update, :destroy]


  def show
    @stationery = Stationery.find(params[:id])
    @buy_item = BuyItem.new
  end

  def new
    @stationery = Stationery.new
    @stationery.build_stock
    @stationery.build_ranking
  end
  
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @stationery = @category.stationeries.paginate(page: params[:page]).order(created_at: "DESC").all
    else
      @stationery = Stationery.paginate(page: params[:page]).search(params[:search]).order(created_at: "DESC")
    end
  end

  def destroy
    Stationery.find(params[:id]).destroy
    flash[:success] = "Stationery deleted"
    redirect_to stationery_index_url
  end
  
  def create
    @stationery = Stationery.new(stationery_params)
    if @stationery.save
      flash[:success] = "Stationery Create"
      redirect_to stationery_url(@stationery)
    else
      render 'new'
    end
  end

  def edit
    @stationery = Stationery.find(params[:id])
  end
 
  def update
    @stationery = Stationery.find(params[:id])
    if @stationery.update_attributes(stationery_params)
      flash[:success] = "Stationery Updated"
      redirect_to @stationery
    else
      render 'edit'
    end
  end

  def add 
    @buy_item = BuyItem.new(add_params)
    stationery_id = @buy_item.stationery_id
    buy_count = @buy_item.count
    @stock = Stock.find_by(stationery_id: stationery_id)
    stock_count = @stock.count

    if buy_count.nil?
      flash[:success] = "購入数を入れてください"
      redirect_to stationery_url(stationery_id)
    elsif
      0 >=  buy_count
      flash[:success] = "いじわるしないでください"
      redirect_to stationery_url(stationery_id)
    else
       if stock_count >= buy_count 
          @buy_item.save
            flash[:success] = "Buy Create"
            redirect_to buy_items_path
          
       else flash[:notice] = "在庫数が不足しています"
            redirect_to stationery_url(stationery_id)
       end 
    end
    
  end

  private

  def stationery_params
    params.require(:stationery).permit(:name, :price, :detail, :maker,
      category_ids: [],
    stock_attributes: [:id, :count], ranking_attributes: [:id, :total_count])
  end

  def add_params
    params.require(:buy_item).permit(:count, :stationery_id, :user_id)
  end

  def admin_user
    if current_user.nil?
      redirect_to signup_path 
    else
      redirect_to(root_url) unless current_user.status == 0
    end
  end
  
end
