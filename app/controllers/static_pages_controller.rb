class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @post = current_user.posts.build
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
    #@feed_items = current_user.posts.paginate(page: params[:page], per_page: 1)
  end

  def help; end

  def about; end

  def contact; end
end
