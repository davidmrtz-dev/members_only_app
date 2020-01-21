class SessionsController < ApplicationController
  before_action :current_user

  def new; end

  def create
    if (self.current_user = User.find_by(email: params[:session][:email])&.
      authenticate(params[:session][:password]))
      flash[:success] = 'You succesffully logged in.'
      redirect_to current_user
    else
      flash.now[:failure] = 'Invalid username. Please try again.'
      render :new
    end
    #debugger
  end

  def destroy
    self.current_user = nil
    redirect_to root_path
  end
end
