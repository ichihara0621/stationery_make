class BuyItemsController < ApplicationController
  #before_action :logged_in_user, only: [:index, :create, :destroy]


  def bought
    user = current_user
    #user_all = User.all
    if user.status == 0
      @buy_items_admin = BuyItem.paginate(page: params[:page], per_page: 5).order(created_at: "DESC").where(receive: false, send_status: true)
    else user.status == 1
       from = Time.now - 24.hour
       to = Time.now
       @buy_items_user = current_user.buy_items.paginate(page: params[:page], per_page: 5).order(created_at: "DESC").where(created_at: from..to, receive: true)
    end 
  end

  def index
    @buy_item = BuyItem.where(user_id: current_user, send_status: false, receive: true)
  end

  def create
    
    BuyItem.transaction(joinable: false, requires_new: true) do
       item_id = BuyItem.select("id").where(user_id: current_user, send_status: false, receive: true).ids
       item_id.each do |k|
         BuyItem.find(k).toggle!(:send_status)
       end
     
       #paid_numberの発行
       PaidNumber.transaction do
          @paid_number = PaidNumber.new
          @max = PaidNumber.maximum(:id) + 1
          @paid_number = PaidNumber.new(id: @max)
          @paid_number.save!
       end
          
       #buy_itemsにpaid_numebrを入れる
       item_id.each do |k|
          @buy_item = BuyItem.find(k)
          @buy_item.update_attributes!(paid_number_id: @max)
       end
       
       #Stockの計算
       item_id.each do |s|
         buyitem = BuyItem.find(s)
         stationery_array = buyitem.stationery_id
         buy_count = buyitem.count

           Stock.transaction do
             @stock = Stock.find_by(stationery_id: stationery_array)
             stock_count = @stock.count
             new_stock = stock_count - buy_count
                if 0 > new_stock
                  flash[:notice] = "在庫数が不足しています"
                  redirect_to buy_items_path
                  
                end   
              @stock.update_attributes!(count: new_stock) 
              
           end
           #@stock.update_attributes!(count: new_stock)  
        end 
      
      end
      
        flash[:success] = "Stationery Buy"
            redirect_to stationery_index_url

    rescue => e
      @buy_item.destroy
      flash[:notice] = "在庫がなくなってしまいました"
        buy_items_path and return
        
       
  end

  def destroy
    BuyItem.find(params[:id]).destroy
    flash[:success] = "Stationery deleted"
    redirect_to buy_items_path
  end

  private

    
end
