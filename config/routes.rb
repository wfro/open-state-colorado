Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show, :update] do
    member do
      post "geolocate"
      get "notifications"
    end
  end
  resources :legislators, only: [:index, :show, :destroy]

  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#omniauth_failure"

  root to: "static_pages#home"
  get "/about", to: "static_pages#about", as: :about
  get "/contact", to: "static_pages#contact", as: :contact

  # custom routes for omniauth
  get "/login", to: redirect("/auth/facebook"), as: :login
  get "/logout", to: "sessions#destroy", as: :logout
end
