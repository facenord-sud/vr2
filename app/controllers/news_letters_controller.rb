class NewsLettersController < ApplicationController
  def create
    @news_letter = NewsLetter.new email: params[:news_letter][:email]
    if @news_letter.save
      redirect_to root_path, notice: 'Vous avez été abonné à la newsletter'
    else
      @posts = Post.published.order('updated_at DESC').includes(:test_image).page(params[:page]).per(15)
      @event = Event.next
      @to_front = Post.a_la_une
      render 'static_pages/home', notice: 'Abonnement à la newsletter échoué. Veuillez corriger l\'erreur'
    end
  end

  def index
    redirect_to root_path, notice: 'seulement pour les personnes connectés' if current_user.nil?
    @news_letter = NewsLetter.all
  end
end