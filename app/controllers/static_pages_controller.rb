class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @post = current_user.posts.build
    @feed_items = current_user.feed
  end

  def about; end

  def contact; end
end
