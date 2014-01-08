class StaticPagesController < ApplicationController

  def home
    @posts = Post.published.order('updated_at DESC').includes(:test_image).page(params[:page]).per(15)
    @event = Event.next
  end

  def help
  end

  def about
  end

  def contact
  end
end
