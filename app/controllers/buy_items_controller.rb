class BuyItemsController < ApplicationController
  
  def index
    @buy_item = BuyItem.where(user_id: current_user, send_status: false, receive: true)
  end

  def create
    BuyItem.transaction do
       item_id = BuyItem.select("id").where(user_id: current_user, send_status: false, receive: true).ids
       item_id.each do |k|
         BuyItem.find(k).toggle!(:send_status)
       end
     
       @paid_number = PaidNumber.new
       @max = PaidNumber.maximum(:id) + 1
       @paid_number = PaidNumber.new(id: @max)
       @paid_number.save
       
       item_id.each do |k|
         @buy_item = BuyItem.find(k)
         @buy_item.update_attributes(paid_number_id: @max)
       end
       
       item_id.each do |s|
         buyitem = BuyItem.find(s)
         stationery_array = buyitem.stationery_id
         buy_count = buyitem.count
   
         @stock = Stock.find_by(stationery_id: stationery_array)
         stock_count = @stock.count
         new_stock = stock_count - buy_count
         @stock.update_attributes(count: new_stock) 
       end
       
         flash[:success] = "Stationery Buy"
         redirect_to stationery_index_url
    end

    rescue =>e
      render 'new'
       
  end

  def destroy
    BuyItem.find(params[:id]).destroy
    flash[:success] = "Stationery deleted"
    redirect_to buy_items_path
  end

  private


end
