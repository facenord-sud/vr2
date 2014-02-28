  Collaide::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
    localized do
      resources :objective_lists, only: :index
      resources :events, only: [:index, :show] do
        get :old, on: :collection
      end
      resources :results, only: [:index]
      resources :carreers, only: [:index]
      resources :posts, only: [:show]
      resources :users,   :only => [:show]
      resources :portfolios, only: [:index]
      resources :galeries, only: [:index]

      get "about", to: "static_pages#about", as: "about"
      get "contact", to: "static_pages#contact", as: "contact"
      get "help", to: "static_pages#help", as: "help"
      post 'contacts', to: 'contacts#create', as: 'contacts'
      root to: "static_pages#home"
      resources :news_letters, only: [:index, :create]
      devise_for :user
    end
    mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
    #mount Ckeditor::Engine => '/ckeditor'
  end