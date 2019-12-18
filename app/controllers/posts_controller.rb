class PostsController < ApplicationController
  before_action :valid_user, only: [:edit, :update]
  def new
  end

  private

    # Confirms a valid user.
    def valid_user
      unless (user && user.authenticated? &&
              user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end
end
