class BuyItemsController < ApplicationController
  
  def index
    @buy_item = BuyItem.where(user_id: current_user, send_status: false, receive: true)
  end

  def create
    item_id = BuyItem.select("id").where(user_id: current_user, send_status: false, receive: true)

    item_id.each do |k|
      BuyItem.find_by(id: k).toggle!(:send_status)
    end
    
    if 
      flash[:success] = "Stationery Buy"
      redirect_to stationery_index_url
    else
      render 'new'
    end
  end

end
