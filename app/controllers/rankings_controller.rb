class RankingsController < ApplicationController
  
  def index
    #@rankings = Ranking.update_all(total_count: 0)
    ##@rankings.save
    #from = Time.yesterday
    #     to = Time.today
    #     hash_buy_count = BuyItem.where(created_at: from..to).group(:stationery_id).sum(:count)
    #     #ランキングに個数埋め込み
    ##文房具ごとの購入数
    ##hash_buy_count = BuyItem.group(:stationery_id).sum(:count)
    #
    ##ランキングに個数埋め込み
    #hash_buy_count.each{|key, value|
    #@rankings = Ranking.find_by(stationery_id: key)
    #  @rankings.update_attributes(total_count: value)
    # }
    @rankings = Ranking.limit(10).order(total_count: "DESC")
  end

end
