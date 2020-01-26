class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @posts = Post.paginate(page: params[:page], per_page: 20)
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
    params.require(:post).permit(:content)
  end
end
