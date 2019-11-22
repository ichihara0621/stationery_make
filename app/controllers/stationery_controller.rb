class StationeryController < ApplicationController
  
  def show
    @stationery = Stationery.find(params[:id])
    @buy_item = BuyItem.new
  end

  def new
    @stationery = Stationery.new
    @stationery.build_stock
  end
  
  def index
    @stationery = Stationery.paginate(page: params[:page]).search(params[:search]).order(created_at: "DESC")
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
    if @buy_item.save
      flash[:success] = "Buy Create"
      redirect_to buy_items_path
    else
      render 'new'
    end 
  end

  private

  def stationery_params
    params.require(:stationery).permit(:name, :price, :detail, :maker, category_ids: [],
    stock_attributes: [:id, :count])
  end

  def add_params
    params.require(:buy_item).permit(:count, :stationery_id, :user_id)
  end
  
end
