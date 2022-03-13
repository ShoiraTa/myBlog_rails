class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:success] = 'You have succesfully loged in'  
    redirect_to user_url(user)
   else 
    flash.now[:danger] = 'Something was wrong '  
    render 'new'   
   end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have loged out'
    redirect_to root_path
  end
end