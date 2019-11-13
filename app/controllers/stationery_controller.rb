class StationeryController < ApplicationController
  
  def show
    @books = Book.find(params[:id])
  end

  def new
    @books = Book.new
  end
  
end
