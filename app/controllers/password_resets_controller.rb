#class PasswordResetsController < ApplicationController
  #def new
  #end
#
  #def edit
  #end
#
  #def create
  # @user = User.find_by(email: params[:password_reset][:email].downcase)
  #  if @user
  #    @user.create_reset_digest
  #    @user.send_password_reset_email
  #    flash[:info] = "Email sent with password reset instructions"
  #    redirect_to edit_password_reset
  #  else
  #    flash.now[:danger] = "Email address not found"
  #    render 'new'
  #  end
  #end
#
  #def update
  #  if params[:user][:password].empty?                  # (3) への対応
  #    @user.errors.add(:password, :blank)
  #    render 'edit'
  #  elsif @user.update_attributes(user_params)          # (4) への対応
  #    log_in @user
  #    flash[:success] = "Password has been reset."
  #    redirect_to @user
  #  else
  #    render 'edit'                                     # (2) への対応
  #  end
  #end
#
  #private
#
  #  def get_user
  #    @user = User.find_by(email: params[:email])
  #  end
#
  #  # 正しいユーザーかどうか確認する
  #  def valid_user
  #    unless (@user && @user.activated? &&
  #            @user.authenticated?(:reset, params[:id]))
  #      redirect_to edit_password_reset
  #    end
  #  end
#en#d
#