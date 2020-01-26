class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user &.authenticate(params[:session][:password])
      flash[:success] = 'You succesffully logged in.'
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      flash.now[:danger] = 'Invalid username. Please try again.'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
