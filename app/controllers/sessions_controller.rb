class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user.nil?

      flash[:success] = 'Invalid email/password combination'
      redirect_to signup_path 
    else  
      if
      user.status == 2 
       flash[:success] = '新しいアカウントを作ってください'
       redirect_to signup_path 
        
      else
         if user && user.authenticate(params[:session][:password])
            log_in user
            redirect_to user
         else
           flash.now[:danger] = 'Invalid email/password combination'
           render 'new'
         end
        end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
