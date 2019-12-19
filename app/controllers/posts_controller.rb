class PostsController < ApplicationController
  before_action :valid_user, only: %i[new create]
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  private

  # Confirms a valid user.
  def valid_user
    unless @user && @user.authenticated? #&&
           # @user.authenticated?(:reset, params[:id])
      redirect_to root_url
    end
  end
end
