Rails.application.routes.draw do
  devise_for :email_ids
  root 'home#index'
  get "/secret", to: "home#secret"

  get "/auth/:provider/callback", to: "sessions#create"
  post "/auth/:provider/callback", to: "sessions#create"

  resources :sessions
end
