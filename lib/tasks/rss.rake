# lib/tasks/rss.rake
#require "#{Rails.root}/app/models/buy_item"
#require "#{Rails.root}/app/models/ranking"
#require "#{Rails.root}/app/models/stationery"

namespace :rss do
  desc "上位10個を算出する"
  task total_buy_count: :environment do

   class RankingBatch
      def self.execute
       Ranking.transaction do
        @rankings = Ranking.update_all(total_count: 0)
         #文房具ごとの購入数
         from = Time.ago(2.days)
         to = Time.yesterday
         hash_buy_count = BuyItem.where(created_at: from..to).group(:stationery_id).sum(:count)
         #ランキングに個数埋め込み
         
         #if hash_buy_count.stationery_id.present?
         hash_buy_count.each{|key, value|
         @rankings = Ranking.find_by(stationery_id: key)
           @rankings.update_attributes(total_count: value)
          }
       end

       rescue =>e
         render 'new'
      end
   end
   RankingBatch.execute
  end
end