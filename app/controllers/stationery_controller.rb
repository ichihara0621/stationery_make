class StationeryController < ApplicationController
  
  def show
    @stationery = Stationery.find(params[:id])
    #@stationery_categories = @stationery.stationery_categories.paginate(page: params[:page])    
    #@categories = @stationery_categories.categories.paginate(page: params[:page])
  end

  def new
    @stationery = Stationery.new
  end
  
  def index
    @stationery = Stationery.paginate(page: params[:page]).search(params[:search]).order(created_at: "DESC")
     
    if params[:category].present?
      @stationery = Stationery.paginate(page: params[:page]).search(params[:category]).order(created_at: "DESC")
     end
  end

  def delete
  end
  
  
  

end
