class BuyItemsController < ApplicationController
  
  def show
    @buy_item = BuyItem.find(params[:user_id])
  end
#
  #def index
  #  @stationery = Stationery.paginate(page: params[:page]).search(params[:search]).order(created_at: "DESC")
  #end
end
