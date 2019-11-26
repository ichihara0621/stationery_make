class RankingsController < ApplicationController
  
  def index
    @rankings = Ranking.paginate(page: params[:page]).order(total_count: "DESC")
  end

  def update
    stationery_rank = Ranking.find()
    
      item_id.each do |s|
         buyitem = BuyItem.find(s)
         stationery_array = buyitem.stationery_id
         buy_count = buyitem.count
   
         @stock = Stock.find_by(stationery_id: stationery_array)
         stock_count = @stock.count
         new_stock = stock_count - buy_count
         @stock.update_attributes(count: new_stock) 

end
