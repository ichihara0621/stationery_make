class RankingsController < ApplicationController
  
  def index
    @rankings = Ranking.includes(:stationeries).paginate(page: params[:page]).order(total_count: "DESC")
  end

  def update
    
  end

end
