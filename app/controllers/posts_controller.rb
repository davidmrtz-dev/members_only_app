class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    #debugger
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

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
