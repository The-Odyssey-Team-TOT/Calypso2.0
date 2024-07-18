Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :chatrooms, except: [:show, :index]

  resources :chatrooms, only: :show do
    resources :messages, only: :create do
      resources :notifications, only: [:index, :show, :destroy]
    end
    resources :walls, only: :show do
      resources :posts, except: :show
    end
    resources :users, only: [:index] do
      member do
        patch :ban
        patch :admin
      end
    end
    resources :chatrooms, only: :index
  end

end
