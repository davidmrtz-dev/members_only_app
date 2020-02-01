class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create destroy]
  before_action :correct_user_or_admin, only: %i[destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = 'Post updated'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = 'Post deleted'
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  # Before filters

  # Confirms the correct user to destroy.
  def correct_user_or_admin
    post = Post.find(params[:id])
    redirect_to(posts_url) unless current_user?(post.user) || current_user.admin?
  end

  # Confirms the correct user to edit and update
  def correct_user_edit
    post = Post.find(params[:id])
    redirect_to(posts_url) unless current_user?(post.user)
  end
end
