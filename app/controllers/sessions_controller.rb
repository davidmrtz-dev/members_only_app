class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      flash[:success] = 'You succesffully logged in.'
      log_in user
      redirect_to user
    else
      flash.now[:failure] = 'Invalid username. Please try again.'
      render :new
    end
    # debugger
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
