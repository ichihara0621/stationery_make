class StationeryController < ApplicationController
  
  def show
    @stationery = Stationery.find(params[:id])
  end

  def new
    @stationery = Stationery.new
    @stationery.build_stock
  end
  
  def index
    #@stationery = Stationery.paginate(page: params[:page]).search(params[:search]).order(created_at: "DESC")
     if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
       
      # category_idと紐づく投稿を取得
      @stationery = @category.stationery.order(created_at: :desc).all
    else
      # 投稿すべてを取得
      @stationery = Stationery.paginate(page: params[:page]).search(params[:search]).order(created_at: "DESC")
    end
    #if params[:category].present?
    #  @stationery = Stationery.paginate(page: params[:page]).search(params[:category]).order(created_at: "DESC")
    # end
  end

  def destroy
    Stationery.find(params[:id]).destroy
    flash[:success] = "Stationery deleted"
    redirect_to stationery_index_url
  end
  
  def create
    @stationery = Stationery.new(stationery_params)
    if @stationery.save
      flash[:success] = "Stationery Create"
      redirect_to stationery_url(@stationery)
    else
      render 'new'
    end
  end

  def edit
    @stationery = Stationery.find(params[:id])
  end
 
  def update
    @stationery = Stationery.find(params[:id])
    if @stationery.update_attributes(stationery_params)
      flash[:success] = "Stationery Updated"
      redirect_to @stationery
    else
      render 'edit'
    end
  end



  private

  def stationery_params
    params.require(:stationery).permit(:name, :price, :detail, :maker, category_ids: [],
    stock_attributes: [:id, :count])
  end
  
  

end
