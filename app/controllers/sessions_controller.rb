class SessionsController < ApplicationController
  before_action :current_user

  def new; end

  def create
    if (self.current_user = User.find_by(email: params[:session][:email]))
      flash[:success] = 'You are succesffully loged in.'
      redirect_to current_user
    else
      flash.now[:failure] = 'Invalid username. Please try again.'
      render :new
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_path
  end
end
