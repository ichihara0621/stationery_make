class StationeryController < ApplicationController
  
  def show
    @stationery = Stationery.find(params[:id])
  end

  def new
    @stationery = Stationery.new
  end
  
  def index
    @stationery = Stationery.paginate(page: params[:page]).search(params[:search]).order(created_at: "DESC")
  end

end
