  Collaide::Application.routes.draw do



    localized do
      resources :events, only: [:index, :show] do
        get :old, on: :collection
      end
      resources :results, only: [:index]
      resources :carreers, only: [:index]
      #resources :posts
      resources :users,   :only => [:show]
      resources :portfolios, only: [:index]
      resources :galeries, only: [:index]

      get "about", to: "static_pages#about", as: "about"
      get "contact", to: "static_pages#contact", as: "contact"
      get "help", to: "static_pages#help", as: "help"

      root to: "static_pages#home"

      devise_for :user
    end
    mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  end