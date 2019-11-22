class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

# 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_stationery
    if  @stationery = Stationery.find(params[:id])

    end
  end

end
