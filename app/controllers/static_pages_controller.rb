class StaticPagesController < ApplicationController

  def home
    @posts = Post.published.order('updated_at DESC').includes(:test_image).page(params[:page]).per(15)
    @event = Event.next
    @to_front = Post.a_la_une
  end

  def help
  end

  def about
  end

  def contact
    @contact = Contact.new
  end
end
